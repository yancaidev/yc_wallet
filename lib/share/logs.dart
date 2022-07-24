import 'package:logger/logger.dart';
import 'package:yc_wallet/share/app_config.dart';

void logi(dynamic message, [dynamic error, StackTrace? stackTrace]) {
  AppConfig.shared.logger.log(Level.info, message);
}
