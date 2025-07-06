import 'package:bloc_master_app/features/home/ui/home.dart';
import 'package:bloc_master_app/std/stdView.dart';
import 'package:bloc_master_app/todo/ui/todo_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: TodoView(),
    );
  }
}
