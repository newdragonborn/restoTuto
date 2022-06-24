import 'package:flutter/material.dart';
import 'package:tuto/login.dart';

class User extends StatefulWidget {
  User({Key? key}) : super(key: key);

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Connectez Vous!"),
      ),
      body: LoginScreen(),
    );
  }
}
