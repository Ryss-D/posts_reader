import 'package:flutter/material.dart';
import 'package:posts_reader/presentation/widgets/author_information.dart';
import 'package:posts_reader/presentation/widgets/post_comments.dart';
import 'package:posts_reader/presentation/widgets/post_information.dart';
import 'package:provider/provider.dart';

import '../widgets/post_list_item.dart';
import '../../business_logic/providers/posts.dart';

class PostDetailScreen extends StatefulWidget {
  static const routeName = '/posts_list';

  @override
  _PostDetailScreenState createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  @override
  Widget build(BuildContext context) {
//     //final ordersData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.star),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: Column(
        children: [
          PostInformation(
            title: 'Post',
            description: 'Description',
          ),
          AuthorInformation(
            name: 'name',
            email: 'email',
            phone: 'phone',
            website: 'website',
          ),
          PostsComments(
            comments: [
              'hola',
              'hola',
              'hola',
              'hola',
              'hola',
              'hola',
              'hola',
              'hola',
              'hola',
              'hola',
            ],
          ),
        ],
      ),
    );
  }
}
        // body: FutureBuilder(
            // future: _postsFuture,
            // builder: (context, dataSnapshot) {
//               // dataSnapshot is the current state of future
//               if (dataSnapshot.connectionState == ConnectionState.waiting) {
//                 return Center(child: CircularProgressIndicator());
//               } else {
//                 if (dataSnapshot.error == null) {
//                   return Center(child: Text('An error occurred'));
//                   //TODO: Error handling
//                 } else {
//                   return Consumer<Posts>(
//                     builder: (ctx, postsData, child) => ListView.builder(
//                         itemBuilder: (context, index) =>
//                             PostListItem(postsData.posts[index]),
//                         itemCount: postsData.posts.length),
//                   );
//                 }
//               }
//             }));
// }