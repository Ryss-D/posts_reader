class Post {
  final int userId;
  final int id;
  final String title;
  final String body;
  bool isFavorite;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
    this.isFavorite = false,
  });

  factory Post.fromJson(json) {
    return Post(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body']);
  }
}
