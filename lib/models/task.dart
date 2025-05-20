class Task {
  final String id;
  final String title;
  final String description;
  final String assignedTo; // Student ID
  final bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.assignedTo,
    this.isCompleted = false,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      assignedTo: json['assignedTo'],
      isCompleted: json['isCompleted'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'assignedTo': assignedTo,
      'isCompleted': isCompleted,
    };
  }
}
