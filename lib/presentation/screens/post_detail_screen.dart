import 'package:flutter/material.dart';
import 'package:posts_reader/presentation/widgets/author_information.dart';
import 'package:posts_reader/presentation/widgets/post_comments.dart';
import 'package:posts_reader/presentation/widgets/post_information.dart';
import 'package:provider/provider.dart';

import '../widgets/post_list_item.dart';
import '../../business_logic/providers/posts.dart';

class PostDetailScreen extends StatelessWidget {
  static const routeName = '/posts_list';

  @override
  Widget build(BuildContext context) {
    final postId = ModalRoute.of(context)?.settings.arguments as int;
    final post = Provider.of<Posts>(context, listen: false).findById(postId);
//     //final ordersData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<Posts>(context, listen: false).toogleFavorite(postId);
            },
            //TODO fix
            icon: post.isFavorite ? Icon(Icons.star) : Icon(Icons.star_border),
          ),
          IconButton(
            onPressed: () {
              Provider.of<Posts>(context, listen: false).removePost(postId);
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: Column(
        children: [
          PostInformation(
            title: 'Description',
            description: post.body,
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