class Task {
  final int? id;
  final String title;
  final String? description;
  final String? task_remarks;
  Task({  this.id , required this.title,  this.description, this.task_remarks});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description' : description,
      'task_remarks' :task_remarks
    };
  }
}