import 'package:flutter/material.dart';

import '../../data/models/comment.dart';
import '../../data/repositories/posts_repository.dart';

class Comments extends ChangeNotifier {
  final PostsRepository repository = PostsRepository();
  List<Comment> _comments = [];
  List<Comment> get comments {
    return [..._comments];
  }

  Future<void> fetchComments() async {
    _comments = await repository.getComments();
  }

  List<Comment> findByPostId(int postId) {
    return _comments.where((comment) => comment.postId == postId).toList();
  }
}
