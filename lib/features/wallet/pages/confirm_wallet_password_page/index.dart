import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yc_wallet/features/navigation/route_config.dart';
import 'package:yc_wallet/features/navigation/route_name.dart';
import 'package:yc_wallet/features/navigation/yc_router_delegate.dart';
import 'package:yc_wallet/features/wallet/pages/base_page.dart';
import 'package:yc_wallet/features/wallet/pages/create_wallet_page/create_wallet_verify_password.dart';
import 'package:yc_wallet/share/quick_import.dart';
import 'package:yc_wallet/widgets/base_app_bar.dart';

/// 导入钱包验证密码
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
  void _onPasswordVerified(BuildContext context) {
    YCRouterDetegate.of(context).push(RouteConfig(RouteName.importWallet));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        textTitle: "设置密码",
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: CreateWalletVerifyPassword(() => _onPasswordVerified(context)),
    );
  }
}
