import 'package:flutter/material.dart';

import 'package:flutter_logcat/log/log_extension.dart';
import 'package:flutter_logcat/log/log_type.dart';

class Log {
  /// [v] : verbose
  /// V (Verbose): Lowest priority level used for debugging purposes,
  /// providing the most extensive amount of logs.
  static void v(String message, {String tag = "", bool path = false}) =>
      debugPrint(LogExtension.convert(
          tag: tag,
          message: message,
          logType: LogType.verbose,
          path: path
      ));

  /// [i] : information
  /// Informational logs indicating the app's execution state.
  static void i(String message, {String tag = "", bool path = false}) =>
      debugPrint(LogExtension.convert(
          tag: tag,
          message: message,
          logType: LogType.information,
          path: path
      ));

  /// [d] : debug
  /// Debugging logs helpful during development, omitted from release builds.
  static void d(String message, {String tag = "", bool path = false}) =>
      debugPrint(LogExtension.convert(
          tag: tag,
          message: message,
          logType: LogType.debug,
          path: path
      ));

  /// [w] : warning
  /// Warning logs signaling potential issues that may not impact the app's execution.
  static void w(String message, {String tag = "", bool path = false}) =>
      debugPrint(LogExtension.convert(
          tag: tag,
          message: message,
          logType: LogType.warning,
          path: path
      ));

  /// [e] : error
  /// Error logs indicating errors that occurred during execution.
  static void e(String message, {String tag = "", bool path = false}) =>
      debugPrint(LogExtension.convert(
          tag: tag,
          message: message,
          logType: LogType.error,
          path: path
      ));
}
