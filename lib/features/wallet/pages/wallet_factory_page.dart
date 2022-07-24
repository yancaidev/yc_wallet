import 'package:flutter/material.dart';
import 'package:yc_wallet/features/navigation/route_config.dart';
import 'package:yc_wallet/features/navigation/route_name.dart';
import 'package:yc_wallet/features/navigation/yc_router_delegate.dart';
import 'package:yc_wallet/features/wallet/pages/base_page.dart';

class WalletFactoryPage extends BasePage {
  WalletFactoryPage() : super(RouteName.home, const _WalletActions());
}

class _WalletActions extends StatelessWidget {
  const _WalletActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Align(
      alignment: FractionalOffset.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
              onPressed: () {
                YCRouterDetegate.of(context)
                    .push(RouteConfig(RouteName.importWallet));
              },
              child: const Text("导入钱包")),
          TextButton(
              onPressed: () {
                YCRouterDetegate.of(context)
                    .push(RouteConfig(RouteName.createWallet));
              },
              child: const Text("创建钱包")),
          TextButton(onPressed: () {}, child: const Text("跳过"))
        ],
      ),
    ));
  }
}
