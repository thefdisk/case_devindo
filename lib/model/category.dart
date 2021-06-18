import 'dart:convert';

List<Category> categoryFromJson(String str) =>
    List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));

String categoryToJson(List<Category> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Category {
  Category({
    this.title,
    this.content,
  });

  String title;
  List<Content> content;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        title: json["title"],
        content:
            List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": List<dynamic>.from(content.map((x) => x.toJson())),
      };
}

class Content {
  Content({
    this.title,
    this.code,
    this.subtitle,
  });

  String title;
  String code;
  String subtitle;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        title: json["title"],
        code: json["code"],
        subtitle: json["subtitle"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "code": code,
        "subtitle": subtitle,
      };
}
