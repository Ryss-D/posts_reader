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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'USER',
            style: Theme.of(context).textTheme.headline1,
          ),
          Text(
            author.name,
            style: Theme.of(context).textTheme.headline3,
          ),
          Text(author.email, style: Theme.of(context).textTheme.headline3),
          Text(author.phone, style: Theme.of(context).textTheme.headline3),
          Text(author.website, style: Theme.of(context).textTheme.headline3),
        ],
      ),
    );
  }
}
