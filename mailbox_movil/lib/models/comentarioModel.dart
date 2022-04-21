
import 'dart:convert';

Comentarios comentariosFromJson(String str) => Comentarios.fromJson(json.decode(str));

String comentariosToJson(Comentarios data) => json.encode(data.toJson());

class Comentarios {
    Comentarios({
       required this.status,
       required this.message,
        required this.data,
    });

    bool status;
    String message;
    List<Datum> data;

    factory Comentarios.fromJson(Map<String, dynamic> json) => Comentarios(
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
      required this.newsId,
      required this.studentId,
      required this.comment,
      required this.createdAt,
      required this.updatedAt,
    });

    int id;
    int newsId;
    int studentId;
    String comment;
    DateTime createdAt;
    DateTime updatedAt;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        newsId: json["news_id"],
        studentId: json["student_id"],
        comment: json["comment"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "news_id": newsId,
        "student_id": studentId,
        "comment": comment,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
