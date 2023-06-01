
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TVActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TVTAB1State();
}

class _TVTAB1State extends State<TVActivity>{

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "For TAB 1",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),

    );
  }


}


