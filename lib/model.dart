import 'dart:convert';
import 'package:http/http.dart';

class Hemanth {
  final String url = 'https://jsonplaceholder.typicode.com/todos';
  Future<List<todos>> gettodo() async {
    Response res = await get(Uri.parse(url));
    if (res.statusCode == 200) {
      dynamic body = jsonDecode(res.body);
      if (body != null) {
        List<dynamic> finres = body;
        List<todos> response = List<todos>.empty(growable: true);
        for (var i in finres) {
          response.add(todos.fromJson(i));
        }
        return response;
      }
      return List<todos>.empty(growable: true);
    } else {
      return List<todos>.empty(growable: true);
    }
  }
}

class todos {
  int userId;
  int id;
  String title;
  bool status;
  todos({
    required this.userId,
    required this.id,
    required this.title,
    required this.status,
  });

  factory todos.fromJson(Map<String, dynamic> json) {
    return todos(
      userId: json["userId"],
      id: json["id"],
      title: json["title"],
      status: json["completed"],
    );
  }
}
