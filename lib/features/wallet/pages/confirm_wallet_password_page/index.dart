import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yc_wallet/features/navigation/route_config.dart';
import 'package:yc_wallet/features/navigation/route_name.dart';
import 'package:yc_wallet/features/wallet/pages/base_page.dart';
import 'package:yc_wallet/share/quick_import.dart';

class ConfirmWalletPasswordPage extends BasePage {
  ConfirmWalletPasswordPage()
      : super(RouteConfig(RouteName.confirmWalletPassword),
            const _ConfirmWalletPassword());
}

class _ConfirmWalletPassword extends ConsumerStatefulWidget {
  const _ConfirmWalletPassword({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ConfirmWalletPasswordState();
}

class _ConfirmWalletPasswordState
    extends ConsumerState<_ConfirmWalletPassword> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("确认密码"),
    );
  }
}
