import 'package:yc_wallet/share/quick_import.dart';

class Dot extends StatelessWidget {
  final Color borderColor;
  final Color color;
  final double borderWidth;
  final double width;
  final double height;
  final bool filled;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  const Dot({
    this.filled = false,
    this.borderColor = Colors.black26,
    this.color = Colors.black26,
    this.borderWidth = 1,
    this.width = 12.0,
    this.height = 12.0,
    this.margin,
    this.padding,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
          color: color,
          border: filled
              ? null
              : Border.all(color: borderColor, width: borderWidth),
          borderRadius: BorderRadius.circular(width)),
    );
  }
}
