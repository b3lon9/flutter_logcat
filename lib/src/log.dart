import 'dart:io';

import 'log_extension.dart';
import 'log_type.dart';

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
  Log._();

  /// [_visible] is console print Log visible.
  static bool _visible = true;

  /// [_tag] default tag setting.
  static String _tag = "";

  /// [_time] is console print time visible.
  static bool _time = false;

  /// this function setting external control _visible property.
  /// if you want don't see the console Log.
  /// you can use this function [configure] and [visible] parameter
  /// set kDebugMode or 'false'
  static void configure(
      {required bool visible, String tag = "", bool time = false}) {
    _visible = visible;
    _tag = tag;
    _time = time;
  }

  /// [v] : verbose
  /// V (Verbose): Lowest priority level used for debugging purposes,
  /// providing the most extensive amount of logs.
  static void v(String message, {String tag = "", bool path = false}) =>
      _consoleOutput(LogExtension.convert(
          tag: tag.isEmpty ? _tag : tag,
          message: message,
          logType: LogType.verbose,
          path: path,
          time: _time));

  /// [i] : information
  /// Informational logs indicating the app's execution state.
  static void i(String message, {String tag = "", bool path = false}) =>
      _consoleOutput(LogExtension.convert(
          tag: tag.isEmpty ? _tag : tag,
          message: message,
          logType: LogType.information,
          path: path,
          time: _time));

  /// [d] : debug
  /// Debugging logs helpful during development, omitted from release builds.
  static void d(String message, {String tag = "", bool path = false}) =>
      _consoleOutput(LogExtension.convert(
          tag: tag.isEmpty ? _tag : tag,
          message: message,
          logType: LogType.debug,
          path: path,
          time: _time));

  /// [w] : warning
  /// Warning logs signaling potential issues that may not impact the app's execution.
  static void w(String message, {String tag = "", bool path = false}) =>
      _consoleOutput(LogExtension.convert(
          tag: tag.isEmpty ? _tag : tag,
          message: message,
          logType: LogType.warning,
          path: path,
          time: _time));

  /// [e] : error
  /// Error logs indicating errors that occurred during execution.
  static void e(String message, {String tag = "", bool path = false}) =>
      _consoleOutput(LogExtension.convert(
          tag: tag.isEmpty ? _tag : tag,
          message: message,
          logType: LogType.error,
          path: path,
          time: _time));

  /// [b] : background
  /// Background logs services.
  /// if your phone state doze mode,
  /// use when receive event something.
  static void b(String message, {String tag = "", bool path = false}) =>
      _consoleOutput(LogExtension.convert(
        tag: tag.isEmpty ? _tag: tag,
        message: message,
        logType: LogType.background,
        path: path,
        time: _time
      ));

  /// [x] : execute
  /// Execute logs use a sure method.
  static void x(String message, {String tag = "", bool path = false}) =>
      _consoleOutput(LogExtension.convert(
          tag: tag.isEmpty ? _tag: tag,
          message: message,
          logType: LogType.execute,
          path: path,
          time: _time
      ));


  /// Android OS is not showing stdout console.
  /// so use sdk to print function.
  static void _consoleOutput(String message) async {
    if (_visible) {
      if (Platform.isAndroid) {
        print(message);
      } else {
        stdout.writeln(message);
      }
    }
  }
}
