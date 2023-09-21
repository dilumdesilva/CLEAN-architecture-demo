class TodoModel {
  final String title;
  final String description;

  TodoModel(this.title, this.description);

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        json['title'] as String,
        json['description'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'description': description,
      };

  @override
  String toString() {
    return 'TodoModel{title: $title, description: $description}';
  }
}
