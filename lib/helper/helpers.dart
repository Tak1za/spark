import 'dart:convert';

import 'package:http/http.dart';
import 'package:spark/models/post.dart';

class Helpers {
  static Future<List<Post>> fetchListingsOfType(String type) async {
    final url = Uri.parse(
        "https://www.reddit.com/${type.toLowerCase()}.json?raw_json=1");
    final response = await get(url);
    final parsedResponse = jsonDecode(response.body);
    List<Post> posts = [];
    for (var res in parsedResponse['data']['children']) {
      final post = Post.fromJson(res);
      posts.add(post);
    }

    return posts;
  }
}
