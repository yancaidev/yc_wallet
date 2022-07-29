import 'package:flutter/services.dart';
import 'package:yc_wallet/share/quick_import.dart';

// class BaseAppBar extends AppBar {
//   final bool lightBackground;
//   BaseAppBar(
//     this.lightBackground, {
//     Key? key,
//     required ThemeData theme,
//     String textTitle = "",
//     super.leading = const YCBackButton(),
//     super.automaticallyImplyLeading = true,
//     Widget? title,
//     super.actions,
//     super.flexibleSpace,
//     super.bottom,
//     super.elevation,
//     super.shadowColor,
//     super.shape,
//     Color? backgroundColor,
//     super.foregroundColor,
//     super.iconTheme,
//     super.actionsIconTheme,
//     super.primary = true,
//     super.centerTitle = true,
//     super.excludeHeaderSemantics = false,
//     super.titleSpacing,
//     super.toolbarOpacity = 1.0,
//     super.bottomOpacity = 1.0,
//     super.toolbarHeight,
//     super.leadingWidth,
//     super.toolbarTextStyle,
//     super.titleTextStyle,
//     SystemUiOverlayStyle? systemOverlayStyle,
//   })  : assert(elevation == null || elevation >= 0.0),
//         super(
//             key: key,
//             title: title ??
//                 Text(
//                   textTitle,
//                   style: const TextStyle(),
//                 ),
//             backgroundColor:
//                 lightBackground ? Colors.white : theme.primaryColor,
//             systemOverlayStyle: systemOverlayStyle ??
//                 SystemUiOverlayStyle(
//                     statusBarColor:
//                         lightBackground ? Colors.white : theme.primaryColor,
//                     systemNavigationBarIconBrightness:
//                         lightBackground ? Brightness.dark : Brightness.light,
//                     statusBarIconBrightness:
//                         lightBackground ? Brightness.dark : Brightness.light));
// }

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool lightBackground;
  final String textTitle;
  final Widget leading;
  final bool automaticallyImplyLeading;
  final Widget? title;
  final List<Widget>? actions;
  final Widget? flexibleSpace;
  final PreferredSizeWidget? bottom;
  final double? elevation;
  final Color? shadowColor;
  final ShapeBorder? shape;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final IconThemeData? iconTheme;
  final IconThemeData? actionsIconTheme;
  final bool primary;
  final bool centerTitle;
  final bool excludeHeaderSemantics;
  final double? titleSpacing;
  final double toolbarOpacity;
  final double bottomOpacity;
  final double? toolbarHeight;
  final double? leadingWidth;
  final TextStyle? toolbarTextStyle;
  final TextStyle? titleTextStyle;
  final SystemUiOverlayStyle? systemOverlayStyle;

  const BaseAppBar({
    Key? key,
    this.lightBackground = false,
    this.textTitle = "",
    this.leading = const YCBackButton(),
    this.automaticallyImplyLeading = true,
    this.title,
    this.actions,
    this.flexibleSpace,
    this.bottom,
    this.elevation,
    this.shadowColor,
    this.shape,
    this.backgroundColor,
    this.foregroundColor,
    this.iconTheme,
    this.actionsIconTheme,
    this.primary = true,
    this.centerTitle = true,
    this.excludeHeaderSemantics = false,
    this.titleSpacing,
    this.toolbarOpacity = 1.0,
    this.bottomOpacity = 1.0,
    this.toolbarHeight,
    this.leadingWidth,
    this.toolbarTextStyle,
    this.titleTextStyle,
    this.systemOverlayStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      key: key,
      leading: leading,
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: title ?? Text(textTitle),
      actions: actions,
      flexibleSpace: flexibleSpace,
      bottom: bottom,
      elevation: elevation,
      shadowColor: shadowColor,
      shape: shape,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      iconTheme: iconTheme,
      actionsIconTheme: actionsIconTheme,
      primary: primary,
      centerTitle: centerTitle,
      excludeHeaderSemantics: excludeHeaderSemantics,
      titleSpacing: titleSpacing,
      toolbarOpacity: toolbarOpacity,
      bottomOpacity: bottomOpacity,
      toolbarHeight: toolbarHeight,
      leadingWidth: leadingWidth,
      toolbarTextStyle: toolbarTextStyle,
      titleTextStyle: titleTextStyle,
      systemOverlayStyle: systemOverlayStyle ??
          SystemUiOverlayStyle(
              statusBarColor: lightBackground ? Colors.white : backgroundColor,
              systemNavigationBarIconBrightness:
                  lightBackground ? Brightness.dark : Brightness.light,
              statusBarIconBrightness:
                  lightBackground ? Brightness.dark : Brightness.light),
    );
  }

  @override
  Size get preferredSize =>
      _PreferredAppBarSize(toolbarHeight, bottom?.preferredSize.height);
}

class _PreferredAppBarSize extends Size {
  _PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
      : super.fromHeight(
            (toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0));

  final double? toolbarHeight;
  final double? bottomHeight;
}
