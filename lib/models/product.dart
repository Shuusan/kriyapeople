import 'dart:convert';

List<ItemResponse> itemResponseFromJson(String str) => List<ItemResponse>.from(json.decode(str).map((x) => ItemResponse.fromJson(x)));
String itemResponseToJson(List<ItemResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemResponse {
    ItemResponse({
        this.userId,
        this.id,
        required this.title,
        this.completed,
    });

    int? userId;
    int? id;
    String title;
    bool? completed;

    factory ItemResponse.fromJson(Map<String, dynamic> json) => ItemResponse(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
    };
}
