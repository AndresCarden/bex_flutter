// To parse this JSON data, do
//
//     final modelJson = modelJsonFromJson(jsonString);

import 'dart:convert';

List<ModelJson> modelJsonFromJson(String str) => List<ModelJson>.from(json.decode(str).map((x) => ModelJson.fromJson(x)));

String modelJsonToJson(List<ModelJson> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelJson {
  ModelJson({
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

  factory ModelJson.fromJson(Map<String, dynamic> json) => ModelJson(
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
