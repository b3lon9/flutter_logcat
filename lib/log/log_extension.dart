import 'package:flutter_logcat/log/log.dart';
import 'package:flutter_logcat/log/log_type.dart';

extension LogExtension on Log {
  /// catch location
  ///
  /// through StackTrace class.
  /// return frame String type
  static String _getFrame() {
    try {
      throw Exception();
    } catch (e, stackTrace) {
      final StackTrace trace = StackTrace.fromString(stackTrace.toString());
      final String frame = trace.toString().split("\n")[3];
      return frame;
    }
  }

  /// user message receiver
  /// and converting purpose Logcat implementation.
  static String convert({
    required String tag,
    required String message,
    required LogType logType,
    required bool path
  }) {
    RegExp regExp = RegExp(_regExp);
    Match? match = regExp.firstMatch(_getFrame());

    if (match != null) {
      final tagName = tag.isNotEmpty ? "($tag) " : "";
      final className = match.group(1);
      final filePath = path ? "(${match.group(2)})" : "";
      final lineNumber = match.group(3);
      return "${_ansiEscape(logType)}$tagName[$className$filePath:$lineNumber] $message$_endSequence";
    } else {
      return message;
    }
  }

  /// ANSI ESCAPE SEQUENCE COLOR
  ///
  static String _ansiEscape(LogType logType) {
    String escapeSequence = _endSequence;
    switch (logType) {
      case LogType.verbose:   escapeSequence = _verboseSequence;  break;
      case LogType.information:   escapeSequence = _informationSequence;  break;
      case LogType.debug:   escapeSequence = _debugSequence;  break;
      case LogType.warning:   escapeSequence = _warningSequence;  break;
      case LogType.error:   escapeSequence = _errorSequence;  break;
    }

    return escapeSequence;
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

