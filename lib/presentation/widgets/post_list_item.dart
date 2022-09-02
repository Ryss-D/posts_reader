import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//import '../providers/cart.dart';

class PostsListItem extends StatelessWidget {
  final String description;
  final bool isFavorite;

  PostsListItem({
    required this.description,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(description),
      background: Container(
        color: Theme.of(context).colorScheme.error,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
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
                  title: Text('Are you sure?'),
                  content: Text('Do  you want to remove this post?'),
                  actions: [
                    TextButton(
                      child: Text('No'),
                      onPressed: () {
                        //we use it becasuse showDialog close the future when its closed
                        //passing the value via navigator pop
                        Navigator.of(context).pop(false);
                      },
                    ),
                    TextButton(
                      child: Text('Yes'),
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
        //Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 5,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            minLeadingWidth: 5,
            leading: isFavorite
                ? Icon(
                    Icons.star,
                    color: Colors.amber,
                  )
                : SizedBox(
                    width: 10,
                  ),
            title: Text(description),
            trailing: Icon(Icons.navigate_next),
          ),
        ),
      ),
    );
  }
}
