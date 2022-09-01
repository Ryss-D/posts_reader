import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './presentation/screens/posts_list_screen.dart';
import './presentation/screens/post_detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: () => Posts(),
      child: MaterialApp(
        title: 'Posts reader',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: PostsListScreen(),
        routes: {
          PostsListScreen.routeName: (context) => PostsListScreen(),
          PostDetailScreen.routeName: (context) => PostDetailScreen(),
        },
      ),
    );
  }
}
