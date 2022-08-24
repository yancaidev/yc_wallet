import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yc_wallet/features/navigation/route_config.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:yc_wallet/features/navigation/route_name.dart';
import 'package:yc_wallet/features/navigation/yc_router_delegate.dart';
import 'package:yc_wallet/features/wallet/pages/base_page.dart';
import 'package:yc_wallet/share/quick_import.dart';
import 'package:yc_wallet/share/user_settings.dart';
import 'package:yc_wallet/utils/validator.dart';
import 'package:yc_wallet/widgets/base_app_bar.dart';
import 'package:yc_wallet/widgets/text_page_title.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyExsitingPasswordPage extends BasePage {
  VerifyExsitingPasswordPage()
      : super(RouteConfig(RouteName.verifyExistedPassword),
            const _VerifyExsitingPassword());
}

class _VerifyExsitingPassword extends ConsumerStatefulWidget {
  const _VerifyExsitingPassword({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ConfirmWalletPasswordState();
}

class _ConfirmWalletPasswordState
    extends ConsumerState<_VerifyExsitingPassword> {
  @override
  Widget build(BuildContext context) {
    const grayColor = Color(0xffeeeeee);
    return Scaffold(
      appBar: BaseAppBar(
        textTitle: "验证密码",
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Scaffold(
          body: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 30),
                    const SizedBox(height: 30),
                    const Text("请输入钱包密码"),
                    const SizedBox(height: 15),
                    PinCodeTextField(
                      appContext: context,
                      pastedTextStyle: TextStyle(
                        color: Colors.green.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 6,
                      obscureText: true,
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
                        if (Validator.shared
                            .isWalletInputingPassword(password)) {
                          return null;
                        }
                        return "只能输入纯数字";
                      },
                      onCompleted: (password) async {
                        Log.i("验证密码输入完成，输入的密码为 $password");
                        final isRight =
                            await UserSettings.isPasswordRight(password);
                        if (!isRight) {
                          showToast("密码错误");
                          return;
                        }
                        YCRouterDetegate.of(context)
                            .replaceTop(RouteConfig(RouteName.importWallet));
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
      ),
    );
  }
}
