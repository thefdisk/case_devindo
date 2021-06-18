import 'dart:convert';
import 'package:http/http.dart' as http;

class Post {
  String id, title, body;

  Post({this.id, this.title, this.body});

  factory Post.createPost(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  static Future<List<Post>> connectToAPI(int start, int limit) async {
    String apiURL = 'http://jsonplaceholder.typicode.com/posts?_start=' +
        start.toString() +
        '&_limit=' +
        limit.toString();

    var apiResult = await http.get(Uri.parse(apiURL));
    var jsonObject = json.decode(apiResult.body) as List;
    return jsonObject
        .map<Post>((item) => Post(
              id: item['id'].toString(),
              title: item['title'],
              body: item['body'],
            ))
        .toList();
  }
}
