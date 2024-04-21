import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_logcat/log/log_extension.dart';
import 'package:flutter_logcat/log/log_type.dart';

/// MIT License
///
/// Copyright (c) 2024 neander of donguran
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in all
/// copies or substantial portions of the Software.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
/// SOFTWARE.
class Log {
  /// [v] : verbose
  /// V (Verbose): Lowest priority level used for debugging purposes,
  /// providing the most extensive amount of logs.
  static void v(String message, {String tag = "", bool path = false}) =>
      _consoleOutput(LogExtension.convert(
          tag: tag, message: message, logType: LogType.verbose, path: path));

  /// [i] : information
  /// Informational logs indicating the app's execution state.
  static void i(String message, {String tag = "", bool path = false}) =>
      _consoleOutput(LogExtension.convert(
          tag: tag,
          message: message,
          logType: LogType.information,
          path: path));

  /// [d] : debug
  /// Debugging logs helpful during development, omitted from release builds.
  static void d(String message, {String tag = "", bool path = false}) =>
      _consoleOutput(LogExtension.convert(
          tag: tag, message: message, logType: LogType.debug, path: path));

  /// [w] : warning
  /// Warning logs signaling potential issues that may not impact the app's execution.
  static void w(String message, {String tag = "", bool path = false}) =>
      _consoleOutput(LogExtension.convert(
          tag: tag, message: message, logType: LogType.warning, path: path));

  /// [e] : error
  /// Error logs indicating errors that occurred during execution.
  static void e(String message, {String tag = "", bool path = false}) =>
      _consoleOutput(LogExtension.convert(
          tag: tag, message: message, logType: LogType.error, path: path));

  static void _consoleOutput(String log) {
    if (Platform.isAndroid) {
      debugPrint(log);
    } else {
      stdout.writeln(log);
    }
  }
}
