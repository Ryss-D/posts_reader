import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'presentation/screens/post_detail_screen.dart';
import 'presentation/screens/posts_list_screen.dart';
import './business_logic/providers/posts.dart';
import './business_logic/providers/authors.dart';
import './business_logic/providers/comments.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Posts()),
        ChangeNotifierProvider(create: (context) => Authors()),
        ChangeNotifierProvider(create: (context) => Comments()),
      ],
      child: MaterialApp(
        title: 'Posts reader',
        theme: ThemeData(
          primarySwatch: Colors.green,
          textTheme: const TextTheme(
              headline1: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              headline3: TextStyle(fontSize: 18)),
        ),
        home: const PostsListScreen(),
        //home: PostDetailScreen(),
        routes: {
          PostsListScreen.routeName: (context) => const PostsListScreen(),
          PostDetailScreen.routeName: (context) => const PostDetailScreen(),
        },
      ),
    );
  }
}
