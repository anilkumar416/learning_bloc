import 'package:flutter/material.dart';
import 'package:learning_bloc/di/injection.dart';
import 'package:learning_bloc/presentation/pages/post_page.dart';
// import 'package:learning_bloc/login_screen.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: LoginScreen(),
      home: const PostPage(),
    );
  }
}
