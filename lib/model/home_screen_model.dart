// // To parse this JSON data, do
// //
// //     final categoryResModel = categoryResModelFromJson(jsonString);

// import 'dart:convert';

// CategoryResModel categoryResModelFromJson(String str) => CategoryResModel.fromJson(json.decode(str));

// String categoryResModelToJson(CategoryResModel data) => json.encode(data.toJson());

// class CategoryResModel {
//     String? status;
//     List<Source>? sources;

//     CategoryResModel({
//         this.status,
//         this.sources,
//     });

//     factory CategoryResModel.fromJson(Map<String, dynamic> json) => CategoryResModel(
//         status: json["status"],
//         sources: json["sources"] == null ? [] : List<Source>.from(json["sources"]!.map((x) => Source.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "status": status,
//         "sources": sources == null ? [] : List<dynamic>.from(sources!.map((x) => x.toJson())),
//     };
// }

// class Source {
//     String? id;
//     String? name;
//     String? description;
//     String? url;
//     String? category;
//     String? language;
//     String? country;

//     Source({
//         this.id,
//         this.name,
//         this.description,
//         this.url,
//         this.category,
//         this.language,
//         this.country,
//     });

//     factory Source.fromJson(Map<String, dynamic> json) => Source(
//         id: json["id"],
//         name: json["name"],
//         description: json["description"],
//         url: json["url"],
//         category: json["category"],
//         language: json["language"],
//         country: json["country"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "description": description,
//         "url": url,
//         "category": category,
//         "language": language,
//         "country": country,
//     };
// }
// To parse this JSON data, do
//
//     final homemodel = homemodelFromJson(jsonString);

import 'dart:convert';

Homemodel homemodelFromJson(String str) => Homemodel.fromJson(json.decode(str));

String homemodelToJson(Homemodel data) => json.encode(data.toJson());

class Homemodel {
  String? status;
  int? totalResults;
  List<Article>? articles;

  Homemodel({
    this.status,
    this.totalResults,
    this.articles,
  });

  factory Homemodel.fromJson(Map<String, dynamic> json) => Homemodel(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: json["articles"] == null
            ? []
            : List<Article>.from(
                json["articles"]!.map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": articles == null
            ? []
            : List<dynamic>.from(articles!.map((x) => x.toJson())),
      };
}

class Article {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: json["source"] == null ? null : Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "source": source?.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt?.toIso8601String(),
        "content": content,
      };
}

class Source {
  String? id;
  String? name;

  Source({
    this.id,
    this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
