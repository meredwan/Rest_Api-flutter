import 'dart:convert';

List<PostTest> postTestFromJson(String str) =>
    List<PostTest>.from(json.decode(str).map((x) => PostTest.fromJson(x)));

String postTestToJson(List<PostTest> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostTest {
  PostTest({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  int postId;
  int id;
  String name;
  String email;
  String body;

  factory PostTest.fromJson(Map<String, dynamic> json) => PostTest(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
      };
}
