import 'dart:io';

import 'log_extension.dart';
import 'log_type.dart';

/// If you want see to [visible], [tag], [time].
/// Use [configure] function.
///
/// Other functions [v], [i], [d], [w], [e], [s], [x] are that will show into the console.
class Log {
  /// [flutter_logcat] package will be incredibly helpful to all of you.
  /// If you make good use of logs, it will make development much more convenient.
  ///
  /// In Flutter, logs are displayed in the console without any distinguishing colors.
  /// However, by using this [flutter_logcat] package, you can view message in the console with colors that you define.
  ///
  /// Additionally, you can configure it so that logs are hidden in debug mode(kDebugMode), and you can also set it to display [tag], [file] paths, and [time]stamps.
  Log._();

  /// [_visible] is console print Log visible.
  static bool _visible = true;

  /// [_tag] default tag setting.
  static String _tag = "";

  /// [_time] is console print time visible.
  static bool _time = false;

  /// It's okay if you don't declare this function.
  /// You only need to use it when an overall setup is required.
  ///
  /// -
  ///
  /// [visible] : Define visibility in Console.
  ///
  /// [tag] : Custom Tag into log messages.
  ///
  /// [time] : Show current Time [DateTime.now()] into log messages.
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
  static void v(String message,
      {String tag = "", bool path = false, bool time = false}) {
    if (_visible) {
      _consoleOutput(LogExtension.convert(
          tag: tag.isEmpty ? _tag : tag,
          message: message,
          logType: LogType.verbose,
          path: path,
          time: _time ? time : time || _time));
    }
  }

  /// [i] : information
  /// Informational logs indicating the app's execution state.
  ///
  /// [tag] Define you want tag-name.
  /// [path] Where his log implemented.
  /// [time] Visible Current DateTime
  static void i(String message,
      {String tag = "", bool path = false, bool time = false}) {
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
  static void d(String message,
      {String tag = "", bool path = false, bool time = false}) {
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
  static void w(String message,
      {String tag = "", bool path = false, bool time = false}) {
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
  static void e(String message,
      {String tag = "", bool path = false, bool time = false}) {
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
  static void s(String message,
      {String tag = "", bool path = false, bool time = false}) {
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
  static void x(String message,
      {String tag = "", bool path = false, bool time = false}) {
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
