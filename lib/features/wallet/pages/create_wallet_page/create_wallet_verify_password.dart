import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:yc_wallet/features/navigation/route_config.dart';
import 'package:yc_wallet/features/navigation/yc_router_delegate.dart';
import 'package:yc_wallet/features/wallet/pages/create_wallet_page/create_wallet_page.dart';
import 'package:yc_wallet/share/quick_import.dart';
import 'package:yc_wallet/utils/validator.dart';
import 'package:yc_wallet/widgets/text_page_title.dart';

import 'create_wallet_set_password.dart';

class CreateWalletVerifyPassword extends CreateWalletBaseStep {
  final void Function() onPasswordSetted;
  CreateWalletVerifyPassword(this.onPasswordSetted, {Key? key})
      : super(4, key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hidePassowd = ref.watch(hidePasswordProvider);
    const grayColor = Color(0xffeeeeee);

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Scaffold(
        body: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 30),
                  const TextPageTitle("验证密码"),
                  const SizedBox(height: 10),
                  const Text("请再次输入钱包密码"),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      const Text("验证 6 位纯数字密码"),
                      const SizedBox(width: 10),
                      GestureDetector(
                        child: Icon(hidePassowd
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined),
                        onTap: () {
                          ref
                              .read(hidePasswordProvider.state)
                              .update((state) => !state);
                        },
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  PinCodeTextField(
                    appContext: context,
                    pastedTextStyle: TextStyle(
                      color: Colors.green.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                    length: 6,
                    obscureText: hidePassowd,
                    blinkWhenObscuring: true,
                    animationType: AnimationType.fade,
                    autoFocus: true,
                    pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderWidth: 1,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 40,
                        fieldWidth: 40,
                        activeColor: grayColor,
                        inactiveColor: grayColor,
                        selectedColor: Theme.of(context).primaryColor,
                        inactiveFillColor: grayColor,
                        activeFillColor: grayColor,
                        selectedFillColor: grayColor),
                    cursorColor: Colors.black,
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    keyboardType: TextInputType.number,
                    boxShadows: const [
                      BoxShadow(
                        offset: Offset(0, 1),
                        color: Colors.black12,
                        blurRadius: 2,
                      )
                    ],
                    validator: (password) {
                      if (Validator.shared.isWalletInputingPassword(password)) {
                        return null;
                      }
                      return "只能输入纯数字";
                    },
                    onCompleted: (password) {
                      Log.i("验证密码输入完成，输入的密码为 $password");
                      final pwd = ref.read(passwordProvider);
                      if (pwd != password) {
                        showToast("两次输入的密码不一致");
                        Log.e("两次输入的密码不一致，请重新输入", context);
                        return;
                      }
                      onPasswordSetted();
                      // YCRouterDetegate.of(context)
                      // .clearAndPush(RouteConfig.main());
                    },
                    // onTap: () {
                    //   print("Pressed");
                    // },
                    onChanged: (value) {
                      Log.i("输入的密码为 $value");
                    },
                    beforeTextPaste: (text) {
                      return Validator.shared.isWalletPassword(text);
                    },
                  ),
                ])),
      ),
    );
  }
}
