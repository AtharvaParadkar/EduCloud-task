import 'package:educloudtask/modal/todomodal.dart';
import 'package:educloudtask/newtodo.dart';
import 'package:educloudtask/todolist.dart';
import 'package:flutter/material.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  final List<ToDo> _regestiredTodo = [
    ToDo(
        todoTitle: 'Learn Dart',
        todoDescription: 'Learn Dart Basics',
        date: DateTime.now()),
    ToDo(
        todoTitle: 'Learn Flutter',
        todoDescription: 'Learn Basic UI',
        date: DateTime.now()),
  ];

  void _addTodo(ToDo todo) {
    setState(() {
      _regestiredTodo.add(todo);
    });
  }

  void _addNewTodo() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (ctx) => NewToDo(
        onAddTodo: _addTodo,
      ),
    );
  }

  void _removeTodo(ToDo todo) {
    // Gives the index of the removed expense to restore it again
    final todoIndex = _regestiredTodo.indexOf(todo);

    setState(() {
      _regestiredTodo.remove(todo);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Todo Deleted'),
        backgroundColor: Colors.red,
        shape: const StadiumBorder(),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _regestiredTodo.insert(todoIndex, todo);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No Todos Found, Start adding some!'),
    );

    if (_regestiredTodo.isNotEmpty) {
      mainContent = TodoList(
        todos: _regestiredTodo,
        onRemoveTodo: _removeTodo,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todo Tasks',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 96, 59, 181),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: mainContent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewTodo,
        child: const Icon(Icons.add),
      ),
    );
  }
}
