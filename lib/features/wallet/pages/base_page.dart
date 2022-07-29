import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yc_wallet/features/navigation/route_config.dart';
import 'package:yc_wallet/share/quick_import.dart';

abstract class BasePage<T> extends MaterialPage<T> {
  final RouteConfig config;

  BasePage(this.config, Widget child,
      {bool maintainState = true,
      bool fullscreenDialog = true,
      Object? arguments,
      String? restorationId})
      : super(
            child: child,
            maintainState: maintainState,
            fullscreenDialog: fullscreenDialog,
            key: ValueKey(config.routeName.path),
            name: config.routeName.path,
            arguments: arguments,
            restorationId: restorationId);

  @override
  Route<T> createRoute(BuildContext context) {
    config.isRouteCreated = true;
    return super.createRoute(context);
  }

  void onBecomingTop() {
    Log.i("$this is at the top now. ${config.isRouteCreated}");
  }

  void onLeavingTop() {
    Log.i("$this is not the top route any more.");
  }

  bool onBackPressed() {
    return true;
  }
}

/// 自定义动画效果
// class BasePage<T> extends Page<T> {
//   final Widget child;
//   BasePage(RouteName routeName, this.child,
//       {Object? arguments, String? restorationId})
//       : super(
//             key: ValueKey(routeName.path),
//             name: routeName.path,
//             arguments: arguments,
//             restorationId: restorationId);

//   @override
//   Route<T> createRoute(BuildContext context) {
//     return PageRouteBuilder(
//       settings: this,
//       pageBuilder: (context, animation, animation2) {
//         final tween = Tween(begin: const Offset(1.0, 0.0), end: Offset.zero);
//         final curveTween = CurveTween(curve: Curves.easeInOut);
//         return SlideTransition(
//           position: animation.drive(curveTween).drive(tween),
//           child: AnnotatedRegion(
//               value: SystemUiOverlayStyle(
//                   statusBarColor: Theme.of(context).backgroundColor),
//               child: child),
//         );
//       },
//     );
//   }
// }