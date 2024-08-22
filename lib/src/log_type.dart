/// [LogType] distribute user define code state.
///
/// for example, user want normal check for debugging log
/// use [debug]
///
/// -
///
/// [Log.d("something want debug $message on console");]
///
/// -
///
/// v:[verbose]
///
/// i:[information]
///
/// d:[debug]
///
/// w:[warning]
///
/// e:[error]
///
/// s:[service]
///
/// b:[background]
enum LogType {
  verbose,
  information,
  debug,
  warning,
  error,
  service,
  background,
}
