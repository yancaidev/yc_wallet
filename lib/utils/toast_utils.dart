import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:yc_wallet/share/quick_import.dart';

// Future<void> showToast(String? status,
//     {int duration = 400,
//     EasyLoadingToastPosition position = EasyLoadingToastPosition.top}) async {
//   if (status == null || status.isEmpty) return;
//   return EasyLoading.showToast(status,
//       duration: Duration(milliseconds: duration), toastPosition: position);
// }

enum ToastType { error, warn, info }

void showToast(String? status, {ToastType toastType = ToastType.error}) {
  if (status == null || status.isEmpty) return;
  Color backgroundColor = Colors.green;
  switch (toastType) {
    case ToastType.error:
      backgroundColor = Colors.redAccent;
      break;
    case ToastType.warn:
      backgroundColor = Colors.orange;
      break;
    default:
      break;
  }
  SmartDialog.showToast(
    status,
    displayTime: const Duration(milliseconds: 800),
    alignment: Alignment.bottomCenter,
    builder: (context) {
      return IntrinsicHeight(
        child: Card(
          color: backgroundColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: Text(
                status,
                style: const TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ),
        ),
      );
    },
  );
}

void showLoading() {
  SmartDialog.showLoading();
}

void dismissLoading() {
  SmartDialog.dismiss();
}

void showSlideUpDialog(
  Widget child, {
  double width = double.infinity,
  double height = double.infinity,
  String? tag,
}) async {
  SmartDialog.show(
    tag: tag,
    useSystem: true,
    alignment: Alignment.bottomCenter,
    builder: (_) => child,
  );
}

void hideSlideUpDialog({String? tag}) {
  SmartDialog.dismiss(tag: tag);
}
