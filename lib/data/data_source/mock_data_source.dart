import 'package:clean_architecture_demo/data/data_source/todo_data_source.dart';
import 'package:clean_architecture_demo/domain/model/todo_model.dart';

class MockDataSourceImpl implements TodoDataSource {
  @override
  Future<bool> createTodo(TodoModel todoList) async {
    await Future.delayed(const Duration(seconds: _mockDataDuration));
    return true;
  }

  @override
  Future<bool> deleteTodo(TodoModel todoModel) async {
    await Future.delayed(const Duration(seconds: _mockDataDuration));
    return true;
  }

  @override
  Future<List<TodoModel>> getTodoList() async {
    await Future.delayed(const Duration(seconds: _mockDataDuration));
    return _mockTodoList;
  }

  @override
  Future<bool> updateTodo(TodoModel todoModel) async {
    await Future.delayed(const Duration(seconds: _mockDataDuration));
    return true;
  }
}

const _mockDataDuration = 3;

List<TodoModel> _mockTodoList = [
  TodoModel('Task 1', 'This is the description of task 1'),
  TodoModel('Task 2', 'This is the description of task 2'),
  TodoModel('Task 3', 'This is the description of task 3'),
  TodoModel('Task 4', 'This is the description of task 4'),
  TodoModel('Task 5', 'This is the description of task 5'),
  TodoModel('Task 6', 'This is the description of task 6'),
  TodoModel('Task 7', 'This is the description of task 7'),
  TodoModel('Task 8', 'This is the description of task 8'),
];
