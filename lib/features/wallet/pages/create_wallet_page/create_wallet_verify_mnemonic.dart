import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yc_wallet/features/navigation/route_config.dart';
import 'package:yc_wallet/features/navigation/route_name.dart';
import 'package:yc_wallet/features/navigation/yc_router_delegate.dart';
import 'package:yc_wallet/features/wallet/pages/create_wallet_page/create_wallet_generate_mnemonic.dart';
import 'package:yc_wallet/features/wallet/pages/create_wallet_page/create_wallet_page.dart';
import 'package:yc_wallet/main.dart';
import 'package:yc_wallet/model/wallet_type.dart';
import 'package:yc_wallet/services/wallet_service.dart';
import 'package:yc_wallet/share/providers.dart';
import 'package:yc_wallet/share/quick_import.dart';
import 'package:yc_wallet/share/user_settings.dart';
import 'package:yc_wallet/widgets/buttons.dart';
import 'package:yc_wallet/widgets/password_pad.dart';
import 'package:yc_wallet/widgets/show_verify_password_dialog.dart';
import 'package:yc_wallet/widgets/text_page_title.dart';
import 'package:yc_wallet/extensions/list_ext.dart';

/// 创建钱包第三步 - 验证助记词
class CreateWalletVerifyMnemonic extends CreateWalletBaseStep {
  final _mnemonicStyle = const TextStyle(color: Colors.black87, fontSize: 16);
  final _selectedMnemonicStyle =
      const TextStyle(color: Colors.black45, fontSize: 16);

  final _randomIndexesProvider = StateProvider((ref) {
    final mnemonics = ref.watch(mnemonicsProvider);
    final wordsCount = mnemonics.length;
    final indexes = List<int>.of([]);
    while (indexes.length < 3) {
      int index = Random().nextInt(wordsCount);
      if (!indexes.contains(index)) {
        indexes.add(index);
      }
    }
    return indexes;
  });

  final _messUpMnemonicProvider = StateProvider((ref) {
    final mnemonics = ref.watch(mnemonicsProvider);
    final messList = List.of(mnemonics);
    messList.sort((m1, m2) => Random().nextInt(100) > 30 ? 1 : -1);
    return messList;
  });

  final _pickedWordsProvider = StateProvider<List<String?>>((ref) {
    return List.filled(3, null);
  });

  late final StateProvider<bool> _confirmButtonEnable;

  final void Function() onSkipBackup;
  final void Function() onMnemonicVerified;
  CreateWalletVerifyMnemonic(this.onSkipBackup, this.onMnemonicVerified,
      {Key? key})
      : super(2, key: key) {
    _confirmButtonEnable = StateProvider<bool>((ref) {
      final pickedWords = ref.watch(_pickedWordsProvider);
      return pickedWords.containsNoNull();
    });
  }

  /// 选择 助记词 单词 回调
  void onPickWord(WidgetRef ref, String word) {
    Log.i("选择了 $word");
    final pickedWords = ref.watch(_pickedWordsProvider);
    if (pickedWords.contains(word)) {
      ref.read(_pickedWordsProvider.state).update((state) {
        state[state.indexOf(word)] = null;
        return state.toList();
      });
    } else {
      final firstUnfilledIndex = pickedWords.firstIndex(null);
      if (firstUnfilledIndex != null) {
        ref.read(_pickedWordsProvider.state).update((state) {
          state[firstUnfilledIndex] = word;
          return state.toList();
        });
      }
    }
  }

  /// 点击了待验证单词中的按钮
  void _onClickPickedWord(WidgetRef ref, String word) {
    ref.read(_pickedWordsProvider.state).update((state) {
      state[state.indexOf(word)] = null;
      return state.toList();
    });
  }

  /// 点击了确认按钮，如果助记词验证成功，跳转到设置密码页面，否则重新选择助记词，
  /// 验证用户确实备份了助记词
  void _onClickConfirmButton(
      WidgetRef ref, bool isRight, VoidCallback onPasswordRight) {
    Log.i("Confirm button is clicked. Mnemonic is $isRight");
    if (!isRight) {
      showToast("助记词验证失败");
      ref
          .read(_pickedWordsProvider.state)
          .update((state) => List.filled(3, null));
      return;
    }
    if (!ref.read(appStateProvider).isWalletPasswordSetted) {
      onMnemonicVerified();
      return;
    }
    showSlideUpDialog(PasswordPad(
      onClose: hideSlideUpDialog,
      onDone: (password) async {
        hideSlideUpDialog();
        final isRight = await UserSettings.isPasswordRight(password);
        if (isRight) {
          final mnemonicWords = ref.read(mnemonicsProvider);
          await saveWalletFromWalletType(
            ref,
            WalletType.fromMnemonicWords(mnemonicWords),
            password,
            true,
          );
          onPasswordRight();
          return;
        }
        showToast("密码错误");
      },
    ));
  }

