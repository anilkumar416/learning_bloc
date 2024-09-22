import 'package:learning_bloc/domain/entities/post.dart';

class PostModel {
  final int id;
  final String title;
  final String body;

  PostModel({
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }

  // Convert PostModel to Post entity
  Post toEntity() {
    return Post(id: id, title: title, body: body);
  }
}
