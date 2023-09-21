import 'package:clean_architecture_demo/domain/model/todo_model.dart';

abstract class TodoDataSource {
  Future<List<TodoModel>?> getTodoList();

  Future<bool> createTodo(TodoModel todoList);

  Future<bool> deleteTodo(TodoModel todoModel);

  Future<bool> updateTodo(TodoModel todoModel);
}
