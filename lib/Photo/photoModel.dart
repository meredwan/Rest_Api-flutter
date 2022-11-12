

import 'dart:convert';

List<PhotoTest> photoTestFromJson(String str) =>
    List<PhotoTest>.from(json.decode(str).map((x) => PhotoTest.fromJson(x)));

String photoTestToJson(List<PhotoTest> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PhotoTest {
  PhotoTest({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  factory PhotoTest.fromJson(Map<String, dynamic> json) => PhotoTest(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}
