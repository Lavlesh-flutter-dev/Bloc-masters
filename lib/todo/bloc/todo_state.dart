part of 'todo_bloc.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {}

class TodoIsUpdatedState extends TodoState{
  final List<TodoModel>  todoTitle;

  TodoIsUpdatedState({required this.todoTitle});

}