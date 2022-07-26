import 'package:yc_wallet/features/navigation/route_config.dart';
import 'package:yc_wallet/features/navigation/route_name.dart';
import 'package:yc_wallet/features/navigation/yc_router_delegate.dart';
import 'package:yc_wallet/share/quick_import.dart';

class CreateWalletVerifyPassword extends StatelessWidget {
  const CreateWalletVerifyPassword({Key? key}) : super(key: key);

  void navigateToMainPage(BuildContext context) {
    YCRouterDetegate.of(context).push(RouteConfig(RouteName.main));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text("确认密码！！！"),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () => navigateToMainPage(context),
              child: const Text("下一步")),
        ],
      ),
    );
  }
}
