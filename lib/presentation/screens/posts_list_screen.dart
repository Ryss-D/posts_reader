import 'package:flutter/material.dart';
import 'package:posts_reader/presentation/widgets/posts_eraser.dart';
import 'package:provider/provider.dart';

import '../../business_logic/providers/authors.dart';
import '../../business_logic/providers/comments.dart';
import '../../business_logic/providers/posts.dart';
import '../../data/models/post.dart';
import '../widgets/post_list_item.dart';

class PostsListScreen extends StatefulWidget {
  static const routeName = '/post_detail';

  const PostsListScreen({Key? key}) : super(key: key);

  @override
  _PostsListScreenState createState() => _PostsListScreenState();
}

class _PostsListScreenState extends State<PostsListScreen> {
  late Future<List<Post>> _postsFuture;
  @override
  void initState() {
    _postsFuture = Provider.of<Posts>(context, listen: false).fetchPosts();
    Provider.of<Authors>(context, listen: false).fetchAuthors();
    Provider.of<Comments>(context, listen: false).fetchComments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final ordersData = Provider.of<Orders>(context);
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Posts'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: 'All',
              ),
              Tab(
                text: 'Favorites',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FutureBuilder(
              future: _postsFuture,
              builder: (context, dataSnapshot) {
                // dataSnapshot is the current state of future
                if (dataSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (dataSnapshot.error != null) {
                    return const Center(child: Text('An error occurred'));
                  } else {
                    return RefreshIndicator(
                      onRefresh: () =>
                          Provider.of<Posts>(context, listen: false)
                              .fetchPosts(),
                      child: Stack(
                        children: [
                          Consumer<Posts>(
                            builder: (ctx, postsData, child) =>
                                ListView.builder(
                                    itemBuilder: (context, index) =>
                                        PostsListItem(
                                            postId: postsData.posts[index].id,
                                            isFavorite:
                                                postsData.posts[index]
                                                    .isFavorite,
                                            title:
                                                postsData.posts[index].title),
                                    itemCount: postsData.posts.length),
                          ),
                          Align(
                            alignment: AlignmentDirectional.bottomEnd,
                            child: PostsEraser(
                              deleteFuction: () =>
                                  Provider.of<Posts>(context, listen: false)
                                      .removeAllPosts(),
                            ),
                          )
                        ],
                      ),
                    );
                  }
                }
              },
            ),
            Consumer<Posts>(
              builder: (ctx, postsData, child) => postsData
                      .favoritePosts.isEmpty
                  ? const Center(child: Text('Not favorite posts added yet!'))
                  : ListView.builder(
                      itemBuilder: (context, index) => PostsListItem(
                          postId: postsData.favoritePosts[index].id,
                          isFavorite: postsData.favoritePosts[index].isFavorite,
                          title: postsData.favoritePosts[index].title),
                      itemCount: postsData.favoritePosts.length),
            ),
          ],
        ),
      ),
    );
  }
}
