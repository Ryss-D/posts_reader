import 'package:flutter/material.dart';
import 'package:posts_reader/data/repositories/posts_repository.dart';

import '../../data/models/post.dart';

class Posts with ChangeNotifier {
  final PostsRepository repository = PostsRepository();
  List<Post> _posts = [];
  List<Post> get posts {
    return [..._posts];
  }

  Posts(this._posts);

  Future<List<Post>> fetchPosts() async {
    print('callled');
    _posts = await repository.getPosts();
    notifyListeners();
    return _posts;
    //return _posts = <Post>[
    //Post(userId: 1, id: 1, title: 'Title', body: 'body', isFavorite: true),
    //];
  }

  List<Post> get favoritePosts {
    return _posts.where((post) => post.isFavorite).toList();
  }

  Post findById(int id) {
    return _posts.firstWhere((post) => post.id == id);
  }

  Future<void> removeAllPosts() async {
    _posts = [];
    notifyListeners();
  }

  void removePost(int id) {
    final existingPostIndex = _posts.indexWhere((post) => post.id == id);
    _posts.removeAt(existingPostIndex);
    notifyListeners();
  }

  void toogleFavorite(int id) {
    final postIndex = _posts.indexWhere((post) => post.id == id);
    final currentPost = _posts[postIndex];
    _posts[postIndex] = Post(
      userId: currentPost.userId,
      id: currentPost.id,
      title: currentPost.title,
      body: currentPost.body,
      isFavorite: !currentPost.isFavorite,
    );
    notifyListeners();
  }
}
