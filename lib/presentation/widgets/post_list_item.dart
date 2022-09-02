import 'package:flutter/material.dart';
import 'package:posts_reader/presentation/screens/post_detail_screen.dart';
import 'package:provider/provider.dart';

import '../../business_logic/providers/posts.dart';

//import '../providers/cart.dart';

class PostsListItem extends StatelessWidget {
  final int postId;
  final String title;
  final bool isFavorite;

  const PostsListItem({
    required this.postId,
    required this.title,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(postId),
      background: Container(
        color: Theme.of(context).colorScheme.error,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        //showDialog returns a future it self
        //return Future.value();
        //with this we show a dialog
        return showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text('Are you sure?'),
                  content: const Text('Do  you want to remove this post?'),
                  actions: [
                    TextButton(
                      child: const Text('No'),
                      onPressed: () {
                        //we use it becasuse showDialog close the future when its closed
                        //passing the value via navigator pop
                        Navigator.of(context).pop(false);
                      },
                    ),
                    TextButton(
                      child: const Text('Yes'),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                    )
                  ],
                ));
      },
      // we can add diferect tirections and with direction argument then
      // select what to do
      onDismissed: (direction) {
        Provider.of<Posts>(context, listen: false).removePost(postId);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 5,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            minLeadingWidth: 5,
            leading: isFavorite
                ? const Icon(
                    Icons.star,
                    color: Colors.amber,
                  )
                : const SizedBox(
                    width: 10,
                  ),
            title: Text(title),
            trailing: IconButton(
              icon: const Icon(Icons.navigate_next),
              onPressed: () => Navigator.of(context).pushNamed(
                PostDetailScreen.routeName,
                arguments: postId,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
