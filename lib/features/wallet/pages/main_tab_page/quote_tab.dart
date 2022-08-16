import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yc_wallet/share/quick_import.dart';

class QuoteTab extends ConsumerStatefulWidget {
  const QuoteTab({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuoteTabState();
}

class _QuoteTabState extends ConsumerState<QuoteTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("行情"),
    );
  }
}
