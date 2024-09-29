import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/models/save_task.dart';
import 'package:test_app/models/task_model.dart';


class AddTodo extends StatelessWidget {
  AddTodo({super.key});

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Add Todo',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.pink[200],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: controller,
              autofocus: true,//Automatically focuses the TextField when the screen opens, so the keyboard appears and the user can immediately start typing
              decoration: const InputDecoration(
                hintText: 'Title',
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                context.read<SaveTask>().addTask(
                  Task(
                    title: controller.text,
                    isCompleted: false,
                  ),
                );
                controller.clear();
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.pink[200],
              foregroundColor: Colors.white),
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}