
import 'dart:convert';

ReportesVw reportesVwFromJson(String str) => ReportesVw.fromJson(json.decode(str));

String reportesVwToJson(ReportesVw data) => json.encode(data.toJson());

class ReportesVw {
    ReportesVw({
       required this.status,
       required this.message,
       required this.data,
    });

    bool status;
    String message;
    List<Datum> data;

    factory ReportesVw.fromJson(Map<String, dynamic> json) => ReportesVw(
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
       required this.studentId,
       required this.description,
        this.image,
       required this.status,
       required this.createdAt,
       required this.updatedAt,
    });

    int id;
    int studentId;
    String description;
    String? image;
    String status;
    DateTime createdAt;
    DateTime updatedAt;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        studentId: json["student_id"],
        description: json["description"],
        image: json["image"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "student_id": studentId,
        "description": description,
        "image": image,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
