part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

class TodoAddedInListEvent extends TodoEvent {
  final String todoTitle;
  TodoAddedInListEvent({required this.todoTitle});
}

class TodoDeletedFromListEvent extends TodoEvent {
  final int index;

  TodoDeletedFromListEvent({required this.index});
}

class TodoCompletedEvent extends TodoEvent {}
