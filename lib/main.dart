import 'package:flutter/material.dart';
import 'package:newsapp/api/api.dart';
import 'package:newsapp/screens/home_screen.dart';

void main() {
  AppApi.getSources();
  AppApi.getNews();
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
      
  }
}
