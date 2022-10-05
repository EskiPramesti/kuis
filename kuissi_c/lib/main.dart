import 'package:flutter/material.dart';
import 'package:kuissi_c/list_belanja.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'perbelanjaan',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: ListBelanja(),
    );
  }
}
