import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:user_list2/post_api.dart';
import 'dart:convert';

import 'package:user_list2/provider.dart';

 void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'user with api',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserFormScreen(),
    );
  }
}
