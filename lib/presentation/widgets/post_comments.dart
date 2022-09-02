import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../business_logic/providers/comments.dart';

class PostsComments extends StatelessWidget {
  final int postId;
  PostsComments({required this.postId});

  @override
  Widget build(BuildContext context) {
    final comments =
        Provider.of<Comments>(context, listen: false).findByPostId(postId);
    return Container(
      height: 80,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.grey[350],
            child: Text('COMMENTS'),
          ),
          Container(
            height: 60,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 1),
                  child: Text(
                    comments[index].body,
                  ),
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
