import 'package:bloc_master_app/todo/bloc/todo_bloc.dart';
import 'package:bloc_master_app/todo/ui/complete_todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.read<TodoBloc>().add(
            TodoAddedInListEvent(todoTitle: controller.text),
          );
          controller.clear();
          debugPrint('here is the text field title ${controller.text}');
        },
        label: Text('Add Todos'),
      ),
      appBar: AppBar(
        title: Text('To Do List'),
        actions: [
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CompleteTodo()),
              );
            },
            icon: Icon(Icons.done_all),
            label: Text('Completed'),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            child: Card(
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<TodoBloc, TodoState>(
              builder: (context, state) {
                if (state is TodoIsUpdatedState) {
                  return ListView.builder(
                    itemCount: state.todoTitle.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Checkbox(
                          value: state.todoTitle[index].completed,
                          onChanged: (_) {},
                        ),
                        title: Text(state.todoTitle[index].title),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            context.read<Bloc>().add(
                              TodoDeletedFromListEvent(index: index),
                            );
                          },
                        ),
                      );
                    },
                  );
                }
                return Center(child: Text('No data available'));
              },
            ),
          ),
        ],
      ),
    );
  }
}
