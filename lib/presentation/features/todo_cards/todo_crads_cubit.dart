import 'package:clean_architecture_demo/domain/repository/todo_repository.dart';
import 'package:clean_architecture_demo/presentation/features/todo_cards/todo_cards_state.dart';
import 'package:clean_architecture_demo/presentation/utils/ui_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCardsCubit extends Cubit<TodoCardsState> {
  TodoCardsCubit({required this.todoRepository})
      : super(const GetTodoCardsInProgress());

  final TodoRepository todoRepository;

  void getTodoCards() async {
    emit(const GetTodoCardsInProgress());
    final result = await todoRepository.getTodoList();

    if (result.right != null) {
      emit(GetTodoCardsSuccess(todoCards: result.right));
    } else {
      showLongToast(result.left.toString());
    }
  }
}
