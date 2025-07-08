import 'package:flutter/material.dart';

class TodoListTile extends StatelessWidget {
  String title;
  bool value;
  ValueChanged onChanged;
  TodoListTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(),
      title: Text(title),
      trailing: Checkbox(value: value, onChanged: onChanged),
    );
  }
}
