import 'package:flutter/material.dart';

class PostInformation extends StatelessWidget {
  final String title;
  final String description;
  PostInformation({required this.title, required this.description});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      color: Colors.grey[100],
      child: Column(
        children: [
          Text(title),
          Text(description),
        ],
      ),
    );
  }
}