  /// 点击了“稍候备份”按钮，跳过助记词验证
  void _onSkipBackupMnemonicButtonPressed(
      WidgetRef ref, VoidCallback onRightPassowrd) async {
    final isPasswordSet = ref.read(appStateProvider).isWalletPasswordSetted;
    if (isPasswordSet) {
      showSlideUpDialog(
        PasswordPad(
          onClose: hideSlideUpDialog,
          onDone: (password) async {
            hideSlideUpDialog();
            final isPasswordRight =
                await UserSettings.isPasswordRight(password);
            if (isPasswordRight) {
              onRightPassowrd();
              return;
            }
            showToast("密码错误");
          },
        ),
      );
      return;
    }
    onSkipBackup();
  }

  /// 跳转到 MainPage
  void _navigateToMainPage(BuildContext context) {
    YCRouterDetegate.of(context).clearAndPush(RouteConfig.main());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mnemonicWords = ref.watch(mnemonicsProvider);
    final messupWords = ref.watch(_messUpMnemonicProvider);
    final mnemonicIndexes = ref.watch(_randomIndexesProvider);
    final pickedWords = ref.watch(_pickedWordsProvider);
    final isConfirmButtonEnable = ref.watch(_confirmButtonEnable);
    Log.i("需要验证的助记词的下标 $mnemonicIndexes");
    var size = MediaQuery.of(context).size;
    const double itemHeight = 64;
    final double itemWidth = (size.width - 30) / 3.0;
    final ratio = itemWidth / itemHeight;
    final rightWords =
        mnemonicIndexes.map((index) => mnemonicWords[index]).toList().join(" ");
    Log.i("正确的助记词验证词是 $rightWords");
    final selectedWords = pickedWords.join(" ");
    final isRight = rightWords == selectedWords;

    Log.i(
        "Words to verify is $rightWords, User picked words are $selectedWords");
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 30),
          const TextPageTitle("验证助记词"),
          const SizedBox(height: 10),
          const Text("请按序号选择正确的助记词"),
          const SizedBox(height: 16),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              for (int i = 0; i < mnemonicIndexes.length; i++)
                _PickedWordToVerify(
                  mnemonicIndexes[i] + 1,
                  pickedWords[i] ?? "",
                  // 三个验证词都已填充，都不需要获取焦点，如果遇到第一个为空的验证词，则该验证词所在位置默认取得焦点
                  (pickedWords.containsNoNull()
                      ? false
                      : (pickedWords.firstIndex(null) ?? 0) == i),
                  (word) => _onClickPickedWord(ref, word),
                )
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
              child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: ratio,
            ),
            children: messupWords
                .map((word) => Padding(
                      padding: const EdgeInsets.all(5),
                      child: OutlinedButton(
                          onPressed: () => onPickWord(ref, word),
                          child: Text(word,
                              style: pickedWords.contains(word)
                                  ? _selectedMnemonicStyle
                                  : _mnemonicStyle)),
                    ))
                .toList(),
          )),
          // outlinedButton(
          //   "稍候备份",
          //   onPressed: () => _onSkipBackupMnemonicButtonPressed(
          //     ref,
          //     () => _navigateToMainPage(context),
          //   ),
          // ),
          const SizedBox(height: 10),
          elevatedButton(
            "确认",
            onPressed: isConfirmButtonEnable
                ? () => _onClickConfirmButton(
                      ref,
                      isRight,
                      () => _navigateToMainPage(context),
                    )
                : null,
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

/// 用于展示用户选择的验证词
class _PickedWordToVerify extends StatelessWidget {
  final int number;
  final String? word;
  final bool focused;
  final void Function(String word) onClickPickedWord;

  const _PickedWordToVerify(
      this.number, this.word, this.focused, this.onClickPickedWord,
      {Key? key})
      : super(key: key);

  void _onClickPickedWord() {
    if (word == null) return;
    onClickPickedWord(word!);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "第$number个",
              style: const TextStyle(fontSize: 12, color: Colors.black87),
            ),
            const SizedBox(height: 4),
            SizedBox(
              height: 44,
              child: OutlinedButton(
                onPressed: _onClickPickedWord,
                style: OutlinedButton.styleFrom(
                    backgroundColor: const Color(0xfffafafa),
                    side: BorderSide(
                        color: focused
                            ? Theme.of(context).primaryColor
                            : Colors.black12)),
                child: Text(
                  word ?? "",
                  style: const TextStyle(color: Colors.black87, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 10)
      ],
    );
  }
}
