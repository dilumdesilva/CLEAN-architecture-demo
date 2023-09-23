import 'package:clean_architecture_demo/domain/usecase/get_todos_usecase.dart';
import 'package:clean_architecture_demo/presentation/todo_cards/todo_cards_state.dart';
import 'package:clean_architecture_demo/presentation/utils/ui_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCardsCubit extends Cubit<TodoCardsState> {
  TodoCardsCubit({required this.getTodosUseCase})
      : super(const GetTodoCardsInProgress());

  final GetTodosUseCase getTodosUseCase;

  void getTodoCards() async {
    emit(const GetTodoCardsInProgress());
    final result = await getTodosUseCase.execute(null);

    if (result.right != null) {
      emit(GetTodoCardsSuccess(todoCards: result.right));
    } else {
      showLongToast('Failed to fetch Todo list  : ${result.left.toString()}');
    }
  }
}
