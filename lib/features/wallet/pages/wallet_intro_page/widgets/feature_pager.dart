import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yc_wallet/features/navigation/route_config.dart';
import 'package:yc_wallet/features/navigation/route_name.dart';
import 'package:yc_wallet/features/navigation/yc_router_delegate.dart';
import 'package:yc_wallet/main.dart';
import 'package:yc_wallet/share/quick_import.dart';
import 'package:yc_wallet/share/user_settings.dart';
import 'package:yc_wallet/utils/scroll_behavior_none.dart';

import 'feature_page.dart';

final _currentPageProvider = StateProvider((ref) => 0);

class FeaturePager extends ConsumerStatefulWidget {
  const FeaturePager({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _FeaturePagerState();
  }
}

class _FeaturePagerState extends ConsumerState<FeaturePager> {
  final PageController _pageController = PageController();

  void _onClickNextStep(BuildContext context, int currentPage) {
    if (currentPage < 2) {
      Log.i("跳转到 ${currentPage + 1}");
      _pageController.animateToPage(currentPage + 1,
          duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
    } else {
      YCRouterDetegate.of(context).push(RouteConfig(RouteName.home));
      Log.i("跳转到11");
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentPage = ref.watch(_currentPageProvider);

    return Stack(
      children: [
        PageView(
          controller: _pageController,
          scrollBehavior: ScrollBehaviorNone(),
          children: const [
            FeaturePage(0),
            FeaturePage(1),
            FeaturePage(2),
          ],
          onPageChanged: (page) {
            ref.read(_currentPageProvider.state).update((state) => page);
          },
        ),
        Container(
          constraints: const BoxConstraints.expand(
              width: double.infinity, height: double.infinity),
          alignment: AlignmentDirectional.bottomCenter,
          padding: const EdgeInsets.only(bottom: 30),
          child: _FeaturePageDotsIndicator(currentPage, _onClickNextStep),
        ),
      ],
    );
  }
}

class _FeaturePageDotsIndicator extends ConsumerWidget {
  final int position;
  final void Function(BuildContext context, int currentPage) onClickNext;
  const _FeaturePageDotsIndicator(this.position, this.onClickNext, {Key? key})
      : super(key: key);

  void _save(BuildContext context, WidgetRef ref) {
    YCRouterDetegate.of(context).push(RouteConfig.home());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
            onPressed: () => _save(context, ref),
            child: const Text("跳过", style: TextStyle(color: Colors.black87))),
        DotsIndicator(
          dotsCount: 3,
          position: position.toDouble(),
          decorator: const DotsDecorator(
              color: Colors.black26,
              shape: RoundedRectangleBorder(),
              activeShape: RoundedRectangleBorder(),
              size: Size(30, 2),
              activeSize: Size(30, 2),
              spacing: EdgeInsets.all(2)),
        ),
        TextButton(
            onPressed: () => onClickNext(context, position),
            child: Icon(
              Icons.arrow_circle_right,
              color: Theme.of(context).primaryColor,
            )),
      ],
    );
  }
}
