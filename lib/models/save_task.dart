import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';  // For encoding/decoding JSON
import 'task_model.dart';  // Import the Task model

class SaveTask extends ChangeNotifier {
  List<Task> _tasks = [
    Task(title: 'Eat breakfast', isCompleted: true),
    Task(title: 'Do some sport', isCompleted: false),
    Task(title: 'Work with Flutter', isCompleted: true),
    Task(title: 'Cooking', isCompleted: false),
    Task(title: 'Read my book', isCompleted: false),
  ];

  // Getter to access the tasks
  List<Task> get tasks => _tasks;

  // Add a task and save the updated list to SharedPreferences
  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
    _saveTasksToPreferences();
  }

  // Remove a task and save the updated list to SharedPreferences
  void removeTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
    _saveTasksToPreferences();
  }

  // Toggle task completion status
  void checkTask(int index) {
    _tasks[index].isDone();
    notifyListeners();
    _saveTasksToPreferences();
  }

  // Load tasks from SharedPreferences when the app starts
  Future<void> loadTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? tasksString = prefs.getString('taskList');//The return type is nullable (String?), meaning it could be null if no value exists for that key.

    if (tasksString != null) {
      List<dynamic> jsonList = jsonDecode(tasksString);  // Decode the JSON string into a list of dynamic objects
      _tasks = jsonList.map((json) => Task.fromJson(json)).toList();  // Convert the list of dynamic objects to Task objects
    }
    notifyListeners();  // Notify that tasks have been loaded
  }

  // Save tasks to SharedPreferences
  Future<void> _saveTasksToPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();// to store simple data persistently
    String jsonString = jsonEncode(_tasks.map((task) => task.toJson()).toList());
    // Convert the task list to a JSON string
    //the toJson() method converts each Task into a Map<String, dynamic>, which is a key-value representation of the task.
    //The result of map is an iterable, so we call toList() to convert it into a standard list.
    //jsonEncode: takes the list of maps (JSON representation of tasks) and converts it into a single JSON string. The resulting jsonString is a valid JSON string representing the entire list of tasks.
    prefs.setString('taskList', jsonString);
    // Save JSON string to preferences
    //The first argument is the key under which the value is stored, and the second argument is the value itself
  }

}
