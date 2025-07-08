// import 'package:bloc_master_app/features/home/ui/home.dart';
// import 'package:bloc_master_app/std/stdView.dart';
// import 'package:bloc_master_app/todo/ui/todo_view.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       home: TodoView(),
//     );
//   }
// }
// lib/main.dart
import 'package:bloc_master_app/todo/bloc/todo_bloc.dart';
import 'package:bloc_master_app/todo/ui/todo_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TodoListScreen(),
      ),
    );
  }
}

// lib/features/todo/models/todo_model.dart

// lib/features/todo/bloc/todo_event.dart

// lib/features/todo/bloc/todo_state.dart


// lib/features/todo/bloc/todo_bloc.dart


// lib/features/todo/ui/todo_list_screen.dart


// lib/features/todo/ui/completed_todos_screen.dart
