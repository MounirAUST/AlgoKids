import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String taskName;
  final bool isCompleted;

  const TaskCard({super.key, required this.taskName, required this.isCompleted});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(taskName),
        trailing: Icon(
          isCompleted ? Icons.check_circle : Icons.circle_outlined,
          color: isCompleted ? Colors.green : Colors.grey,
        ),
      ),
    );
  }
}
