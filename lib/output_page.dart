
import 'package:flutter/material.dart';
import 'model_class.dart';

class OutputPage extends StatelessWidget {
  final PostingData postingData;

  OutputPage({required this.postingData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Output'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          color: Colors.grey[300],
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('User ID: ${postingData.userId}', style: TextStyle(fontSize: 16, color: Colors.black)),
              Text('ID: ${postingData.id}', style: TextStyle(fontSize: 16, color: Colors.black)),
              Text('Title: ${postingData.title}', style: TextStyle(fontSize: 16, color: Colors.black)),
              Text('Body: ${postingData.body}', style: TextStyle(fontSize: 16, color: Colors.black)),
            ],
          ),
        ),
      ),
    );
  }
}
