import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yc_wallet/share/quick_import.dart';
import 'package:yc_wallet/widgets/base_app_bar.dart';

class QuoteTab extends ConsumerStatefulWidget {
  const QuoteTab({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QuoteTabState();
}

class _QuoteTabState extends ConsumerState<QuoteTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        lightBackground: true,
        backgroundColor: Colors.white,
        textTitle: AppConfig.localized.quote,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
    );
  }
}
