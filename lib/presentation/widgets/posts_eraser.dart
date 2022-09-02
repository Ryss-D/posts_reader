import 'dart:io';

import 'package:flutter/material.dart';

class PostsEraser extends StatelessWidget {
  final VoidCallback deleteFuction;
  PostsEraser({required this.deleteFuction});

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
                  child: Icon(Icons.delete),
                  onPressed: deleteFuction,
                ),
              ),
            ],
          )
        : ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.red),
            child: Container(
              color: Colors.red,
              height: 60,
              width: double.infinity,
              child: Center(
                child: Text(
                  'Delete all',
                  //style: Theme.of(context).textTheme.button,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            //style: color text purple,
            onPressed: deleteFuction,
          );
  }
}
