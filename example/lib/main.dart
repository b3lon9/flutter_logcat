import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_logcat/flutter_logcat.dart';

void main() {
  Log.configure(visible: kDebugMode, time: true);
 // Log.configure(visible: kDebugMode, tag: "donguran");

  runApp(const MaterialApp(home: Scaffold(body: ExampleScreen())));
}

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({super.key});

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

/// [initState - output]
/// I/flutter (18273): [_ExampleScreenState:20] initState.. verbose..
/// I/flutter (18273): [_ExampleScreenState:21] initState.. information..
/// I/flutter (18273): [_ExampleScreenState:22] initState.. debug..
/// I/flutter (18273): [_ExampleScreenState:23] initState.. warning..
/// I/flutter (18273): [_ExampleScreenState:24] initState.. error..
class _ExampleScreenState extends State<ExampleScreen> {
  @override
  void initState() {
    super.initState();

    Log.v("initState.. verbose..");
    Log.i("initState.. information..");
    Log.d("initState.. debug..");
    Log.w("initState.. warning..");
    Log.e("initState.. error..");
  }

  @override
  Widget build(BuildContext context) {
    Log.d("build.. ", path: true);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Log.v("onPressed..", tag: "donguran", path: true);
            },
            child: const Text("verbose"),
          ),
          ElevatedButton(
            onPressed: () {
              Log.i("onPressed..", tag: "donguran", path: true);
            },
            child: const Text("information"),
          ),
          ElevatedButton(
            onPressed: () {
              Log.d("onPressed..", tag: "donguran", path: true);
            },
            child: const Text("debug"),
          ),
          ElevatedButton(
            onPressed: () {
              Log.w("onPressed..", tag: "donguran", path: true);
            },
            child: const Text("warning"),
          ),
          ElevatedButton(
            onPressed: () {
              Log.e("onPressed..", tag: "donguran", path: true);
            },
            child: const Text("error"),
          ),
          const Divider(),
          ElevatedButton(
            onPressed: () {
              Log.v("message");
              Log.i("message");
              Log.d("message");
              Log.w("message");
              Log.e("message");
            },
            child: const Text("only message"),
          ),
          ElevatedButton(
            onPressed: () {
              Log.v("message", path: true);
              Log.i("message", path: true);
              Log.d("message", path: true);
              Log.w("message", path: true);
              Log.e("message", path: true);
            },
            child: const Text("put 'path' parameter"),
          ),
          ElevatedButton(
            onPressed: () {
              Log.v("message", tag: "donguran");
              Log.i("message", tag: "donguran");
              Log.d("message", tag: "donguran");
              Log.w("message", tag: "donguran");
              Log.e("message", tag: "donguran");
            },
            child: const Text("put 'tag' parameter"),
          ),

          const Divider(),
          ElevatedButton(
            onPressed: () async {
              StringBuffer messageBuffer = StringBuffer();
              for (int index=0; index<100; index++) {
                messageBuffer.write("[message$index] ");
              }
              Log.i(messageBuffer.toString());
            },
            child: const Text("Long message"),
          )
        ],
      ),
    );
  }
}
