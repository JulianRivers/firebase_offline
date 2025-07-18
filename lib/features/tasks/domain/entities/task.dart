class Task {
  final String id;
  final String task;
  final int priority;
  final bool done;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Task({
    required this.id,
    required this.task,
    this.priority = 0,
    required this.done,
    required this.createdAt,
    required this.updatedAt,
  });
}
