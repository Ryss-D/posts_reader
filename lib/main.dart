import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/models/post.dart';
import 'presentation/screens/post_detail_screen.dart';
import 'presentation/screens/posts_list_screen.dart';
import './business_logic/providers/posts.dart';
import './business_logic/providers/authors.dart';
import './business_logic/providers/comments.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Posts(<Post>[])),
        ChangeNotifierProvider(create: (context) => Authors()),
        ChangeNotifierProvider(create: (context) => Comments()),
      ],
      child: MaterialApp(
        title: 'Posts reader',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: PostsListScreen(),
        //home: PostDetailScreen(),
        routes: {
          PostsListScreen.routeName: (context) => PostsListScreen(),
          PostDetailScreen.routeName: (context) => PostDetailScreen(),
        },
      ),
    );
  }
}
