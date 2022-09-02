import 'package:flutter/material.dart';

class AuthorInformation extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String website;

  const AuthorInformation({
    required this.name,
    required this.email,
    required this.phone,
    required this.website,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey[100],
      child: Column(
        children: [
          Text('USER'),
          Text(name),
          Text(email),
          Text(phone),
          Text(website),
        ],
      ),
    );
  }
}
