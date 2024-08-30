import 'package:educloudtask/modal/todomodal.dart';
import 'package:educloudtask/todoitem.dart';
import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key, required this.todos, required this.onRemoveTodo});

  final void Function(ToDo todo) onRemoveTodo;
  final List<ToDo> todos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (ctx, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Dismissible(
          onDismissed: (DismissDirection direction) {
            todos.removeAt(index);
          },
          background: Container(
            color: Colors.red,
            margin: const EdgeInsets.symmetric(horizontal: 10),
          ),
          key: ValueKey(todos[index]),
          child: ToDoItem(todo: todos[index]),
        ),
      ),
    );
  }
}
