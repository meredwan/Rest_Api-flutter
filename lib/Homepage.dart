import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_restapi/Model.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);

  List<SampalTest> sampalTest = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                return Container(
                  height: 100,
                  color: Colors.greenAccent,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "User ID: ${sampalTest[index].userId} ",
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                      Text(
                        "ID: ${sampalTest[index].id}",
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                      Text(
                        "Title: ${sampalTest[index].title}",
                        maxLines: 1,
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                      Text(
                        "Body: ${sampalTest[index].body}",
                        maxLines: 1,
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ],
                  ),
                );
              });
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Future<List<SampalTest>> getData() async {
    final Response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(Response.body.toString());
    if (Response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        sampalTest.add(SampalTest.fromJson(index));
      }
      return sampalTest;
    } else {
      return sampalTest;
    }
  }
}
