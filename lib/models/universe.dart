import 'dart:convert';

//TODO:Check later if this is necessary
// Universe universeFromJson(String str) => Universe.fromJson(json.decode(str));

// String universeToJson(Universe data) => json.encode(data.toJson());

class Universe {
    Universe({
        required this.objectId,
        required this.name,
        this.description,
        this.selected = false
    });

    String objectId;
    String name;
    String? description;
    bool selected;


    factory Universe.fromJson(Map<String, dynamic> json) => Universe(
        objectId: json["objectID"],
        name: json["name"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "objectID": objectId,
        "name": name,
        "description": description,
    };
}