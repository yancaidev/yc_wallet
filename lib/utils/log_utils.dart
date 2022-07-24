import 'package:logger/logger.dart';
import 'package:yc_wallet/share/app_config.dart';

class LogUtils {
  LogUtils._();

  static void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    AppConfig.shared.logger.log(Level.info, message, error, stackTrace);
  }

  static void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    AppConfig.shared.logger.log(Level.debug, message, error, stackTrace);
  }

  static void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    AppConfig.shared.logger.log(Level.warning, message, error, stackTrace);
  }

  static void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    AppConfig.shared.logger.log(Level.error, message, error, stackTrace);
  }
}
