import 'package:equatable/equatable.dart';

class TodoEntity extends Equatable {
  String id;
  final String title;
  final String description;

  TodoEntity(this.id, this.title, this.description);

  factory TodoEntity.fromJson(Map<String, dynamic> json) => TodoEntity(
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
    return 'Todo{id: $id, title: $title, description: $description}';
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, description];
}
