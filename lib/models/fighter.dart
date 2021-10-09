// To parse this JSON data, do
//
//     final fighter = fighterFromJson(jsonString);

import 'dart:convert';
// TODO:Check this later
// Fighter fighterFromJson(String str) => Fighter.fromJson(json.decode(str));

// String fighterToJson(Fighter data) => json.encode(data.toJson());

class Fighter {
    Fighter({
        required this.objectId,
        required this.name,
        required this.universe,
        required this.price,
        required this.popular,
        required this.rate,
        required this.downloads,
        required this.description,
        required this.createdAt,
        required this.imageUrl,
    });

    String objectId;
    String name;
    String universe;
    String price;
    bool popular;
    int rate;
    String downloads;
    String description;
    String createdAt;
    String imageUrl;

    factory Fighter.fromJson(Map<String, dynamic> json) => Fighter(
        objectId: json["objectID"],
        name: json["name"],
        universe: json["universe"],
        price: json["price"],
        popular: json["popular"],
        rate: json["rate"],
        downloads: json["downloads"],
        description: json["description"],
        createdAt: json["created_at"],
        imageUrl: json["imageURL"],
    );

    Map<String, dynamic> toJson() => {
        "objectID": objectId,
        "name": name,
        "universe": universe,
        "price": price,
        "popular": popular,
        "rate": rate,
        "downloads": downloads,
        "description": description,
        "created_at": createdAt,
        "imageURL": imageUrl,
    };
}
