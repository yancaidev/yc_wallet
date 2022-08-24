import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:path/path.dart';

/// App全局配置
///
/// 单利模式
class AppConfig {
  static final AppConfig _instance = AppConfig._private();

  /// Moralis Api Key
  static const moralisApiKey =
      "qCyozPfc6y8GEhbxkxnHMe6cykyTm6mAdejTLq21LKwrTqMf539Ag75lDJQRCtOI";

  /// Moralis Api baseUrl
  static const moralisBaseUrl = "https://deep-index.moralis.io/api/v2/";

  /// CoinMarketCap Api Key
  static const coinMarketCapApiKey = "7a109840-5fb7-4ef4-8347-318cfc51c3a3";

  /// CoinMarketCap baseUrl
  static const coinMarketCapBaseUrl = "https://pro-api.coinmarketcap.com/";

  /// 用于获取全局的context,  [MyApp]组件的 `key`
  static final GlobalKey appKey = GlobalKey();

  static AppConfig get shared => _instance;

  /// 日志输出组件，方便在生产环境中关闭日志
  final Logger logger;

  /// 是否是生产环境环境
  bool get isReleaseMode => kReleaseMode;

  AppConfig._private() : logger = Logger() {
    if (kReleaseMode) {
      Logger.level = Level.nothing;
    }
  }

  static late AppLocalizations localized;
}
