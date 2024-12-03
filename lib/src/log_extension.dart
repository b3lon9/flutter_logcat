import 'dart:io';

import 'log_const.dart';

import 'log.dart';
import 'log_type.dart';

/// extension [Log]class functions
extension LogExtension on Log {
  static bool _isAndroid = Platform.isAndroid;

  /// catch location
  ///
  /// through StackTrace class.
  /// return frame String type
  static String _getFrame() {
    try {
      throw Exception();
    } catch (e, stackTrace) {
      final StackTrace trace = StackTrace.fromString(stackTrace.toString());
      assert(!trace.toString().contains('_consoleOutput'),
          'Do not used flutter_logcat\'s function in stream function. If you used in release mode. Don\'t get out of the infinity looper.');
      final String frame = trace.toString().split("\n")[3];
      return frame;
    }
  }

  /// user message receiver
  /// and converting purpose Logcat implementation.
  ///
  /// 2024-05- add limitLength
  /// because print is not show all about characters
  /// setting 10 * 1024 bytes.
  ///
  /// but I tried this safe range is limit 900 characters
  static Map<String, List<String>> convert(
      {required String tag,
      required String message,
      required LogType logType,
      required bool path,
      required bool time,
      required bool history}) {
    final RegExp regExp = RegExp(_regExp);
    final Match? match = regExp.firstMatch(_getFrame());

    if (match != null) {
      final List<String> messages = [];
      final String dateTime =
          time ? "${DateTime.now().toIso8601String()}:" : "";
      final tagName = tag.isNotEmpty ? "($tag) " : "";
      final className = match.group(1);
      final filePath = path ? "(${match.group(2)})" : "";
      final lineNumber = match.group(3);

      // Android console sentence length 1024 issue
      if (_isAndroid) {
        int limitIndex = 900;
        for (int i = 0; i < message.length; i += limitIndex) {
          int end = (i + limitIndex < message.length)
              ? i + limitIndex
              : message.length;
          messages.add(message.substring(i, end));
        }
      } else {
        messages.add(message);
      }

      return {
        LogConstant.consoleMessages: messages
            .map(
              (element) =>
                  "$dateTime${_ansiEscape(logType)}$tagName[$className$filePath:$lineNumber] $element${_isAndroid ? _endSequence : ''}",
            )
            .toList(),
        // if (history)
        LogConstant.streamMessages: messages
            .map(
              (element) =>
                  '$dateTime[${logType.name.toUpperCase()}]$tagName[$className$filePath:$lineNumber] $element',
            )
            .toList()
      };
    } else {
      return {
        LogConstant.consoleMessages: [message]
      };
    }
  }

  /// ANSI ESCAPE SEQUENCE COLOR
  ///
  static String _ansiEscape(LogType logType) {
    if (_isAndroid) {
      String escapeSequence = _endSequence;
      switch (logType) {
        case LogType.verbose:
          escapeSequence = _verboseSequence;
          break;
        case LogType.information:
          escapeSequence = _informationSequence;
          break;
        case LogType.debug:
          escapeSequence = _debugSequence;
          break;
        case LogType.warning:
          escapeSequence = _warningSequence;
          break;
        case LogType.error:
          escapeSequence = _errorSequence;
          break;

        case LogType.service:
          escapeSequence = _serviceSequence;
          break;
        case LogType.background:
          escapeSequence = _backgroundSequence;
          break;
      }

      return escapeSequence;
    } else {
      // Not Android
      String escapeSequence = _verboseSignal;

      switch (logType) {
        case LogType.verbose:
          escapeSequence = _verboseSignal;
          break;
        case LogType.information:
          escapeSequence = _informationSignal;
          break;
        case LogType.debug:
          escapeSequence = _debugSignal;
          break;
        case LogType.warning:
          escapeSequence = _warningSignal;
          break;
        case LogType.error:
          escapeSequence = _errorSignal;
          break;

        // orange
        case LogType.service:
          escapeSequence = _serviceSignal;
          break;
        case LogType.background:
          escapeSequence = _backgroundSignal;
          break;
      }

      return escapeSequence;
    }
  }
}

// regexp
// @Deprecated("don't use this. StackTrace catch another.")
// const String _regBuildExp = r'(\w+)\.build.*package:([^:]+):(\d+):';
const String _regExp = r'(\w+)\..*package:([^:]+):(\d+):';

const String _endSequence = "\x1B[0m";
const String _verboseSequence = "\x1B[97m";
const String _informationSequence = "\x1B[92m";
const String _debugSequence = "\x1B[94m";
const String _warningSequence = "\x1B[93m";
const String _errorSequence = "\x1B[91m";

/// Color: Cyan(sky)
const String _serviceSequence = "\x1B[96m";

/// Color: Magenta(purple)
const String _backgroundSequence = "\x1B[95m";

/// 2024-10-18
///
/// iOS issue block stdout
/// Signal Icon gap one space.
const String _verboseSignal = "⚪️ ";
const String _informationSignal = "🟢 ";
const String _debugSignal = "🔵 ";
const String _warningSignal = "🟡 ";
const String _errorSignal = "🔴 ";

const String _serviceSignal = "🟠 ";
const String _backgroundSignal = "🟣 ";
