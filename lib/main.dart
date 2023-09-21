import 'package:clean_architecture_demo/domain/model/todo_model.dart';
import 'package:clean_architecture_demo/domain/repository/todo_repository.dart';
import 'package:clean_architecture_demo/presentation/resources/theme_manager.dart';
import 'package:clean_architecture_demo/presentation/utils/ui_utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/di.dart';
import 'firebase_options.dart';

void main() async {
  await _initializeFirebase();
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
    super.initState();
  }

  void createTodo() async {
    final result = await getItInstance
        .get<TodoRepository>()
        .createTodo(TodoModel('Saurabh', 'Testing todo'));

    if (result.right != null) {
      showLongToast('Todo created : ${result.right.toString()}');
    } else {
      showLongToast('Todo create failed  : ${result.left.toString()}');
    }
  }

  void getTodoList() async {
    final result = await getItInstance.get<TodoRepository>().getTodoList();

    if (result.right != null) {
      showLongToast('Fetch Todo list : ${result.right.toString()}');
    } else {
      showLongToast('Failed to fetch Todo list  : ${result.left.toString()}');
    }
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
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () => {createTodo()},
                  child: const Text('Create Todo')),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () => {getTodoList()},
                  child: const Text('Fetch Todo list')),
            ],
          ),
        ),
      ),
      theme: getApplicationTheme(),
    );
  }
}
