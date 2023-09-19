import 'package:clean_architecture_demo/domain/repository/todo_repository.dart';
import 'package:clean_architecture_demo/presentation/resources/theme_manager.dart';
import 'package:clean_architecture_demo/presentation/utils/ui_utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/di.dart';
import 'firebase_options.dart';

void main() async {
  _initializeFirebase();
  await initAppModule();
  runApp(const MainApp());
}

Future<void> _initializeFirebase() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _DummyState();
}

class _DummyState extends State<MainApp> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    final list = await getItInstance.get<TodoRepository>().getTodoList();

    showLongToast('Todo list : ${list.right.toString()}');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
                  onPressed: () => {
                    getData()
                  }, child: const Text('Press Me')),
            ],
          ),
        ),
      ),
      theme: getApplicationTheme(),
    );
  }
}
