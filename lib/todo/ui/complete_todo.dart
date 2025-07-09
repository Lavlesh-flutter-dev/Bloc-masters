import 'package:flutter/material.dart';

class CompleteTodo extends StatefulWidget {
  const CompleteTodo({super.key});

  @override
  State<CompleteTodo> createState() => _CompleteTodoState();
}

class _CompleteTodoState extends State<CompleteTodo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Completed Todos')));
  }
}
