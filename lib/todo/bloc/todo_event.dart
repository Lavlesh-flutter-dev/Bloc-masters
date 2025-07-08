// part of 'todo_bloc.dart';

// @immutable
// sealed class TodoEvent {}

// class TodoAddedEvent extends TodoEvent{
//   final String title;
//   TodoAddedEvent({required this.title});
// }
part of 'todo_bloc.dart';

sealed class TodoEvent {}

class TodoAddedEvent extends TodoEvent {
  final String title;
  TodoAddedEvent({required this.title});
}

class TodoToggledCompleteEvent extends TodoEvent {
  final int index;
  TodoToggledCompleteEvent({required this.index});
}

class TodoDeletedEvent extends TodoEvent {
  final int index;
  TodoDeletedEvent({required this.index});
}
