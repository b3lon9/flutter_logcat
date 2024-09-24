import 'dart:io';

import 'log_extension.dart';
import 'log_type.dart';

/// The [Log] Class will give you a great experience.
/// The way to use the Log Class is very simple.
///
/// please let me know the exact location of the result you want to check.
/// It is good to debug daily, but sometimes you need to know data information simply, right?
///
/// If you use [Log] Class, your development speed will be easier!
///
/// call it everywhere!
///
/// -
///
/// One thing to be aware of is that you should use it after [runApp] function.
/// Then, have a good time :)
///
/// - Log.configure(...)
/// - Log.v(...);
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
  ///
  /// -
  ///
  /// you don't have to use the [configure] function.
  /// It is a function made solely for convenience.
  static void configure(
      {required bool visible, String tag = "", bool time = false}) {
    _visible = visible;
    _tag = tag;
    _time = time;
  }

  /// [v] : verbose
  /// V (Verbose): Lowest priority level used for debugging purposes,
  /// providing the most extensive amount of logs.
  ///
  /// [tag] Define you want tag-name.
  /// [path] Where his log implemented.
  /// [time] Visible Current DateTime
  static void v(String message, {String tag = "", bool path = false, bool time = false}) {
    if (_visible) {
      _consoleOutput(LogExtension.convert(
          tag: tag.isEmpty ? _tag : tag,
          message: message,
          logType: LogType.verbose,
          path: path,
          time:  _time ? time : time || _time));
    }
  }

  /// [i] : information
  /// Informational logs indicating the app's execution state.
  ///
  /// [tag] Define you want tag-name.
  /// [path] Where his log implemented.
  /// [time] Visible Current DateTime
  static void i(String message, {String tag = "", bool path = false, bool time = false}) {
    if (_visible) {
      _consoleOutput(LogExtension.convert(
          tag: tag.isEmpty ? _tag : tag,
          message: message,
          logType: LogType.information,
          path: path,
          time: _time ? time : time || _time));
    }
  }

  /// [d] : debug
  /// Debugging logs helpful during development, omitted from release builds.
  ///
  /// [tag] Define you want tag-name.
  /// [path] Where his log implemented.
  /// [time] Visible Current DateTime
  static void d(String message, {String tag = "", bool path = false, bool time = false}) {
    if (_visible) {
      _consoleOutput(LogExtension.convert(
          tag: tag.isEmpty ? _tag : tag,
          message: message,
          logType: LogType.debug,
          path: path,
          time: _time ? time : time || _time));
    }
  }

  /// [w] : warning
  /// Warning logs signaling potential issues that may not impact the app's execution.
  ///
  /// [tag] Define you want tag-name.
  /// [path] Where his log implemented.
  /// [time] Visible Current DateTime
  static void w(String message, {String tag = "", bool path = false, bool time = false}) {
    if (_visible) {
      _consoleOutput(LogExtension.convert(
          tag: tag.isEmpty ? _tag : tag,
          message: message,
          logType: LogType.warning,
          path: path,
          time: _time ? time : time || _time));
    }
  }

  /// [e] : error
  /// Error logs indicating errors that occurred during execution.
  ///
  /// [tag] Define you want tag-name.
  /// [path] Where his log implemented.
  /// [time] Visible Current DateTime
  static void e(String message, {String tag = "", bool path = false, bool time = false}) {
    if (_visible) {
      _consoleOutput(LogExtension.convert(
          tag: tag.isEmpty ? _tag : tag,
          message: message,
          logType: LogType.error,
          path: path,
          time: _time ? time : time || _time));
    }
  }

  /// [s] : service
  /// services log.
  /// if your phone state doze mode,
  /// use when receive event something.
  ///
  /// [tag] Define you want tag-name.
  /// [path] Where his log implemented.
  /// [time] Visible Current DateTime
  static void s(String message, {String tag = "", bool path = false, bool time = false}) {
    if (_visible) {
      _consoleOutput(LogExtension.convert(
          tag: tag.isEmpty ? _tag : tag,
          message: message,
          logType: LogType.service,
          path: path,
          time: _time ? time : time || _time));
    }
  }

  /// [x] : background
  /// background logs use a sure method.
  ///
  /// [tag] Define you want tag-name.
  /// [path] Where his log implemented.
  /// [time] Visible Current DateTime
  static void x(String message, {String tag = "", bool path = false, bool time = false}) {
    if (_visible) {
      _consoleOutput(LogExtension.convert(
          tag: tag.isEmpty ? _tag : tag,
          message: message,
          logType: LogType.background,
          path: path,
          time: _time ? time : time || _time));
    }
  }

  /// Android OS is not showing stdout console.
  /// so use sdk to print function.
  static void _consoleOutput(List<String> messages) async {
    if (Platform.isAndroid) {
      for (String message in messages) {
        print(message);
      }
    } else {
      stdout.writeln(messages.first);
    }
  }
}
