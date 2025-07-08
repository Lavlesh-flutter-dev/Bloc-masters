// import 'package:bloc_master_app/todo/bloc/todo_bloc.dart';
// import 'package:bloc_master_app/todo/ui/todolist.dart';
// import 'package:bloc_master_app/widgets/dialogBox.dart';
// import 'package:bloc_master_app/widgets/todo_listtile.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class TodoView extends StatefulWidget {
//   const TodoView({super.key});

//   @override
//   State<TodoView> createState() => _TodoViewState();
// }

// class _TodoViewState extends State<TodoView> {
//   final TextEditingController addToDoController = TextEditingController();
//   final TodoBloc todoBloc = TodoBloc();
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<TodoBloc, TodoState>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         return Scaffold(
//           floatingActionButton: FloatingActionButton.extended(
//             onPressed: () {
//               debugPrint('button is clicked');
//               CDialogBox.dialogBox(
//                 context: context,
//                 content: Column(
//                   children: [
//                     Text('Add ToDo'),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: TextFormField(
//                         controller: addToDoController,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderSide: BorderSide()),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 50),
//                     Row(
//                       spacing: 30,
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         ElevatedButton(onPressed: () {}, child: Text('cancel')),
//                         ElevatedButton(
//                           onPressed: () {
//                             todoBloc.add(
//                               TodoAddedEvent(
//                                 title: addToDoController.text.trim(),
//                               ),
//                             );
//                           },
//                           child: Text('Add'),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               );
//             },
//             label: Row(children: [Text('Add Todos'), Icon(Icons.add)]),
//           ),
//           appBar: AppBar(title: Text('Todo')),
//           body: Column(
//             children: [
//               ListView.builder(
//                 itemCount: todoList.length,
//                 itemBuilder: (context, index) {
//                   return TodoListTile(
//                     title: todoList[index],
//                     value: true,
//                     onChanged: (_) {},
//                   );
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
import 'package:bloc_master_app/todo/bloc/todo_state.dart';
import 'package:bloc_master_app/todo/ui/complete_todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../todo/bloc/todo_bloc.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  CompletedTodosScreen(),
                ),
              );
            },
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(hintText: 'Enter task'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      context.read<TodoBloc>().add(
                            TodoAddedEvent(title: _controller.text),
                          );
                      _controller.clear();
                    }
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<TodoBloc, TodoState>(
              builder: (context, state) {
                if (state is TodoListUpdatedState) {
                  return ListView.builder(
                    itemCount: state.todos.length,
                    itemBuilder: (context, index) {
                      final todo = state.todos[index];
                      return ListTile(
                        title: Text(todo.title),
                        leading: Checkbox(
                          value: todo.isCompleted,
                          onChanged: (_) {
                            context.read<TodoBloc>().add(
                                  TodoToggledCompleteEvent(index: index),
                                );
                          },
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            context.read<TodoBloc>().add(
                                  TodoDeletedEvent(index: index),
                                );
                          },
                        ),
                      );
                    },
                  );
                }
                return const Center(child: Text('No tasks yet'));
              },
            ),
          ),
        ],
      ),
    );
  }
}