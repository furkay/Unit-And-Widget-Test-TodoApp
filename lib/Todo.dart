import 'package:flutter/widgets.dart';

class Todo {
  String todoName;
  bool isDone;
  Todo({this.isDone = false, @required this.todoName});
}
