import 'package:educloudtask/modal/todomodal.dart';
import 'package:flutter/material.dart';

class NewToDo extends StatefulWidget {
  const NewToDo({super.key, required this.onAddTodo});

  final void Function(ToDo todo) onAddTodo;

  @override
  State<NewToDo> createState() => _NewToDoState();
}

class _NewToDoState extends State<NewToDo> {
  final _titleController = TextEditingController(),
      _descriptionController = TextEditingController();

  DateTime? _selectedDate;

  void _presentDatePicker() async {
    final now = DateTime.now(),
        lastDate = DateTime(now.year + 5, now.month, now.day);

    final pickedDate = await showDatePicker(
      context: context,
      firstDate: now,
      lastDate: lastDate,
      initialDate: now,
    );

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitTodoData() {
    widget.onAddTodo(
      ToDo(
        todoTitle: _titleController.text,
        todoDescription: _descriptionController.text,
        date: _selectedDate!,
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _titleController,
                      maxLength: 20,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        label: Text('Title'),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _descriptionController,
                      maxLength: 50,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        label: Text('Description'),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _selectedDate == null
                        ? 'No Data Selected'
                        : formatter.format(_selectedDate!),
                  ),
                  IconButton(
                    onPressed: _presentDatePicker,
                    icon: const Icon(Icons.calendar_month_outlined),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Close'),
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: _submitTodoData,
                    child: const Text('Add Todo'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
