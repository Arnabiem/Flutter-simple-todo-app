import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_todo_app/home.dart';

void main()=> runApp(todoapp());
class todoapp extends StatelessWidget {
  const todoapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter ToDo App',
      // theme: ThemeData(
      //   primarySwatch:Colors.cyan,
      //   brightness:Brightness.dark,
      //   accentColor: Colors.blue,
      // ),
      home: home(),
    );
  }
}
