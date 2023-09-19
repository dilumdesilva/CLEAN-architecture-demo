import 'package:clean_architecture_demo/presentation/resources/theme_manager.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My TODOs'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Hello World!'),
              ElevatedButton(
                  onPressed: () => {}, child: const Text('Press Me')),
            ],
          ),
        ),
      ),
      theme: getApplicationTheme(),
    );
  }
}
