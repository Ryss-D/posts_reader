import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../business_logic/providers/comments.dart';

class PostsComments extends StatelessWidget {
  final int postId;
  const PostsComments({required this.postId});

  @override
  Widget build(BuildContext context) {
    final comments =
        Provider.of<Comments>(context, listen: false).findByPostId(postId);
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 8.0),
            width: double.infinity,
            color: Colors.grey[350],
            child: Text(
              'COMMENTS',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            //height: 200,
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 1),
                  child: Text(comments[index].body,
                      style: Theme.of(context).textTheme.headline3),
                );
              },
              itemCount: comments.length,
            ),
          ),
        ],
      ),
    );
  }
}
