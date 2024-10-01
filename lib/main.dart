import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/models/save_task.dart';
import 'package:test_app/pages/add_todo.dart';
import 'package:test_app/pages/todo_list.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SaveTask()..loadTasks(), // Load tasks on startup
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(0xFFFF66B2),   // Lighter "rose" for accents
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const TodoList(),
        '/add-todo-screen': (_) => AddTodo(),
      },
    );
  }
}