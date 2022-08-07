import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:yc_wallet/features/wallet/pages/create_wallet_page/create_wallet_page.dart';
import 'package:yc_wallet/share/quick_import.dart';
import 'package:yc_wallet/utils/validator.dart';
import 'package:yc_wallet/widgets/text_page_title.dart';

final passwordProvider = StateProvider<String>((ref) {
  return "";
});

final hidePasswordProvider = StateProvider(((ref) => true));
final passwordInputReg = RegExp(r"^\d{0,6}$");
final passwordReg = RegExp(r"^\d{6}$");

class CreateWalletSetPassword extends CreateWalletBaseStep {
  final void Function() onVerifyPassword;
  CreateWalletSetPassword(this.onVerifyPassword, {Key? key})
      : super(3, key: key);

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
                  const TextPageTitle("请设置钱包密码"),
                  const SizedBox(height: 10),
                  const Text("当您忘记交易密码时，可卸载重装后导入您的助记词，以此重新设置交易密码"),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      const Text("设置 6 位纯数字密码"),
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
                    // key: GlobalKey(),
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
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: false),
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
                      Log.i("输入完成，输入的密码为 $password");
                      if (!Validator.shared.isWalletPassword(password)) {
                        Log.e("输入的密码验证不通过 $password");
                        showToast("只能输入纯数字");
                        return;
                      }
                      ref
                          .read(passwordProvider.state)
                          .update((state) => password);
                      onVerifyPassword();
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
