import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_logcat/flutter_logcat.dart';

void main() {
  Log.configure(visible: kDebugMode, time: true);
  // Log.configure(visible: kDebugMode, tag: "Lagerstroemia");

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
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 36.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Divider(),
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
              ElevatedButton(
                onPressed: () {
                  Log.s("message from service");
                },
                child: const Text("service"),
              ),
              ElevatedButton(
                onPressed: () {
                  Log.x("message from background");
                },
                child: const Text("background"),
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
              ElevatedButton(
                onPressed: () {
                  Log.v("message", time: true);
                  Log.i("message", time: true);
                  Log.d("message", time: true);
                  Log.w("message", time: true);
                  Log.e("message", time: true);
                },
                child: const Text("put 'time' parameter"),
              ),
              const Divider(),
              ElevatedButton(
                onPressed: () async {
                  StringBuffer messageBuffer = StringBuffer();
                  for (int index = 0; index < 1000; index++) {
                    messageBuffer.write("[message$index] ");
                  }
                  Log.i(messageBuffer.toString());
                },
                child: const Text("Long message"),
              ),
              const Divider(),
              ElevatedButton(
                onPressed: () async {
                  StringBuffer buffer = StringBuffer();
                  for (int i = 0; i < 500; i++) {
                    buffer.write("message($i)");
                  }
                  debugPrint("${buffer.toString()}");

                  Log.w(buffer.toString());
                },
                child: const Text("longterm messages"),
              ),
              const Divider(),
              ElevatedButton(
                onPressed: () {
                  Log.stream(
                    listen: (message) {
                      print(message);
                    },
                  );
                },
                child: Text('stream message ON'),
              ),
              const ElevatedButton(
                onPressed: Log.removeStream,
                child: Text('stream message OFF'),
              ),
              const Divider(),
              ElevatedButton(
                onPressed: () {
                  final history = Log.history;
                  debugPrint(history);
                },
                child: const Text('Get Log History'),
              ),
              const ElevatedButton(
                onPressed: Log.clearHistory,
                child: Text('Clear Log History'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
