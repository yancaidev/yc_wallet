import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yc_wallet/share/quick_import.dart';
import 'package:yc_wallet/widgets/base_app_bar.dart';
import 'package:yc_wallet/widgets/keep_alive_page_view_child.dart';

class DAppTab extends StatelessWidget {
  const DAppTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = <String>['Tab 1', 'Tab 2'];
    return Scaffold(
      appBar: BaseAppBar(
        lightBackground: true,
        backgroundColor: Colors.white,
        textTitle: "DAPP",
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
    );
  }
}

class DAppTab2 extends ConsumerStatefulWidget {
  const DAppTab2({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DAppTabState();
}

class _DAppTabState extends ConsumerState<DAppTab2>
    with TickerProviderStateMixin {
  final PageController _pageController = PageController();

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: BaseAppBar(),
          body: NestedScrollView(
            headerSliverBuilder: ((context, innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(
                  child: Container(
                    height: 100,
                    color: Colors.black38,
                  ),
                ),
                SliverAppBar(
                  title: const Text("ssss"),
                  centerTitle: true,
                  floating: false,
                  pinned: true,
                  snap: false,
                  leadingWidth: 0,
                ),
              ];
            }),
            body: TabBarView(
              controller: _tabController,
              children: [
                Page2(name: "page 1", color: Colors.amber),
                Page2(name: "page 2", color: Colors.cyan),
                Page2(name: "page 3", color: Colors.orange),
              ],
            ),
          ),
        ));
  }
}

class Page2 extends StatefulWidget {
  final String name;
  final Color color;
  const Page2({Key? key, required this.name, required this.color})
      : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  String get name => widget.name;

  @override
  Widget build(BuildContext context) {
    return KeepAlivePageViewChild(
      child: Container(
        color: widget.color,
        child: ListView(
          physics: AlwaysScrollableScrollPhysics(),
          controller: ScrollController(keepScrollOffset: true),
          key: PageStorageKey(name),
          children: [
            for (int i = 0; i < 50; i++) ListTile(title: Text("$name ，第$i行")),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    Log.i("$name dispose");
  }
}

// [
//             ListView(
//               // physics: PageScrollPhysics(),
//               // controller: ScrollController(keepScrollOffset: true),
//               key: const PageStorageKey("page01"),
//               children: [
//                 for (int i = 0; i < 50; i++)
//                   ListTile(title: Text("page1，第$i行")),
//               ],
//             ),
//             ListView(
//               // controller: ScrollController(keepScrollOffset: true),
//               key: const PageStorageKey("page2"),
//               children: [
//                 for (int i = 0; i < 100; i++)
//                   ListTile(title: Text("page02, 第$i行")),
//               ],
//             ),
//             ListView(
//               key: const PageStorageKey("page3"),
//               // controller: ScrollController(keepScrollOffset: true),
//               children: [
//                 for (int i = 0; i < 50; i++)
//                   ListTile(title: Text("page03, 第$i行")),
//               ],
//             ),
//           ]

// [
//             KeepAlivePageViewChild(
//               key: const Key("1"),
//               child: ListView(
//                 // controller: ScrollController(keepScrollOffset: true),
//                 key: const PageStorageKey("page1"),
//                 children: [
//                   for (int i = 0; i < 50; i++)
//                     ListTile(title: Text("page1，第$i行")),
//                 ],
//               ),
//             ),
//             KeepAlivePageViewChild(
//               child: ListView(
//                 // controller: ScrollController(keepScrollOffset: true),
//                 key: const PageStorageKey("page2"),
//                 children: [
//                   for (int i = 0; i < 100; i++)
//                     ListTile(title: Text("page02, 第$i行")),
//                 ],
//               ),
//             ),
//             KeepAlivePageViewChild(
//               key: const Key("3"),
//               child: ListView(
//                 key: const PageStorageKey("page3"),
//                 // controller: ScrollController(keepScrollOffset: true),
//                 children: [
//                   for (int i = 0; i < 50; i++)
//                     ListTile(title: Text("page03, 第$i行")),
//                 ],
//               ),
//             ),
//           ]
