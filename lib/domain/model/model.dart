class TodoModel {
  final String title;
  final String description;

  TodoModel(this.title, this.description);

  @override
  String toString() {
    return 'TodoModel{title: $title, description: $description}';
  }
}
