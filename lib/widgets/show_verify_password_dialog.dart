import 'package:yc_wallet/share/quick_import.dart';
import 'package:yc_wallet/widgets/password_pad.dart';

void showVerifyPasswordDialog() {
  showSlideUpDialog(PasswordPad(
    onDone: (password) {
      Log.i("输入完成了……");
    },
    onChange: (password) {
      Log.i("输入的密码是: $password");
    },
    onClose: () {
      hideSlideUpDialog();
    },
  ));
}
