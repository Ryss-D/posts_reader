import 'package:flutter/material.dart';
import 'package:posts_reader/presentation/widgets/author_information.dart';
import 'package:posts_reader/presentation/widgets/post_comments.dart';
import 'package:posts_reader/presentation/widgets/post_information.dart';
import 'package:provider/provider.dart';

import '../../business_logic/providers/posts.dart';

class PostDetailScreen extends StatefulWidget {
  static const routeName = '/posts_list';

  const PostDetailScreen({Key? key}) : super(key: key);

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final postId = ModalRoute.of(context)?.settings.arguments as int;
    final post = Provider.of<Posts>(context, listen: false).findById(postId);
    bool starred = post.isFavorite;
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<Posts>(context, listen: false).toogleFavorite(postId);
              setState(() {
                starred = !starred;
              });
            },
            icon: starred
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border),
          ),
          IconButton(
            onPressed: () {
              Provider.of<Posts>(context, listen: false).removePost(postId);
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.delete),
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
