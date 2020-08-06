import 'package:flutter/foundation.dart';
import 'package:todoe/model/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(title: 'Buy milk'),
    Task(title: 'Buy suhar'),
    Task(title: 'Buy loda'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(String newTaskTitle) {
    _tasks.add(Task(title: newTaskTitle));
    notifyListeners();
  }

  int get taskCount {
    return _tasks.length;
  }

  void updateTask(Task task)
  {
    task.toggleDone();
    notifyListeners();
  }
  void removeTask(int index){
    _tasks.removeAt(index);
    notifyListeners();
  }
}
