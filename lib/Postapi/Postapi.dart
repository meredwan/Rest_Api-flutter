import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_restapi/Postapi/PostModel.dart';
import 'package:http/http.dart' as http;

class PostApi extends StatelessWidget {
  PostApi({Key? key}) : super(key: key);
  List<PostTest> postTest = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: postTest.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        margin: EdgeInsets.all(10),
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 7,
                              offset: Offset(0,3)
                            )
                          ]
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Post ID:${postTest[index].postId}"),
                                Text("ID:${postTest[index].id}"),
                              ],
                            ),
                            Text("Name: ${postTest[index].name}"),
                            Text("Email:${postTest[index].email}"),
                            Text(
                              "Body: ${postTest[index].body}",
                              maxLines: 1,
                            ),
                          ],
                        ),
                      );
                    });
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }

  Future<List<PostTest>> getData() async {
    final Response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts/1/comments"));
    var data = jsonDecode(Response.body.toString());
    if (Response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        postTest.add(PostTest.fromJson(index));
      }
      return postTest;
    } else {
      return postTest;
    }
  }
}
