import 'dart:async';

interface class LogProtocol {
  void configure({required bool visible, String tag = "", bool time = false}) =>
      UnimplementedError('configure() has not been implemented.');
  void v(String message, {String tag = "", bool path = false, bool? time}) =>
      UnimplementedError('verbose() has not been implemented.');
  void i(String message, {String tag = "", bool path = false, bool? time}) =>
      UnimplementedError('information() has not been implemented.');
  void d(String message, {String tag = "", bool path = false, bool? time}) =>
      UnimplementedError('debug() has not been implemented.');
  void w(String message, {String tag = "", bool path = false, bool? time}) =>
      UnimplementedError('warning() has not been implemented.');
  void e(String message, {String tag = "", bool path = false, bool? time}) =>
      UnimplementedError('error() has not been implemented.');
  void s(String message, {String tag = "", bool path = false, bool? time}) =>
      UnimplementedError('service() has not been implemented.');
  void x(String message, {String tag = "", bool path = false, bool? time}) =>
      UnimplementedError('background() has not been implemented.');

  StreamController<String>? streamController;
}
