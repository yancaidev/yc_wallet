import 'package:yc_wallet/share/quick_import.dart';

class SheetBox extends StatelessWidget {
  final Widget child;

  const SheetBox({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height * 0.9;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(child: Container()),
        Container(
          constraints: BoxConstraints(maxHeight: maxHeight),
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            color: Colors.white,
          ),
          child: child,
        ),
      ],
    );
  }
}
