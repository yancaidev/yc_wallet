import 'package:yc_wallet/share/quick_import.dart';

class DefaultOutlinedButton extends OutlinedButton {
  DefaultOutlinedButton(String title,
      {Key? key, required VoidCallback? onPressed})
      : super(
            key: key,
            onPressed: onPressed,
            child: Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black87),
            ));
}

class DefaultElevatedButton extends ElevatedButton {
  DefaultElevatedButton(String title,
      {Key? key, required VoidCallback? onPressed})
      : super(
            key: key,
            onPressed: onPressed,
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ));
}

SizedBox outlinedButton(
  String title, {
  Key? key,
  required VoidCallback? onPressed,
  VoidCallback? onLongPress,
  ValueChanged<bool>? onHover,
  ValueChanged<bool>? onFocusChange,
  ButtonStyle? style,
  FocusNode? focusNode,
  bool autofocus = false,
  Clip clipBehavior = Clip.none,
}) {
  return SizedBox(
      height: 56,
      child: OutlinedButton(
        key: key,
        onPressed: onPressed,
        onLongPress: onLongPress,
        onHover: onHover,
        onFocusChange: onFocusChange,
        style: style,
        focusNode: focusNode,
        autofocus: autofocus,
        clipBehavior: clipBehavior,
        child: Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87),
        ),
      ));
}

SizedBox elevatedButton(
  String title, {
  Key? key,
  required VoidCallback? onPressed,
  VoidCallback? onLongPress,
  ValueChanged<bool>? onHover,
  ValueChanged<bool>? onFocusChange,
  ButtonStyle? style,
  FocusNode? focusNode,
  bool autofocus = false,
  Clip clipBehavior = Clip.none,
}) {
  return SizedBox(
    height: 56,
    child: ElevatedButton(
      key: key,
      onPressed: onPressed,
      onLongPress: onLongPress,
      onHover: onHover,
      onFocusChange: onFocusChange,
      style: style,
      focusNode: focusNode,
      autofocus: autofocus,
      clipBehavior: clipBehavior,
      child: Text(
        title,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
      ),
    ),
  );
}
