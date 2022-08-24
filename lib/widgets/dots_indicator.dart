import 'package:yc_wallet/share/quick_import.dart';
import 'package:yc_wallet/widgets/dot.dart';

class DotsIndicator extends StatelessWidget {
  final int dotsCount;
  final List<int> selectedIndexes;
  const DotsIndicator(this.dotsCount, this.selectedIndexes, {Key? key})
      : super(key: key);

  List<Dot> generateDots() {
    final dots = List<Dot>.of([]);
    for (int i = 0; i < dotsCount; i++) {
      final isFilled = selectedIndexes.contains(i);
      final color = isFilled ? Colors.black26 : Colors.white;
      final isLast = i == dotsCount - 1;
      dots.add(Dot(
        filled: isFilled,
        color: color,
        margin: EdgeInsets.only(right: isLast ? 0 : 6),
      ));
    }
    return dots;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: generateDots(),
    );
  }
}
