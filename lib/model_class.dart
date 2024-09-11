
import 'package:flutter/foundation.dart';

class PostingData {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostingData({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostingData.fromJson(Map<String, dynamic> json) {
    return PostingData(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
