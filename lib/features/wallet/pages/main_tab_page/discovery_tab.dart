import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:yc_wallet/repository/database/wallet_database.dart';
import 'package:yc_wallet/share/quick_import.dart';
import 'package:yc_wallet/widgets/base_app_bar.dart';

class DiscoveryTab extends ConsumerStatefulWidget {
  const DiscoveryTab({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DiscoveryTabState();
}

class _DiscoveryTabState extends ConsumerState<DiscoveryTab> {
  @override
  Widget build(BuildContext context) {
    final databaseName = getDatabasePath();

    return Scaffold(
      appBar: BaseAppBar(
        lightBackground: true,
        backgroundColor: Colors.white,
        textTitle: AppConfig.localized.discover,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder<String>(
        builder: (context, snapshot) {
          return Text("数据库路径 ${snapshot.data} ");
        },
        future: databaseName,
      ),
    );
  }
}
