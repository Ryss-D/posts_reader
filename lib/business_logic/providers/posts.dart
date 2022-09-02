import 'package:flutter/material.dart';

import '../../data/models/post.dart';

class Posts with ChangeNotifier {
  List<Post> _posts = [];
  List<Post> get posts {
    return [..._posts];
  }

  Posts(this._posts);

  Future<List<Post>> fetchPosts() async {
    return _posts = <Post>[
      Post(userId: 1, id: 1, title: 'Title', body: 'body', isFavorite: true),
    ];
  }

  Future<void> removePost() async {}
  Future<void> removeAllPosts() async {}
}
