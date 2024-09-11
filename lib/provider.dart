
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:user_list2/model_class.dart';
import 'dart:convert' as convert;
import 'provider.dart';

class UserProvider with ChangeNotifier {
  PostingData? _postingData;

  PostingData? get postingData => _postingData;

  Future<void> createUser(String title, String body, String idText, String userIdText) async {
    int id = int.tryParse(idText) ?? 0;
    int userId = int.tryParse(userIdText) ?? 0;

    try {
      final response = await http.post(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: convert.jsonEncode(<String, dynamic>{
          'title': title,
          'body': body,
          'id': id,
          'userId': userId,
        }),
      );

      if (response.statusCode == 201) {
        _postingData = PostingData.fromJson(convert.json.decode(response.body));
      } else {
        _postingData = null;
        throw Exception('Failed to create post');
      }
    } catch (e) {
      _postingData = null;
      throw Exception('Failed to create post: $e');
    }
    notifyListeners();
  }
}
