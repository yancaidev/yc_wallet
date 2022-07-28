import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yc_wallet/features/navigation/route_config.dart';
import 'package:yc_wallet/features/navigation/route_name.dart';
import 'package:yc_wallet/features/navigation/yc_router_delegate.dart';
import 'package:yc_wallet/features/wallet/pages/base_page.dart';
import 'package:yc_wallet/share/quick_import.dart';

class WalletFactoryPage extends BasePage {
  WalletFactoryPage(RouteConfig config) : super(config, const _WalletActions());
}

class _WalletActions extends StatelessWidget {
  const _WalletActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: YCBackButton(),
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
                SizedBox(
                  height: 56,
                  child: ElevatedButton(
                      onPressed: () {
                        YCRouterDetegate.of(context)
                            .push(RouteConfig(RouteName.createWallet));
                      },
                      child: const Text(
                        "创建新钱包",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 56,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shadowColor:
                            MaterialStateProperty.all<Color>(Colors.black12),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black12)),
                    onPressed: () {
                      YCRouterDetegate.of(context)
                          .push(RouteConfig(RouteName.importWallet));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "导入钱包",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "支持任意钱包的助记词或私钥导入",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                        )
                      ],
                    ),
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
