import 'dart:async';

import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:web3dart/web3dart.dart';
import 'package:yc_wallet/features/navigation/route_config.dart';
import 'package:yc_wallet/features/wallet/pages/base_page.dart';
import 'package:yc_wallet/features/wallet/pages/create_wallet_page/create_wallet_set_password.dart';
import 'package:yc_wallet/features/wallet/wallet_manager.dart';
import 'package:yc_wallet/model/simple_exception.dart';
import 'package:yc_wallet/model/wallet_type.dart';
import 'package:yc_wallet/share/quick_import.dart';
import 'package:yc_wallet/widgets/base_app_bar.dart';
import 'package:yc_wallet/widgets/buttons.dart';
import 'package:yc_wallet/widgets/text_page_title.dart';

class ImportWalletPage extends BasePage {
  ImportWalletPage(RouteConfig config) : super(config, const _ImportWallet());
}

class _ImportWallet extends ConsumerStatefulWidget {
  const _ImportWallet({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ImportWalletState();
}

class _ImportWalletState extends ConsumerState<_ImportWallet> {
  late String formattedInputValue = "";
  late StreamSubscription<bool> keyboardSubscription;
  final _confirmButtonEnableProvider = StateProvider<bool>((ref) => false);

  @override
  void initState() {
    super.initState();
    final keyboardVisibilityController = KeyboardVisibilityController();
    keyboardSubscription =
        keyboardVisibilityController.onChange.listen((visible) {
      if (!visible) {
        _onEditComplete();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final isEnable = ref.watch(_confirmButtonEnableProvider);
    return Scaffold(
        appBar: const BaseAppBar(
          textTitle: "导入钱包",
          lightBackground: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: screenHeight - 100),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 10),
                    const TextPageTitle("输入助记词或私钥"),
                    const SizedBox(height: 10),
                    Card(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.black12),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 16, bottom: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextField(
                                onChanged: _onEditingChanged,
                                onEditingComplete: _onEditComplete,
                                textInputAction: TextInputAction.done,
                                maxLines: 4,
                                decoration: const InputDecoration.collapsed(
                                    hintText:
                                        "助记词之间用空格隔开。支持 12 位，24 位英文助记词导入，支持明文私钥导入。"),
                              ),
                              IconButton(
                                  alignment: Alignment.bottomRight,
                                  onPressed: () {
                                    showToast("待完成", toastType: ToastType.warn);
                                  },
                                  icon: const Icon(Icons.qr_code_scanner)),
                            ],
                          )),
                    ),
                    const SizedBox(height: 30),
                    elevatedButton(
                      "确认导入",
                      onPressed: !isEnable ? null : _parseWallet,
                    ),
                    Expanded(child: Container()),
                    Card(
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(6)),
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 16, bottom: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text("提示"),
                              TipsText("• xxx不会记录您的助记词和私钥，权限用户自管，资产由您掌控。"),
                              TipsText("• 建议您不要直接复制粘贴助记词或私钥，以防第三方软件监控导致资产丢失。"),
                              TipsText("• 建议您手写输入或扫码导入您的助记词或私钥。"),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  @override
  void dispose() {
    keyboardSubscription.cancel();
    super.dispose();
  }

  /// 输入内容变化监听，记录当前输入值，并去掉收尾空白字符，连续的空白字符转化为空格
  void _onEditingChanged(String value) {
    final regExp = RegExp(r"\s+");
    formattedInputValue =
        value.toLowerCase().trim().replaceAllMapped(regExp, (match) {
      return " ";
    });
    Log.i("输入的内容变化 $value");
    if (formattedInputValue.startsWith("0x")) {
      formattedInputValue =
          formattedInputValue.substring(2, formattedInputValue.length);
    }

    ref.read(_confirmButtonEnableProvider.state).state =
        formattedInputValue.isNotEmpty;
  }

  void _hideKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  /// 内容输入完成，或者键盘隐藏
  void _onEditComplete() {
    Log.i("输入完成了 $formattedInputValue");
    _hideKeyboard();
  }

  Future<Wallet?> _stringToWalletType() async {
    return Future.delayed(const Duration(milliseconds: 300), () {
      WalletType? walletType;
      if (formattedInputValue.contains(" ")) {
        final words = formattedInputValue.split(" ");
        if (words.length == 12) {
          Log.i("输入了 12 位 或者 14 位助记词");
          walletType = WalletType.mnemonic12(words: words);
        } else if (words.length == 24) {
          walletType = WalletType.mnemonic24(words: words);
        } else {
          Log.e("输入了错误的助记词");
          walletType = null;
          showToast("请输入正确的助记词");
        }
      } else if (formattedInputValue.length == 64) {
        Log.i("输入了私钥 $formattedInputValue");
        walletType = WalletType.privateKey(privateKey: formattedInputValue);
      } else {
        showToast("请输入正确的助记词或私钥");
        walletType = null;
      }
      final password = ref.read(passwordProvider);
      if (walletType == null) return null;
      try {
        final wallet = WalletManager.fromWalletType(
            walletType: walletType, password: password);
        Log.i("钱包导入成功 ${wallet.toJson()}");
        return wallet;
      } catch (e) {
        final exp = e as SimpleException;
        showToast(exp.message);
        return null;
      }
    });
  }

  /// 助记词或者私钥转换为钱包
  void _parseWallet() async {
    _hideKeyboard();
    showLoading();
    final wallet = await _stringToWalletType();
    dismissLoading();
    Log.i("333");
  }
}

class TipsText extends Text {
  const TipsText(String data, {Key? key})
      : super(data, key: key, style: const TextStyle(color: Color(0xAA000000)));
}
