import 'package:logger/logger.dart';

class Log {
  static late Logger logger;

  static void init() {
    logger = Logger(
      printer: PrettyPrinter(
        methodCount: 0,
        colors: true,
        printEmojis: false,
      ),
    );
  }

  static void d(dynamic msg) => logger.d(msg);
  static void i(dynamic msg) => logger.i(msg);
  static void e(dynamic msg) => logger.e(msg);
}