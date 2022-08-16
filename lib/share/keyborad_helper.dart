import 'package:yc_wallet/share/quick_import.dart';

void hideKeyboard() {
  FocusScope.of(AppConfig.appKey.currentContext!).requestFocus(FocusNode());
}
