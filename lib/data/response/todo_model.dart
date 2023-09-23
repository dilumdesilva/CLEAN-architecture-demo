class TodoModel {
  final String id;
  final String title;
  final String description;

  TodoModel(this.id, this.title, this.description);

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        json['id'] as String,
        json['title'] as String,
        json['description'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'title': title,
        'description': description,
      };

  @override
  String toString() {
    return 'TodoModel{id: $id, title: $title, description: $description}';
  }
}
