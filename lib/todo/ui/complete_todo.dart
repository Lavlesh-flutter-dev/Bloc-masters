import 'package:bloc_master_app/todo/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../todo/bloc/todo_bloc.dart';

class CompletedTodosScreen extends StatelessWidget {
  const CompletedTodosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final completed = context.read<TodoBloc>().completedTodos;

    return Scaffold(
      appBar: AppBar(title: const Text('Completed Tasks')),
      body: ListView.builder(
        itemCount: completed.length,
        itemBuilder: (context, index) {
          final TodoModel todo = completed[index];
          return ListTile(
            title: Text(todo.title),
          );
        },
      ),
    );
  }
}
