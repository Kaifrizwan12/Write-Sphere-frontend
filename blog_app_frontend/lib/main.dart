import 'package:blog_app_frontend/loginOrSignup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

void main() {
  Gemini.init(apiKey: 'AIzaSyAS7gu-FA1VqzH3A1cUimfogenO_DTxDmc');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: LoginOrSignup(),
    );
  }
}
