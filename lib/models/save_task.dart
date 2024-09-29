import 'package:flutter/cupertino.dart';
import 'package:test_app/main.dart';
import 'package:test_app/models/task_model.dart';

class SaveTask extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(title: 'Eat breakfast', isCompleted: true),
    Task(title: 'Do some sport', isCompleted: false),
    Task(title: 'Work with Flutter', isCompleted: true),
    Task(title: 'Cooking', isCompleted: false),
    Task(title: 'Read my book', isCompleted: false),
  ];

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    tasks.add(task);
    notifyListeners();
  }

  void removeTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }

  void checkTask(int index) {
    tasks[index].isDone();
    notifyListeners();
  }
}