class Task {
  String task;
  String owner;
  DateTime? due;
  String status;

  Task({
    required this.task,
    this.owner = '',
    this.due,
    this.status = 'To do',
  });

  Map<String, dynamic> toJson() {
    return {
      'task': task,
      'owner': owner,
      'due': due?.toIso8601String(),
      'status': status,
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      task: json['task']?.toString() ?? '',
      owner: json['owner']?.toString() ?? '',
      due: json['due'] == null
          ? null
          : DateTime.tryParse(
        json['due'].toString(),
      ),
      status: json['status']?.toString() ?? 'To do',
    );
  }
}