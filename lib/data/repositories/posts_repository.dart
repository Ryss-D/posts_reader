import '../data_providers/posts_api.dart';
import '../models/post.dart';

class PostRepository {
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
}
