import 'dart:convert';

ReviewApiResponse reviewApiResponseFromJson(String str) =>
    ReviewApiResponse.fromJson(json.decode(str));

String reviewApiResponseToJson(ReviewApiResponse data) =>
    json.encode(data.toJson());

class ReviewApiResponse {
  String message;
  List<Datum> data;

  ReviewApiResponse({
    required this.message,
    required this.data,
  });

  factory ReviewApiResponse.fromJson(Map<String, dynamic> json) =>
      ReviewApiResponse(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String reviewId;
  String username;
  String comment;
  String userId;
  int ratings;
  String source;
  String category;
  String createdAt;
  String updatedAt;

  Datum({
    required this.reviewId,
    required this.username,
    required this.comment,
    required this.userId,
    required this.ratings,
    required this.source,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        reviewId: json['reviewId'],
        username: json['username'],
        comment: json['comment'],
        userId: json['userId'],
        ratings: json['ratings'],
        source: json['source'],
        category: json['category'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
      );

  Map<String, dynamic> toJson() => {
        'reviewId': reviewId,
        'username': username,
        'comment': comment,
        'userId': userId,
        'ratings': ratings,
        'source': source,
        'category': category,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}
