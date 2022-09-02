import 'dart:convert';
import 'package:http/http.dart' as http;

class PostsAPI {
  Future getRawPosts() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    try {
      final response = await http.get(url);
      final rawPosts = json.decode(response.body);

      return rawPosts;
    } catch (error) {}
  }

  Future getRawComments() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/comments');
    try {
      final response = await http.get(url);
      final rawComments = json.decode(response.body);

      return rawComments;
    } catch (error) {}
  }

  Future getRawAuthors() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    try {
      final response = await http.get(url);
      final rawUsers = json.decode(response.body);

      return rawUsers;
    } catch (error) {}
  }
}
