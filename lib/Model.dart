

import 'dart:convert';

List<SampalTest> sampalTestFromJson(String str) => List<SampalTest>.from(json.decode(str).map((x) => SampalTest.fromJson(x)));

String sampalTestToJson(List<SampalTest> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SampalTest {
    SampalTest({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });

    int userId;
    int id;
    String title;
    String body;

    factory SampalTest.fromJson(Map<String, dynamic> json) => SampalTest(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
