import 'package:logger/logger.dart';

/// Global logger
final Logger logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
  ),
);
