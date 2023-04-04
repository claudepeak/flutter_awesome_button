import 'package:flutter/material.dart';
import 'package:flutter_awesome_button/src/awesome_button_builder.dart';
import 'package:flutter_awesome_button/src/model/button_options_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Awesome Button'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool loading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 300,
              child: AwesomeButtonBuilder()
                  .fromOptions(ButtonOptions(
                    onPressed: () => setState(() => loading = !loading),
                    text: const Text(
                      'Awesome Outlined Button',
                      style: TextStyle(color: Colors.black),
                    ),
                    icon: const Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                    color: Colors.red,
                    outline: false,
                    radius: 5,
                    disabled: false,
                    loading: loading,
                    loadingWidget: const CircularProgressIndicator.adaptive(
                      backgroundColor: Colors.black,
                    ),
                  ))
                  .buildOutlinedButton(),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: SizedBox(
              width: 300,
              child: AwesomeButtonBuilder()
                  .fromOptions(ButtonOptions(
                    onPressed: () => setState(() => loading = !loading),
                    text: const Text('Awesome Elevated Button'),
                    icon: const Icon(Icons.add),
                    color: Colors.red,
                    outline: false,
                    radius: 20,
                    disabled: false,
                    loading: loading,
                  ))
                  .buildElevatedButton(),
            ),
          ),
        ],
      ),
    );
  }
}
