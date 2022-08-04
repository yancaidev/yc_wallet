import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yc_wallet/features/navigation/route_config.dart';
import 'package:yc_wallet/features/navigation/route_name.dart';
import 'package:yc_wallet/features/wallet/pages/base_page.dart';
import 'package:yc_wallet/share/quick_import.dart';
import 'package:yc_wallet/widgets/base_app_bar.dart';

class SetWalletPasswordPage extends BasePage {
  SetWalletPasswordPage()
      : super(RouteConfig(RouteName.setWalletPassword),
            const _SetWalletPassword());
}

class _SetWalletPassword extends ConsumerStatefulWidget {
  const _SetWalletPassword({Key? key}) : super(key: key);

  @override
  ConsumerState<_SetWalletPassword> createState() => _SetWalletPasswordState();
}

class _SetWalletPasswordState extends ConsumerState<_SetWalletPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        textTitle: "设置密码",
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(children: [
        Center(
          child: Text("jhsjsj23e42"),
        )
      ]),
    );
  }
}
