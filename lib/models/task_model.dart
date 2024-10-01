class Task {
   String title;
   bool isCompleted;

   Task({required this.title, this.isCompleted = false});

   // Method to toggle the completion status
   void isDone() {
      isCompleted = !isCompleted;
   }

   // produces a map that can be easily converted to a JSON string using jsonEncode().
   //When you save a task, you can use the toJson method
   Map<String, dynamic> toJson() => {
      'title': title,
      'isCompleted': isCompleted,
   };

   // Converts a JSON map back into a Task
   //When you load a task from JSON data, you can use the fromJson constructor
   factory Task.fromJson(Map<String, dynamic> json) {
      return Task(
         title: json['title'],
         isCompleted: json['isCompleted'],
      );
   }
}
