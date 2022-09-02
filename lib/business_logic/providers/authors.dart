import 'package:flutter/material.dart';

import '../../data/models/author.dart';
import '../../data/repositories/posts_repository.dart';

class Authors extends ChangeNotifier {
  final PostsRepository repository = PostsRepository();
  List<Author> _authors = [];
  List<Author> get authors {
    return [..._authors];
  }

  Future<void> fetchAuthors() async {
    _authors = await repository.getAuthors();
  }

  Author findById(int id) {
    return _authors.firstWhere((author) => author.id == id);
  }
}
