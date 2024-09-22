class Post {
  final int id;
  final String title;
  final String body;

  Post({required this.id, required this.title, required this.body});

  Post toDomain() {
    return Post(id: id, title: title, body: body);
  }
}
