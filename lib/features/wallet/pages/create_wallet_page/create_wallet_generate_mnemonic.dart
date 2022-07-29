import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yc_wallet/features/navigation/route_config.dart';
import 'package:yc_wallet/features/navigation/yc_router_delegate.dart';
import 'package:yc_wallet/features/wallet/pages/create_wallet_page/create_wallet_page.dart';
import 'package:yc_wallet/features/wallet/wallet_manager.dart';
import 'package:yc_wallet/share/quick_import.dart';
import 'package:yc_wallet/widgets/buttons.dart';
import 'package:yc_wallet/widgets/size_box_height_only.dart';
import 'package:yc_wallet/widgets/text_page_title.dart';

final mnemonicsProvider = StateProvider<List<String>>(
    (ref) => WalletManager.generateMnemonicWords(12));
final shouldHideMnemonics = StateProvider((ref) => false);

class CreateWalletGenerateMnemonic extends CreateWalletBaseStep {
  final GlobalKey globalKey = GlobalKey<_BackupMnemonicState>();
  CreateWalletGenerateMnemonic({Key? key}) : super(1, key: key);

  void _onPressAllreadyBackupButton(WidgetRef ref) {
    ref.read(shouldHideMnemonics.state).state = true;
    nextStep(ref);
  }

  void _onSkipBackupMnemonic(BuildContext context) {
    YCRouterDetegate.of(context).clearAndPush(RouteConfig.main());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBoxHeightOnly(30),
                  const TextPageTitle("备份助记词"),
                  const SizedBox(height: 10),
                  const Text("请按顺序抄录以下助记词，下一步将验证"),
                  const SizedBox(height: 30),
                  _BackupMnemonic(key: globalKey),
                ],
              ),
            ),
          ),
          outlinedButton("稍后备份",
              onPressed: () => _onSkipBackupMnemonic(context)),
          const SizedBox(height: 10),
          elevatedButton("我已备份",
              onPressed: () => _onPressAllreadyBackupButton(ref)),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

class _BackupMnemonic extends ConsumerStatefulWidget {
  const _BackupMnemonic({Key? key}) : super(key: key);

  @override
  ConsumerState<_BackupMnemonic> createState() => _BackupMnemonicState();
}

class _BackupMnemonicState extends ConsumerState<_BackupMnemonic> {
  final int _columns = 3;

  List<String> get _mnemonics => ref.read(mnemonicsProvider.state).state;

  int get _wordsCount => _mnemonics.length;

  bool get _is12Words => _wordsCount == 12;

  int get _nextWordsCount => _is12Words ? 24 : 12;

  void _changeWordsCount(WidgetRef ref) {
    ref.read(shouldHideMnemonics.state).state = false;
    _changeMnemonics(ref, _is12Words ? 24 : 12);
  }

  List<String> _generateMnemonics(int wordsCount) {
    ref.read(shouldHideMnemonics.state).state = false;
    final sentence = WalletManager.generateMnemonic(wordsCount);
    return sentence.split(" ");
  }

  void _changeMnemonics(WidgetRef ref, int wordsCount) {
    ref.read(mnemonicsProvider.state).state = _generateMnemonics(wordsCount);
  }

  @override
  void initState() {
    super.initState();
    Log.i("init state..........");
  }

  @override
  Widget build(BuildContext context) {
    Log.i("build.............");
    final mnemonicWords = ref.watch(mnemonicsProvider);
    final shouldHideMnemonic = ref.watch(shouldHideMnemonics);
    return Column(
      children: [
        !shouldHideMnemonic
            ? Table(
                border: _MnemonicTableBorder.mnemonicTableBorder(),
                children: [
                  for (int row = 0; row < _wordsCount / _columns; row++)
                    TableRow(children: [
                      for (int column = 0; column < _columns; column++)
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${row * 3 + column + 1}",
                                  style:
                                      const TextStyle(color: Colors.black38)),
                              Text(mnemonicWords[row * 3 + column],
                                  style: const TextStyle(fontSize: 16)),
                            ],
                          ),
                        )
                    ]),
                ],
              )
            : Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(6)),
                child: const Text("隐藏"),
              ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () => _changeWordsCount(ref),
                child: Text("切换 $_nextWordsCount 位助记词")),
            TextButton(
                onPressed: () => _changeMnemonics(ref, _wordsCount),
                child: const Text("换一组"))
          ],
        ),
      ],
    );
  }

  @override
  void deactivate() {
    super.deactivate();
    Log.i("deactive……...........");
  }
}

extension _MnemonicTableBorder on TableBorder {
  static TableBorder mnemonicTableBorder() {
    Color color = Colors.black12;
    double width = 1.0;
    BorderStyle style = BorderStyle.solid;
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(6));
    final BorderSide side =
        BorderSide(color: color, width: width, style: style);
    return TableBorder(
        top: side,
        right: side,
        bottom: side,
        left: side,
        horizontalInside: side,
        verticalInside: side,
        borderRadius: borderRadius);
  }
}
