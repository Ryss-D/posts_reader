import 'package:flutter/material.dart';

class PostInformation extends StatelessWidget {
  final String title;
  final String description;
  const PostInformation({required this.title, required this.description});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        color: Colors.grey[100],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              description,
              style: Theme.of(context).textTheme.headline3,
            ),
          ],
        ),
      ),
    );
  }
}
