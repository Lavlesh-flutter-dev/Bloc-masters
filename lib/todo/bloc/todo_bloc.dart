import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_master_app/todo/bloc/todo_state.dart';
import 'package:bloc_master_app/todo/model.dart';
import 'package:bloc_master_app/todo/ui/todolist.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

// part 'todo_event.dart';
// part 'todo_state.dart';

// class TodoBloc extends Bloc<TodoEvent, TodoState> {
//   TodoBloc() : super(TodoInitial()) {
//     on<TodoAddedEvent>(todoAddedEvent);
//   }

//   FutureOr<void> todoAddedEvent(TodoAddedEvent event, Emitter<TodoState> emit) {
//     todoList.add(event.title);
//     emit(TaskAddedState());

//   }
// }
import 'package:flutter_bloc/flutter_bloc.dart';
part 'todo_event.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final List<TodoModel> _todos = [];

  TodoBloc() : super(TodoInitial()) {
    on<TodoAddedEvent>((event, emit) {
      _todos.add(TodoModel(title: event.title));
      emit(TodoListUpdatedState(todos: List.from(_todos)));
    });

    on<TodoToggledCompleteEvent>((event, emit) {
      _todos[event.index].isCompleted = !_todos[event.index].isCompleted;
      emit(TodoListUpdatedState(todos: List.from(_todos)));
    });

    on<TodoDeletedEvent>((event, emit) {
      _todos.removeAt(event.index);
      emit(TodoListUpdatedState(todos: List.from(_todos)));
    });
  }

  List<TodoModel> get completedTodos =>
      _todos.where((todo) => todo.isCompleted).toList();
}
