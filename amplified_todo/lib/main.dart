// flutter and ui libraries
import 'package:flutter/material.dart';
// presentational widgets
import 'pages/TodosPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AAAF Course Todo App',
      home: TodosPage(),
            theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    );
  }
}
