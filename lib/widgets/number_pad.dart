import 'package:yc_wallet/share/quick_import.dart';

/// 数字键盘
/// [keys], numbers to display on the [NumberPad].
///
/// [onNumberKeyPressed], callback when a number key is clicked.
///
/// [onDelete], callback when the delete key is clicked.
class NumberPad extends StatelessWidget {
  final List<int> keys;
  final void Function(int number)? onNumberKeyPressed;
  final void Function()? onDelete;
  const NumberPad({
    required this.keys,
    this.onNumberKeyPressed,
    this.onDelete,
    Key? key,
  }) : super(key: key);

  void _onDelete() {
    if (onDelete != null) {
      onDelete!();
    }
  }

  void _onClickNumber(int number) {
    if (onNumberKeyPressed != null) {
      onNumberKeyPressed!(number);
    }
  }

  List<TableRow> _createRows() {
    final newKeys = List.of(keys);

    final keyboardRows = List<_KeyboardRow>.of([]);
    const columns = 3;
    // keys.length + 1 是因为会多出一个删除按键
    final rows = ((newKeys.length + 1).toDouble() / columns).ceil();
    final cellCount = columns * rows;
    // 空余格子的个数
    final patchCount = cellCount - newKeys.length - 1;
    if (patchCount > 0) {
      // 把空余格子插在最后一行的左侧
      for (int i = 0; i < patchCount; i++) {
        newKeys.insert((rows - 1) * columns + i, -1);
      }
    }
    for (int rowIndex = 0; rowIndex < rows; rowIndex++) {
      final cells = List<_KeyboardCell>.of([]);
      for (int columnIndex = 0; columnIndex < columns; columnIndex++) {
        final cellIndex = rowIndex * columns + columnIndex;
        if (cellIndex == cellCount - 1) {
          cells.add(_KeyboardCell(
            onPress: _onDelete,
            child: const Icon(Icons.arrow_right),
          ));
        } else {
          final number = newKeys[cellIndex];
          final enablePress = number != -1;
          cells.add(_KeyboardCell(
            text: enablePress ? "$number" : "",
            onPress: enablePress ? () => _onClickNumber(number) : null,
          ));
        }
      }
      keyboardRows.add(_KeyboardRow(children: cells));
    }
    return keyboardRows;
  }

  @override
  Widget build(BuildContext context) {
    return Table(
      children: _createRows(),
    );
  }
}

class _KeyboardRow extends TableRow {
  const _KeyboardRow({super.children})
      : super(
          decoration: const BoxDecoration(
            border: BorderDirectional(
              bottom: BorderSide(color: Color(0x11000000)),
            ),
          ),
        );
}

class _KeyboardCell extends StatelessWidget {
  final String text;
  final Widget? child;
  final void Function()? onPress;

  const _KeyboardCell({this.text = "", this.onPress, this.child, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(color: Color(0x99000000), fontSize: 20);
    return SizedBox(
      height: 54,
      child: TextButton(
        onPressed: onPress,
        child: child ?? Text(text, style: textStyle),
      ),
    );
  }
}
