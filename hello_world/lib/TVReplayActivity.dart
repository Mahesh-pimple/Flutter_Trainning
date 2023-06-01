
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hello_world/models/moviesList/TVModel.dart';

import 'PlayVideoActivity.dart';
import 'data/remote/network/ApiService.dart';
import 'package:http/http.dart' as http;

class TVReplayActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TVState();
}

class _TVState extends State<TVReplayActivity>{

  String stringresponce="";
  List _items = [];

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/sample.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["items"];
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            // Display the data loaded from sample.json
            _items.isNotEmpty
                ? Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return Card(
                    key: ValueKey(_items[index]["id"]),
                    margin: const EdgeInsets.all(10),
                    color: Colors.grey,
                    child: ListTile(
                      leading: Image.network(_items[index]["Poster"],width: 100,height: 150,),
                      title: Text(_items[index]["Title"]),
                      subtitle: Text(_items[index]["Poster"]),
                    onTap: () {
                       Navigator.push(context,MaterialPageRoute(builder: (context) => PlayVideoActivity()));
                    },
                    ),
                  );
                },
              ),
            )
                : Container()
          ],
        ),
      ),
    );
  }
}





