import 'package:bloc/bloc.dart';
import 'package:bloc_master_app/todo/model.dart';
import 'package:meta/meta.dart';
part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    final List<TodoModel> todos = [];
    on<TodoAddedInListEvent>((event, emit) {
      todos.add(TodoModel(title: event.todoTitle));
      emit(TodoIsUpdatedState(todoTitle: List.from(todos)));
    });
    on<TodoDeletedFromListEvent> ((event , emit){
      todos[
    });
  }
}
