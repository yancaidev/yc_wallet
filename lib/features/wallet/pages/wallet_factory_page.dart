import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yc_wallet/features/navigation/route_config.dart';
import 'package:yc_wallet/features/navigation/route_name.dart';
import 'package:yc_wallet/features/navigation/yc_router_delegate.dart';
import 'package:yc_wallet/features/wallet/pages/base_page.dart';
import 'package:yc_wallet/features/wallet/pages/create_wallet_page/create_wallet_set_password.dart';
import 'package:yc_wallet/share/providers.dart';
import 'package:yc_wallet/share/quick_import.dart';
import 'package:yc_wallet/share/user_settings.dart';
import 'package:yc_wallet/widgets/base_app_bar.dart';
import 'package:yc_wallet/widgets/buttons.dart';
import 'package:yc_wallet/widgets/password_pad.dart';

class WalletFactoryPage extends BasePage {
  WalletFactoryPage(RouteConfig config) : super(config, const _WalletActions());
}

class _WalletActions extends ConsumerWidget {
  const _WalletActions({Key? key}) : super(key: key);

  /// 点击创建新钱包按钮
  void _onCreateWalletButtonPressed(BuildContext context) {
    YCRouterDetegate.of(context).push(RouteConfig(RouteName.createWallet));
  }

  /// 点击导入钱包按钮回调
  Future<void> _onImportButtonPressed(WidgetRef ref,
      VoidCallback onPasswordNotSet, VoidCallback onPasswordRight) async {
    final passwordSetted = ref.read(appStateProvider).isWalletPasswordSetted;
    if (!passwordSetted) {
      ref.refresh(hidePasswordProvider);
      onPasswordNotSet();
    } else {
      // showSlideUpDialog(PasswordPad(
      //   onClose: hideSlideUpDialog,
      //   onDone: (password) async {
      //     hideSlideUpDialog();
      //     final isRight = await UserSettings.isPasswordRight(password);
      //     if (isRight) {
      //       onPasswordRight();
      //       return;
      //     }
      //     showToast("密码错误");
      //   },
      // ));
      onPasswordRight();
    }
  }

  /// 跳转到设置密码页面
  void _navigateToSetPasswordPage(BuildContext context) {
    YCRouterDetegate.of(context).push(RouteConfig(RouteName.setWalletPassword));
  }

  /// 跳转到导入钱包页面
  void _navigatorToImportPasswordPage(BuildContext context) {
    YCRouterDetegate.of(context).push(RouteConfig(RouteName.importWallet));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const BaseAppBar(
          lightBackground: true, backgroundColor: Colors.white, elevation: 0),
      body: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                elevatedButton(
                  "创建新钱包",
                  onPressed: () => _onCreateWalletButtonPressed(context),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 56,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0x11000000)),
                    ),
                    onPressed: () => _onImportButtonPressed(
                      ref,
                      () => _navigateToSetPasswordPage(context),
                      () => _navigatorToImportPasswordPage(context),
                    ),
                    child: const _DoubleTitlesButton(),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

/// 主副标题按钮
class _DoubleTitlesButton extends StatelessWidget {
  const _DoubleTitlesButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        _MainTitleOfButton("导入钱包"),
        _SubtitleOfButton("支持任意钱包的助记词或私钥导入")
      ],
    );
  }
}

/// 主副标题按钮 - 主标题
class _MainTitleOfButton extends Text {
  const _MainTitleOfButton(String data)
      : super(data,
            style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
                fontWeight: FontWeight.bold));
}

/// 主副标题按钮 - 副标题
class _SubtitleOfButton extends Text {
  const _SubtitleOfButton(String data)
      : super(data,
            style: const TextStyle(fontSize: 12, color: Colors.black54));
}
