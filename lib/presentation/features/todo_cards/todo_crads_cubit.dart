import 'package:clean_architecture_demo/domain/entity/todo_entity.dart';
import 'package:clean_architecture_demo/domain/usecase/delete_todo_usecase.dart';
import 'package:clean_architecture_demo/domain/usecase/get_todos_usecase.dart';
import 'package:clean_architecture_demo/presentation/features/todo_cards/todo_cards_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCardsCubit extends Cubit<TodoCardsState> {
  TodoCardsCubit(
      {required this.getTodosUseCase, required this.deleterTodoUseCase})
      : super(const GetTodoCardsInProgress());

  final GetTodosUseCase getTodosUseCase;
  final DeleteTodoUseCase deleterTodoUseCase;
  var fetchedTodoCards = <TodoEntity>[];

  void getTodoCards() async {
    emit(const GetTodoCardsInProgress());
    final result = await getTodosUseCase.execute(null);

    if (result.isRight) {
      fetchedTodoCards = result.right;
      emit(GetTodoCardsSuccess(todoCards: result.right));
    } else {
      emit(GetTodoCardsFailure(failure: result.left));
    }
  }

  void deleteTodoCard(TodoEntity todoEntity) async {
    emit(const DeleteTodoCardInProgress());
    final result = await deleterTodoUseCase.execute(todoEntity);

    if (result.right == true) {
      fetchedTodoCards.remove(todoEntity);
      emit(DeleteTodoCardSuccess(todoCards: fetchedTodoCards));
    } else {
      emit(DeleteTodoCardFailure(failure: result.left));
    }
  }
}
