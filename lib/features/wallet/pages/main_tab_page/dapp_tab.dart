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
    return DefaultTabController(
      length: tabs.length, // This is the number of tabs.
      child: Scaffold(
        appBar: BaseAppBar(
          lightBackground: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            // These are the slivers that show up in the "outer" scroll view.
            return <Widget>[
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.amber,
                  height: 100,
                ),
              ),
              SliverOverlapAbsorber(
                // This widget takes the overlapping behavior of the SliverAppBar,
                // and redirects it to the SliverOverlapInjector below. If it is
                // missing, then it is possible for the nested "inner" scroll view
                // below to end up under the SliverAppBar even when the inner
                // scroll view thinks it has not been scrolled.
                // This is not necessary if the "headerSliverBuilder" only builds
                // widgets that do not overlap the next sliver.
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  pinned: true,
                  // The "forceElevated" property causes the SliverAppBar to show
                  // a shadow. The "innerBoxIsScrolled" parameter is true when the
                  // inner scroll view is scrolled beyond its "zero" point, i.e.
                  // when it appears to be scrolled below the SliverAppBar.
                  // Without this, there are cases where the shadow would appear
                  // or not appear inappropriately, because the SliverAppBar is
                  // not actually aware of the precise position of the inner
                  // scroll views.
                  forceElevated: innerBoxIsScrolled,
                  leadingWidth: 160,
                  leading: TabBar(
                    labelColor: Colors.white,
                    indicatorSize: TabBarIndicatorSize.label,
                    // These are the widgets to put in each tab in the tab bar.
                    tabs: tabs.map((String name) => Tab(text: name)).toList(),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            // These are the contents of the tab views, below the tabs.
            children: tabs.map((String name) {
              return SafeArea(
                top: false,
                bottom: false,
                child: Builder(
                  // This Builder is needed to provide a BuildContext that is
                  // "inside" the NestedScrollView, so that
                  // sliverOverlapAbsorberHandleFor() can find the
                  // NestedScrollView.
                  builder: (BuildContext context) {
                    return CustomScrollView(
                      // The "controller" and "primary" members should be left
                      // unset, so that the NestedScrollView can control this
                      // inner scroll view.
                      // If the "controller" property is set, then this scroll
                      // view will not be associated with the NestedScrollView.
                      // The PageStorageKey should be unique to this ScrollView;
                      // it allows the list to remember its scroll position when
                      // the tab view is not on the screen.
                      key: PageStorageKey<String>(name),
                      slivers: <Widget>[
                        SliverOverlapInjector(
                          // This is the flip side of the SliverOverlapAbsorber
                          // above.
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.all(8.0),
                          sliver: SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                return Container(
                                  color: Colors.redAccent,
                                  height: 120,
                                  child: ListTile(
                                    title: Text('Item $index'),
                                  ),
                                );
                              },
                              childCount: 30,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ),
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
