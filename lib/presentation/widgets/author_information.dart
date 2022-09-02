import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../business_logic/providers/authors.dart';

class AuthorInformation extends StatelessWidget {
  final int userId;

  const AuthorInformation({
    required this.userId,
  });
  @override
  Widget build(BuildContext context) {
    final author = Provider.of<Authors>(context).findById(userId);
    return Container(
      width: double.infinity,
      color: Colors.grey[100],
      child: Column(
        children: [
          Text('USER'),
          Text(author.name),
          Text(author.email),
          Text(author.phone),
          Text(author.website),
        ],
      ),
    );
  }
}
