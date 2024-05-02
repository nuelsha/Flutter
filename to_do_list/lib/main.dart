import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/todo_list_model.dart' as model;
import 'package:to_do_list/todo_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<model.TodoListModel>(
      create: (context) => model.TodoListModel(),
      child: Builder(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'To-Do List App',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: TodoListScreen(),
          );
        },
      ),
    );
  }
}
