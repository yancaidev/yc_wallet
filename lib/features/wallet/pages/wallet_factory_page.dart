import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yc_wallet/features/navigation/route_config.dart';
import 'package:yc_wallet/features/navigation/route_name.dart';
import 'package:yc_wallet/features/navigation/yc_router_delegate.dart';
import 'package:yc_wallet/features/wallet/pages/base_page.dart';
import 'package:yc_wallet/features/wallet/pages/create_wallet_page/create_wallet_set_password.dart';
import 'package:yc_wallet/share/quick_import.dart';
import 'package:yc_wallet/widgets/base_app_bar.dart';
import 'package:yc_wallet/widgets/buttons.dart';

class WalletFactoryPage extends BasePage {
  WalletFactoryPage(RouteConfig config) : super(config, const _WalletActions());
}

class _WalletActions extends ConsumerWidget {
  const _WalletActions({Key? key}) : super(key: key);

  void _navigateToCreateWalletPage(BuildContext context) {
    YCRouterDetegate.of(context).push(RouteConfig(RouteName.createWallet));
  }

  void _navigateToImportWalletPage(BuildContext context) {
    YCRouterDetegate.of(context).push(RouteConfig(RouteName.importWallet));
  }

  void _navToSetPasswordPage(BuildContext context, WidgetRef ref) {
    ref.refresh(hidePasswordProvider);
    YCRouterDetegate.of(context).push(RouteConfig(RouteName.setWalletPassword));
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
                  onPressed: () => _navigateToCreateWalletPage(context),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 56,
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black12)),
                    onPressed: () => _navToSetPasswordPage(context, ref),
                    child: const _DoubleTitlesButton(),
                  ),
                ),
                // OutlinedButton(
                //     onPressed: () {
                //       YCRouterDetegate.of(context)
                //           .push(RouteConfig(RouteName.main));
                //     },
                //     child: const Text("跳过")),
              ],
            )),
      ),
    );
  }
}

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

class _MainTitleOfButton extends Text {
  const _MainTitleOfButton(String data)
      : super(data,
            style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
                fontWeight: FontWeight.bold));
}

class _SubtitleOfButton extends Text {
  const _SubtitleOfButton(String data)
      : super(data,
            style: const TextStyle(fontSize: 12, color: Colors.black54));
}
