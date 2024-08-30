import 'package:educloudtask/modal/todomodal.dart';
import 'package:flutter/material.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({super.key, required this.todo});

  final ToDo todo;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(todo.todoTitle,style: const TextStyle(fontSize: 18,),),
            Row(
              children: [
                Text(todo.todoDescription,style: TextStyle(fontSize: 15,color: Colors.grey[800]),),
                const Spacer(),
                Text(todo.formattedDate,style: TextStyle(fontSize: 15,color: Colors.grey[800]),)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
