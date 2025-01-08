import 'dart:io';

import 'log_const.dart';
import 'log_protocol.dart';
import 'log_type.dart';
import 'log_extension.dart';

class LogChannel implements LogProtocol {
  LogChannel();

  /// printing 'OK'
  ///   - Android
  ///   - Window
  ///
  /// printing 'NO'
  ///   - iOS
  ///
  /// Not Enabled 'Deprecated'
  ///   - Web(Chrome)
  ///   - Web(Edge)
  final bool isANSII = Platform.isAndroid || Platform.isWindows;

  /// [_visible] is console print Log visible.
  bool _visible = true;

  /// [_tag] default tag setting.
  String _tag = "";

  /// [_time] is console print time visible.
  ///
  /// | `configure`   |   `time`    |   return    |
  /// |---------------|-------------|-------------|
  /// |   `false`     |   `null`    |   `false`   |
  /// |   `false`     |   `false`   |   `false`   |
  /// |   `false`     |   `true`    |   `true`    |
  /// |   `true`      |   `null`    |   `true`    |
  /// |   `true`      |   `false`   |   `false`   |
  /// |   `true`      |   `true`    |   `true`    |
  ///
  /// ```dart
  ///   bool _isTimeVisible({required bool? time}) {
  ///    if (time == null) {
  ///       return _time;
  ///     } else {
  ///       return time;
  ///     }
  ///   }
  /// ```
  ///
  bool _time = false;

  bool _isTimeVisible({required bool? time}) {
    if (time != null) {
      return time;
    } else {
      return _time;
    }
  }

  /// [stream] function parameter.
  ///
  /// Deliver message into [stream] argument.
  ///
  /// Maybe you want remove this, You can use [removeStream] function.
  @override
  Function(String message)? streamListener;

  @override
  void configure({required bool visible, String tag = "", bool time = false}) {
    _visible = visible;
    _tag = tag;
    _time = time;
  }

  @override
  void v(String message, {String tag = "", bool path = false, bool? time}) {
    if (_visible) {
      _consoleOutput(convert(
          tag: tag.isNotEmpty ? tag : _tag,
          message: message,
          logType: LogType.verbose,
          path: path,
          time: _isTimeVisible(time: time)));
    }
  }

  @override
  void i(String message, {String tag = "", bool path = false, bool? time}) {
    if (_visible) {
      _consoleOutput(convert(
          tag: tag.isNotEmpty ? tag : _tag,
          message: message,
          logType: LogType.information,
          path: path,
          time: _isTimeVisible(time: time)));
    }
  }

  @override
  void d(String message, {String tag = "", bool path = false, bool? time}) {
    if (_visible) {
      _consoleOutput(convert(
          tag: tag.isNotEmpty ? tag : _tag,
          message: message,
          logType: LogType.debug,
          path: path,
          time: _isTimeVisible(time: time)));
    }
  }

  @override
  void w(String message, {String tag = "", bool path = false, bool? time}) {
    if (_visible) {
      _consoleOutput(convert(
          tag: tag.isNotEmpty ? tag : _tag,
          message: message,
          logType: LogType.warning,
          path: path,
          time: _isTimeVisible(time: time)));
    }
  }

  @override
  void e(String message, {String tag = "", bool path = false, bool? time}) {
    if (_visible) {
      _consoleOutput(convert(
          tag: tag.isNotEmpty ? tag : _tag,
          message: message,
          logType: LogType.error,
          path: path,
          time: _isTimeVisible(time: time)));
    }
  }

  @override
  void s(String message, {String tag = "", bool path = false, bool? time}) {
    if (_visible) {
      _consoleOutput(convert(
          tag: tag.isNotEmpty ? tag : _tag,
          message: message,
          logType: LogType.service,
          path: path,
          time: _isTimeVisible(time: time)));
    }
  }

  @override
  void x(String message, {String tag = "", bool path = false, bool? time}) {
    if (_visible) {
      _consoleOutput(convert(
          tag: tag.isNotEmpty ? tag : _tag,
          message: message,
          logType: LogType.background,
          path: path,
          time: _isTimeVisible(time: time)));
    }
  }

  /// Android OS is not showing stdout console.
  /// So use sdk to print function.
  void _consoleOutput(Map<String, List<String>> messageBundle) async {
    if (isANSII) {
      for (String message in messageBundle[LogConstant.consoleMessages]!) {
        print(message);
      }
      if (messageBundle[LogConstant.streamMessages] != null) {
        for (var message in messageBundle[LogConstant.streamMessages]!) {
          if (streamListener != null) {
            streamListener!(message);
          }

          // if (_history) {
          //   _historyBuffer.writeln(message);
          // }
        }
      }
    } else {
      // @deprecated("iOS block console issue")
      // stdout.writeln(messages.first);
      print(messageBundle[LogConstant.consoleMessages]!.first);

      if (streamListener != null) {
        streamListener!(messageBundle[LogConstant.streamMessages]!.first);
      }

      // if (_history) {
      //   _historyBuffer
      //       .writeln(messageBundle[LogConstant.streamMessages]!.first);
      // }
    }
  }
}
