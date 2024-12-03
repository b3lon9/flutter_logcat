import 'dart:io';

import '/src/log_const.dart';

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
  static bool _isAndroid = Platform.isAndroid;

  /// [_visible] is console print Log visible.
  static bool _visible = true;

  /// [_tag] default tag setting.
  static String _tag = "";

  /// [_time] is console print time visible.
  static bool _time = false;

  /// [_history] has print String messages.
  static bool _history = false;

  /// Stacked your [Log] values.
  ///
  /// If you want clear this, You can use [clearHistory] function.
  ///
  /// -
  ///
  /// At First, like this. [history] parameter to set 'true'.
  ///
  /// ```dart
  /// Log.configure(visible: kDebugMode, history: true);
  /// ```
  static String get history {
    assert(
        _history,
        'Please define Log.configure function\'s history to set \'true\'.\n'
        '`Log.configure(visible: kDebugMode, history: true);`');
    return _historyBuffer.toString();
  }

  /// [stream] function parameter.
  ///
  /// Deliver message into [stream] argument.
  ///
  /// Maybe you want remove this, You can use [removeStream] function.
  static Function(String message)? _streamListener;

  /// [history] stack
  static StringBuffer _historyBuffer = StringBuffer();

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
  ///
  /// [history] :
  static void configure(
      {required bool visible,
      String tag = "",
      bool time = false,
      bool history = false}) {
    _visible = visible;
    _tag = tag;
    _time = time;
    _history = history;
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
          time: _time ? time : time || _time,
          history: _history));
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
          time: _time ? time : time || _time,
          history: _history));
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
          time: _time ? time : time || _time,
          history: _history));
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
          time: _time ? time : time || _time,
          history: _history));
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
          time: _time ? time : time || _time,
          history: _history));
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
          time: _time ? time : time || _time,
          history: _history));
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
          time: _time ? time : time || _time,
          history: _history));
    }
  }

  /// Android OS is not showing stdout console.
  /// So use sdk to print function.
  static void _consoleOutput(Map<String, List<String>> messageBundle) async {
    if (_isAndroid) {
      for (String message in messageBundle[LogConstant.consoleMessages]!) {
        print(message);
      }
      if (messageBundle[LogConstant.streamMessages] != null) {
        for (var message in messageBundle[LogConstant.streamMessages]!) {
          if (_streamListener != null) {
            _streamListener!(message);
          }

          if (_history) {
            _historyBuffer.writeln(message);
          }
        }
      }
    } else {
      // @deprecated("iOS block console issue")
      // stdout.writeln(messages.first);
      print(messageBundle[LogConstant.consoleMessages]!.first);

      if (_streamListener != null) {
        _streamListener!(messageBundle[LogConstant.streamMessages]!.first);
      }

      if (_history) {
        _historyBuffer
            .writeln(messageBundle[LogConstant.streamMessages]!.first);
      }
    }
  }

  /// If you want remove [stream] function message.
  /// [listen] into 'null'.
  ///
  /// [listen] is optional parameter.
  ///
  /// -
  ///
  /// You must not use flutter_logcat's function into listen function.
  static void stream({required Function(String message) listen}) {
    _streamListener = listen;
  }

  /// Clear [history] values.
  static void clearHistory() {
    _historyBuffer.clear();
  }

  /// Remove [stream] instance.
  ///
  /// And Don't receive message by [stream] parameter.
  static void removeStream() {
    _streamListener = null;
  }
}
