
import 'package:flutter/material.dart';

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
    int price;
    bool popular;
    int rate;
    String downloads;
    String description;
    String createdAt;
    String imageUrl;
    UniqueKey heroId = UniqueKey();

    factory Fighter.fromJson(Map<String, dynamic> json) => Fighter(
        objectId: json["objectID"],
        name: json["name"],
        universe: json["universe"],
        price: int.tryParse(json["price"]) ?? 0,
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
