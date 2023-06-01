

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_world/splas_screen.dart';

import 'TVActivity.dart';
import 'TVReplayActivity.dart';

class DashboardActivity extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _DashboardState();
  }

  class _DashboardState extends State<DashboardActivity> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Dashboard"),
          elevation: 0,
          leading: BackButton(
            color: Color(0xFFFD879A),
            onPressed: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context)=>LoginScreen(),)),
          ),
          bottom: const TabBar(
              tabs: [
                Tab(text: "TV KIJKEN"),
                Tab(text: "TV & Replay")
              ]
          ),
        ),
       body: TabBarView(
         children: [
           TVActivity(),
           TVReplayActivity()
         ],
       ),

        ),
    );
  }

}