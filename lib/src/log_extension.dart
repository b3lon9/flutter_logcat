import 'dart:io';

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
  static List<String> convert(
      {required String tag,
      required String message,
      required LogType logType,
      required bool path,
      required bool time}) {
    RegExp regExp = RegExp(_regExp);
    Match? match = regExp.firstMatch(_getFrame());

    if (match != null) {
      List<String> messages = [];
      final String dateTime =
          time ? "${DateTime.now().toIso8601String()}:" : "";
      final tagName = tag.isNotEmpty ? "($tag) " : "";
      final className = match.group(1);
      final filePath = path ? "(${match.group(2)})" : "";
      final lineNumber = match.group(3);

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

      return messages
          .map(
            (element) =>
                "$dateTime${_ansiEscape(logType)}$tagName[$className$filePath:$lineNumber] $element$_endSequence",
          )
          .toList();
    } else {
      return [message];
    }
  }

  /// ANSI ESCAPE SEQUENCE COLOR
  ///
  static String _ansiEscape(LogType logType) {
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

const String _serviceSequence = "\x1B[96m";
const String _backgroundSequence = "\x1B[95m";
