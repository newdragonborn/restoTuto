import 'package:flutter/material.dart';

class CommandItem extends StatefulWidget {
  CommandItem({Key? key}) : super(key: key);

  @override
  State<CommandItem> createState() => _CommandItemState();
}

class _CommandItemState extends State<CommandItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CommandItem"),
      ),
      body: Text("hi"),
    );
  }
}
