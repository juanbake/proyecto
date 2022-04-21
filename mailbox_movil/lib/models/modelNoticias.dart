// To parse this JSON data, do
//
//     final noticias = noticiasFromJson(jsonString);

import 'dart:convert';

Noticias noticiasFromJson(String str) => Noticias.fromJson(json.decode(str));

String noticiasToJson(Noticias data) => json.encode(data.toJson());

class Noticias {
    Noticias({
       required this.status,
       required this.message,
       required this.data,
    });

    bool status;
    String message;
    List<Datum> data;

    factory Noticias.fromJson(Map<String, dynamic> json) => Noticias(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
       required this.id,
       required this.adminId,
       required this.description,
       required this.image,
        this.numOfReactions,
        this.numOfComments,
       required this.createdAt,
       required this.updatedAt,
    });

    int id;
    int adminId;
    String description;
    String image;
    String? numOfReactions;
    String? numOfComments;
    DateTime createdAt;
    DateTime updatedAt;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        adminId: json["admin_id"],
        description: json["description"],
        image: json["image"],
        numOfReactions: json["num_of_reactions"],
        numOfComments: json["num_of_comments"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "admin_id": adminId,
        "description": description,
        "image": image,
        "num_of_reactions": numOfReactions,
        "num_of_comments": numOfComments,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
