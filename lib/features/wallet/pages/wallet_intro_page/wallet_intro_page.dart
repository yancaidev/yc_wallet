import 'package:flutter/services.dart';
import 'package:yc_wallet/features/navigation/route_config.dart';
import 'package:yc_wallet/features/wallet/pages/base_page.dart';
import 'package:yc_wallet/features/wallet/pages/wallet_intro_page/widgets/feature_pager.dart';
import 'package:yc_wallet/share/quick_import.dart';

class WalletIntroPage extends BasePage {
  WalletIntroPage(RouteConfig config) : super(config, const _WalletIntro());
}

class _WalletIntro extends StatelessWidget {
  const _WalletIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white,
            child: const FeaturePager(),
          )),
    );
  }
}
