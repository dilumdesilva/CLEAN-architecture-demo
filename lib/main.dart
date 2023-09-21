import 'package:clean_architecture_demo/presentation/resources/theme_manager.dart';
import 'package:clean_architecture_demo/presentation/resources/todo_cards/todo_cards.screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() {
  _initializeFirebase();
  runApp(const MainApp());
}

Future<void> _initializeFirebase() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TodoCardsSecreen(),
      theme: getApplicationTheme(),
    );
  }
}
