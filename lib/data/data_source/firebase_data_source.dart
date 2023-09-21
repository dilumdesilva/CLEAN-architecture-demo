import 'dart:async';

import 'package:clean_architecture_demo/data/data_source/todo_data_source.dart';
import 'package:clean_architecture_demo/domain/model/todo_model.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseDataSource implements TodoDataSource {
  @override
  Future<bool> createTodo(TodoModel todoModel) async {
    String key =
        FirebaseDatabase.instance.ref(FirebasePath.todoNode).push().key!;
    DatabaseReference ref =
        FirebaseDatabase.instance.ref('${FirebasePath.todoNode}/$key');
    bool result = false;
    await ref.set(todoModel.toJson()).then((_) {
      result = true;
    }).catchError((error) {
      result = false;
    });

    return result;
  }

  @override
  Future<bool> deleteTodo(TodoModel todoModel) {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }

  @override
  Future<List<TodoModel>?> getTodoList() async {
    final StreamController<List<TodoModel>> controller = StreamController();
    final ref = FirebaseDatabase.instance.ref(FirebasePath.todoNode);

    ref.get().then((value) {
      if (value.exists) {
        return controller.add(value.children
            .map((e) => TodoModel.fromJson(
                  Map<String, dynamic>.from(e.value as Map<Object?, Object?>),
                ))
            .toList());
      } else {
        controller.add(List.empty());
      }
    });
    return controller.stream.first;
  }

  @override
  Future<bool> updateTodo(TodoModel todoModel) {
    // TODO: implement updateTodo
    throw UnimplementedError();
  }
}

/// Add firebase node paths here
class FirebasePath {
  static const String todoNode = '/todo/cards';
}
