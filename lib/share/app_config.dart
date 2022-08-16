import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:flutter/foundation.dart';

class AppConfig {
  static final AppConfig _instance = AppConfig._private();

  final Logger logger;

  AppConfig._private() : logger = Logger() {
    if (kReleaseMode) {
      Logger.level = Level.nothing;
    }
  }
  static AppConfig get shared => _instance;

  static final GlobalKey appKey = GlobalKey();

  bool get isReleaseMode => kReleaseMode;
}
