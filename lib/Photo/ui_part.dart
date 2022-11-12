import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_restapi/Photo/photoModel.dart';
import 'package:http/http.dart' as http;

class UIpart extends StatelessWidget {
  UIpart({Key? key}) : super(key: key);
  List<PhotoTest> photoTest = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                margin: EdgeInsets.all(10),
                height: 120,
                decoration: BoxDecoration(color: Colors.blueAccent),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Album Id:${photoTest[index].albumId}",
                      style: TextStyle(fontSize: 18),
                    ),
                    // Text("ID: ${photoTest[index].id}Data",
                    //     style: TextStyle(fontSize: 18)),
                    // Text("Title: ${photoTest[index].title}",
                    //     style: TextStyle(fontSize: 18)),
                    // Icon(
                    //   Icons.phone,
                    // )
                  ],
                ),
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Future<List<PhotoTest>> getData() async {
    final Response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(Response.body.toString());
    if (Response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        photoTest.add(PhotoTest.fromJson(index));
      }
      return photoTest;
    } else {
      return photoTest;
    }
  }
}
