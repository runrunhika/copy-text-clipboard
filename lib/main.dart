import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lime,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: TextField(
            controller: controller,
          )),
          ElevatedButton(
              onPressed: () {
                final data = ClipboardData(text: controller.text);
                Clipboard.setData(data);
              },
              child: Text("Copy")),
          ElevatedButton(
              onPressed: () async {
                final data = await Clipboard.getData('text/plain');
                final text = data == null ? '' : data.text!;

                setState(() {
                  controller.text = text;
                });
              },
              child: Text("Paste")),
        ],
      ),
    );
  }
}
