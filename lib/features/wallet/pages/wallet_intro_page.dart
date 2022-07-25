import 'package:flutter/services.dart';
import 'package:yc_wallet/features/navigation/route_name.dart';
import 'package:yc_wallet/features/wallet/pages/base_page.dart';
import 'package:yc_wallet/share/quick_import.dart';

class WalletIntroPage extends BasePage {
  WalletIntroPage() : super(RouteName.walletIntro, const _WalletIntro());
}

class _WalletIntro extends StatelessWidget {
  const _WalletIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.blue,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.blue,
          systemNavigationBarIconBrightness: Brightness.light),
      child: Scaffold(
          body: Container(
        height: double.infinity,
        width: double.infinity,
        // decoration: BoxDecoration(color: Colors.blue),
        color: Colors.blue,
        child: const _Pages(),
      )),
    );
  }
}

class _Pages extends StatelessWidget {
  const _Pages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: const [
        Center(
          child: Text(
            "功能描述一",
            style: TextStyle(color: Colors.white),
          ),
        ),
        Center(
          child: Text(
            "功能描述二",
            style: TextStyle(color: Colors.white),
          ),
        ),
        Center(
          child: Text(
            "功能描述三",
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
