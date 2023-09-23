import 'package:clean_architecture_demo/domain/model/todo_model.dart';
import 'package:equatable/equatable.dart';

class TodoCardsState extends Equatable {
  final List<TodoModel>? todoCards;

  final Error? error;

  const TodoCardsState({this.todoCards, this.error});

  @override
  List<Object?> get props => [todoCards];
}

class GetTodoCardsInProgress extends TodoCardsState {
  const GetTodoCardsInProgress();
}

class GetTodoCardsSuccess extends TodoCardsState {
  const GetTodoCardsSuccess({super.todoCards});
}

class GetTodoCardsFailure extends TodoCardsState {
  const GetTodoCardsFailure({super.error});
}
