part of 'todo_bloc.dart';

@immutable
sealed class TodoState {}

sealed class TodoActionSate {}

final class TodoInitial extends TodoState {}

class NavigateToTaskCompletePageState extends TodoActionSate {}

class CheckBoxClicedState extends TodoState{}

class MoveToTrashState extends TodoState{}

class TaskAddedState extends TodoState{}
