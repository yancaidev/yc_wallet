import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yc_wallet/features/wallet/pages/create_wallet_page/create_wallet_page.dart';
import 'package:yc_wallet/features/wallet/wallet_manager.dart';
import 'package:yc_wallet/share/quick_import.dart';

class CreateWalletGenerateMnemonic extends CreateWalletBaseStep {
  const CreateWalletGenerateMnemonic({Key? key}) : super(1, key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "备份助记词",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("请按顺序抄录以下助记词，下一步将验证"),
                  const SizedBox(
                    height: 30,
                  ),
                  const _BackupMnemonic(),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 56,
            child: OutlinedButton(
              onPressed: () {},
              child: const Text(
                "稍后备份",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black87),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 56,
            child: ElevatedButton(
              onPressed: () => nextStep(ref),
              child: const Text(
                "我已备份",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}

class _BackupMnemonic extends StatefulWidget {
  const _BackupMnemonic({Key? key}) : super(key: key);

  @override
  State<_BackupMnemonic> createState() => _BackupMnemonicState();
}

class _BackupMnemonicState extends State<_BackupMnemonic> {
  final int _columns = 3;

  late List<String> _mnemonics;

  int get _wordsCount => _mnemonics.length;

  bool get _is12Words => _wordsCount == 12;

  int get _nextWordsCount => _is12Words ? 24 : 12;

  void _changeWordsCount() {
    _changeMnemonics(_is12Words ? 24 : 12);
  }

  List<String> _generateMnemonics(int wordsCount) {
    final sentence = WalletManager.generateMnemonic(wordsCount);
    return sentence.split(" ");
  }

  void _changeMnemonics(int wordsCount) {
    setState(() {
      _mnemonics = _generateMnemonics(wordsCount);
    });
  }

  @override
  void initState() {
    super.initState();
    _mnemonics = _generateMnemonics(12);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Table(
          border: _MnemonicTableBorder.mnemonicTableBorder(),
          children: [
            for (int row = 0; row < _wordsCount / _columns; row++)
              TableRow(children: [
                for (int column = 0; column < _columns; column++)
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${row * 3 + column + 1}",
                          style: const TextStyle(color: Colors.black38),
                        ),
                        Text(
                          _mnemonics[row * 3 + column],
                          style: const TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  )
              ]),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: _changeWordsCount,
                child: Text("切换 $_nextWordsCount 位助记词")),
            TextButton(
                onPressed: () => _changeMnemonics(_wordsCount),
                child: const Text("换一组"))
          ],
        ),
      ],
    );
  }
}

extension _MnemonicTableBorder on TableBorder {
  static TableBorder mnemonicTableBorder() {
    Color color = Colors.black12;
    double width = 1.0;
    BorderStyle style = BorderStyle.solid;
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(6));
    final BorderSide side =
        BorderSide(color: color, width: width, style: style);
    return TableBorder(
        top: side,
        right: side,
        bottom: side,
        left: side,
        horizontalInside: side,
        verticalInside: side,
        borderRadius: borderRadius);
  }
}
