import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AnnotatedRegionStatusBar extends AnnotatedRegion<SystemUiOverlayStyle> {
  AnnotatedRegionStatusBar({Key? key, required Widget child, bool light = true})
      : super(
            key: key,
            child: child,
            value: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent, // transparent status bar
              systemNavigationBarColor:
                  light ? Colors.white : Colors.black, // navigation bar color
              statusBarIconBrightness: light
                  ? Brightness.dark
                  : Brightness.light, // status bar icons' color
              systemNavigationBarIconBrightness: light
                  ? Brightness.dark
                  : Brightness.light, //navigation bar icons' color
            ));
}
