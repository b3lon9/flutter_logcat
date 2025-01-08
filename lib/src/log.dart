import 'log_channel.dart';

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

  /// [_history] has print String messages.
  @Deprecated('Memory leak problem.')
  static bool _history = false;

  /// Management Log instance
  ///
  static LogChannel _channel = LogChannel();

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
  @Deprecated('Memory leak problem.')
  static String get history {
    assert(
        _history,
        'Please define Log.configure function\'s history to set \'true\'.\n'
        '`Log.configure(visible: kDebugMode, history: true);`');
    // return _historyBuffer.toString();
    return throw Exception('history() function deprecated');
  }

  // [history] stack
  // @Deprecated('Memory leak problem')
  // static StringBuffer _historyBuffer = StringBuffer();

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
  // [history] : 2024-12-30-Mon, remove it.
  static void configure(
      {required bool visible, String tag = "", bool time = false}) {
    _channel.configure(visible: visible, tag: tag, time: time);
    // _history = history;
  }

  /// [v] : verbose
  /// V (Verbose): Lowest priority level used for debugging purposes,
  /// providing the most extensive amount of logs.
  ///
  /// [tag] Define you want tag-name.
  /// [path] Where his log implemented.
  /// [time] Visible Current DateTime
  static void v(String message,
      {String tag = "", bool path = false, bool? time}) {
    _channel.v(message, tag: tag, path: path, time: time);
  }

  /// [i] : information
  /// Informational logs indicating the app's execution state.
  ///
  /// [tag] Define you want tag-name.
  /// [path] Where his log implemented.
  /// [time] Visible Current DateTime
  static void i(String message,
      {String tag = "", bool path = false, bool? time}) {
    _channel.i(message, tag: tag, path: path, time: time);
  }

  /// [d] : debug
  /// Debugging logs helpful during development, omitted from release builds.
  ///
  /// [tag] Define you want tag-name.
  /// [path] Where his log implemented.
  /// [time] Visible Current DateTime
  static void d(String message,
      {String tag = "", bool path = false, bool? time}) {
    _channel.d(message, tag: tag, path: path, time: time);
  }

  /// [w] : warning
  /// Warning logs signaling potential issues that may not impact the app's execution.
  ///
  /// [tag] Define you want tag-name.
  /// [path] Where his log implemented.
  /// [time] Visible Current DateTime
  static void w(String message,
      {String tag = "", bool path = false, bool? time}) {
    _channel.w(message, tag: tag, path: path, time: time);
  }

  /// [e] : error
  /// Error logs indicating errors that occurred during execution.
  ///
  /// [tag] Define you want tag-name.
  /// [path] Where his log implemented.
  /// [time] Visible Current DateTime
  static void e(String message,
      {String tag = "", bool path = false, bool? time}) {
    _channel.e(message, tag: tag, path: path, time: time);
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
      {String tag = "", bool path = false, bool? time}) {
    _channel.s(message, tag: tag, path: path, time: time);
  }

  /// [x] : background
  /// background logs use a sure method.
  ///
  /// [tag] Define you want tag-name.
  /// [path] Where his log implemented.
  /// [time] Visible Current DateTime
  static void x(String message,
      {String tag = "", bool path = false, bool? time}) {
    _channel.x(message, tag: tag, path: path, time: time);
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
    _channel.streamListener = listen;
  }

  /// Clear [history] values.
  @Deprecated('History will get to memory leak problem')
  static void clearHistory() {
    // _historyBuffer.clear();
  }

  /// Remove [stream] instance.
  ///
  /// And Don't receive message by [stream] parameter.
  static void removeStream() {
    _channel.streamListener = null;
  }
}
