import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).primaryColor,
          systemNavigationBarColor: Colors.purpleAccent, // navigation bar color
          statusBarIconBrightness: Brightness.light, // status bar icons' color
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                    onPressed: () {
                      YCRouterDetegate.of(context)
                          .push(RouteConfig(RouteName.importWallet));
                    },
                    child: const Text("导入钱包")),
                ElevatedButton(
                    onPressed: () {
                      YCRouterDetegate.of(context)
                          .push(RouteConfig(RouteName.createWallet));
                    },
                    child: const Text("创建钱包")),
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
