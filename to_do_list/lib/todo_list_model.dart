import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:to_do_list/todo_list_screen.dart'; // import this

class TodoListModel extends ChangeNotifier {
  List<Task> _tasks = [];

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  void addTask(String title, String description) {
    _tasks.add(Task(title: title, description: description));
    notifyListeners();
  }

  void removeTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
