import 'package:clean_architecture_demo/data/network/failure.dart';
import 'package:clean_architecture_demo/domain/model/todo_model.dart';
import 'package:either_dart/either.dart';

abstract class TodoRepository {
  Future<Either<Failure, List<TodoModel>?>> getTodoList();

  Future<Either<Failure, bool>> createTodo(TodoModel todoList);

  Future<Either<Failure, bool>> deleteTodo(TodoModel todoModel);

  Future<Either<Failure, bool>> updateTodo(TodoModel todoModel);
}
