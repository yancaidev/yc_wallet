import 'package:flutter/material.dart';
import 'package:yc_wallet/features/navigation/route_config.dart';
import 'package:yc_wallet/features/wallet/pages/base_page.dart';
import 'package:yc_wallet/widgets/base_app_bar.dart';

class ImportWalletPage extends BasePage {
  ImportWalletPage(RouteConfig config) : super(config, const _ImportWallet());
}

class _ImportWallet extends StatelessWidget {
  const _ImportWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(
          textTitle: "导入钱包",
          lightBackground: true,
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: const Center(
          child: Text("导入钱包"),
        ));
  }
}
