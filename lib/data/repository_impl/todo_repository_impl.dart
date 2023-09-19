import 'package:clean_architecture_demo/data/data_source/todo_data_source.dart';
import 'package:clean_architecture_demo/data/network/failure.dart';
import 'package:clean_architecture_demo/data/network/network_info.dart';
import 'package:clean_architecture_demo/domain/model/model.dart';
import 'package:clean_architecture_demo/domain/repository/todo_repository.dart';
import 'package:either_dart/either.dart';

class TodoRepositoryImpl implements TodoRepository {
  final NetworkInfo _networkInfo;
  final TodoDataSource _todoDataSource;

  TodoRepositoryImpl(this._networkInfo, this._todoDataSource);

  @override
  Future<Either<Failure, bool>> deleteTodo(TodoModel todoModel) async {
    if (await _networkInfo.isConnected) {
      final result = await _todoDataSource.deleteTodo(todoModel);

      if (result) {
        return const Right(true);
      } else {
        return Left(DefaultFailure());
      }
    }
    return Left(DefaultFailure());
  }

  @override
  Future<Either<Failure, List<TodoModel>?>> getTodoList() async {
    if (await _networkInfo.isConnected) {
      final List<TodoModel>? result = await _todoDataSource.getTodoList();

      if (result != null) {
        return Right(result);
      } else {
        return Left(DefaultFailure());
      }
    }
    return Left(DefaultFailure());
  }

  @override
  Future<Either<Failure, bool>> createTodo(TodoModel todoModel) async {
    if (await _networkInfo.isConnected) {
      final result = await _todoDataSource.createTodo(todoModel);

      if (result) {
        return const Right(true);
      } else {
        return Left(DefaultFailure());
      }
    }
    return Left(DefaultFailure());
  }

  @override
  Future<Either<Failure, bool>> updateTodo(TodoModel todoModel) async {
    if (await _networkInfo.isConnected) {
      final result = await _todoDataSource.updateTodo(todoModel);

      if (result) {
        return const Right(true);
      } else {
        return Left(DefaultFailure());
      }
    }
    return Left(DefaultFailure());
  }
}
