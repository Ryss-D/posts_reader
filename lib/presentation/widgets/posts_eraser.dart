import 'dart:io';

import 'package:flutter/material.dart';

class PostsEraser extends StatelessWidget {
  final VoidCallback deleteFuction;
  const PostsEraser({required this.deleteFuction});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  backgroundColor: Colors.red,
                  onPressed: deleteFuction,
                  child: const Icon(Icons.delete),
                ),
              ),
            ],
          )
        : ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.red),
            //style: color text purple,
            onPressed: deleteFuction,
            child: Container(
              color: Colors.red,
              height: 60,
              width: double.infinity,
              child: const Center(
                child: Text(
                  'Delete all',
                  //style: Theme.of(context).textTheme.button,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
  }
}
