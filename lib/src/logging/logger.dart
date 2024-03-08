import 'package:logger/logger.dart';

class BMLogger {
  static final BMLogger _singleton = BMLogger._internal();

  factory BMLogger() {
    return _singleton;
  }

  BMLogger._internal();

  final Logger logger = Logger(
    level: Level.debug, // Default log level
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
  );
}
