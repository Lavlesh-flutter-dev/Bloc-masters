import 'package:flutter/material.dart';

class CompleteTodoPage extends StatefulWidget {
  const CompleteTodoPage({super.key});

  @override
  State<CompleteTodoPage> createState() => _CompleteTodoPageState();
}

class _CompleteTodoPageState extends State<CompleteTodoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Complete Todo')),
      body: Column(children: []),
    );
  }
}
