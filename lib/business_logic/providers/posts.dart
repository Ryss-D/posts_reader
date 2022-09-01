import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/post.dart';

class Posts with ChangeNotifier {
  List<Post> _posts = [];
  List<Post> get posts {
    return [..._posts];
  }

  Posts(this._posts);

  Future<List<Post>> fetchPosts() async {
    return <Post>[];
  }

  Future<void> removePost() async {}
  Future<void> removeAllPosts() async {}
}
