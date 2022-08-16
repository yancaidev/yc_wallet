import 'package:yc_wallet/share/quick_import.dart';

class RoundedOutlinedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  const RoundedOutlinedButton({
    Key? key,
    required this.child,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        primary: Colors.black87,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
