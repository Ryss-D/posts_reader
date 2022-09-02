import 'package:flutter/material.dart';

class PostsComments extends StatelessWidget {
  final List<String> comments;
  PostsComments({
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
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
            height: 30,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.only(bottom: 1),
                  child: Text(
                    comments[index],
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
