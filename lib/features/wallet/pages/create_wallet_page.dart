import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yc_wallet/features/navigation/route_name.dart';
import 'package:yc_wallet/features/wallet/pages/base_page.dart';

class CreateWalletPage extends BasePage {
  CreateWalletPage() : super(RouteName.createWallet, const _CreateWallet());
}

class _CreateWallet extends StatelessWidget {
  const _CreateWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
        value: const SystemUiOverlayStyle(statusBarColor: Colors.blue),
        child: Scaffold(
          appBar: AppBar(title: const Text("创建钱包")),
          body: const Center(
            child: Text("创建钱包"),
          ),
        ));
  }
}
