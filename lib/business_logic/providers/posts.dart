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

  Future<void> removePost() async {}
  Future<void> removeAllPosts() async {
    _posts = [];
    notifyListeners();
  }
}
