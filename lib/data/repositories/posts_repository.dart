import 'package:posts_reader/data/models/comment.dart';

import '../data_providers/posts_api.dart';
import '../models/author.dart';
import '../models/post.dart';

class PostsRepository {
  final PostsAPI api = PostsAPI();
  Future<List<Post>> getPosts() async {
    final rawPosts = await api.getRawPosts();
    final List<Post> posts = [];
    rawPosts.forEach((post) {
      posts.add(
        Post.fromJson(post),
      );
    });
    return posts;
  }

  Future<List<Comment>> getComments() async {
    final rawComments = await api.getRawComments();
    final List<Comment> comments = [];
    rawComments.forEach((comment) {
      comments.add(
        Comment.fromJson(comment),
      );
    });
    return comments;
  }

  Future<List<Author>> getAuthors() async {
    final rawAuthors = await api.getRawAuthors();
    final List<Author> authors = [];
    rawAuthors.forEach((author) {
      authors.add(
        Author.fromJson(author),
      );
    });
    return authors;
  }
}
