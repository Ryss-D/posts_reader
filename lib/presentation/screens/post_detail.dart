// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../widgets/post_list_item.dart';
// import '../../business_logic/providers/posts.dart';

// class PostDetailScreen extends StatefulWidget{
// static const routeName = '/posts_list';

// @override
// _PostDetailScreenState createState() => _PostDetailScreenState();

// }

// class _PostDetailScreenState extends State<PostDetailScreen>{
// @override
//   Widget build(BuildContext context) {
//     //final ordersData = Provider.of<Orders>(context);
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Posts'),
//         ),
//         body: FutureBuilder(
//             future: _postsFuture,
//             builder: (context, dataSnapshot) {
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