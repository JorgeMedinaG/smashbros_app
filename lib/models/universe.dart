

class Universe {
    Universe({
        required this.objectId,
        required this.name,
        this.description,
    });

    String objectId;
    String name;
    String? description;


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