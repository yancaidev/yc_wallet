import 'package:flutter/material.dart';
import 'package:yc_wallet/features/navigation/route_name.dart';

abstract class BasePage<T> extends MaterialPage<T> {
  BasePage(RouteName routeName, Widget child,
      {bool maintainState = true,
      bool fullscreenDialog = true,
      Object? arguments,
      String? restorationId})
      : super(
            child: child,
            maintainState: maintainState,
            fullscreenDialog: fullscreenDialog,
            key: ValueKey(routeName.path),
            name: routeName.path,
            arguments: arguments,
            restorationId: restorationId);
}
