import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

class ToDo{
    final String todoTitle,todoDescription;
    final DateTime date;

  ToDo({required this.todoTitle, required this.todoDescription,required this.date});

  String get formattedDate {
    return formatter.format(date);
  }
}