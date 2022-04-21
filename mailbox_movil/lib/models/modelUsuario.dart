
import 'dart:convert';

// To parse this JSON data, do
//
//     final usuarioInfo = usuarioInfoFromJson(jsonString);

import 'dart:convert';

UsuarioInfo usuarioInfoFromJson(String str) => UsuarioInfo.fromJson(json.decode(str));

String usuarioInfoToJson(UsuarioInfo data) => json.encode(data.toJson());

class UsuarioInfo {
    UsuarioInfo({
       required this.status,
      required  this.message,
      required  this.data,
    });

    bool status;
    String message;
    Data data;

    factory UsuarioInfo.fromJson(Map<String, dynamic> json) => UsuarioInfo(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    Data({
       required this.id,
      required  this.name,
      required  this.surname,
       required this.career,
      required  this.email,
        this.emailVerifiedAt,
     required   this.createdAt,
      required  this.updatedAt,
    });

    int id;
    String name = "NULL";
    String surname ="NULL";
    String career;
    String email;
    dynamic emailVerifiedAt;
    DateTime createdAt;
    DateTime updatedAt;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        surname: json["surname"],
        career: json["career"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "surname": surname,
        "career": career,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}




/*
class usuarioData {
    int? id;
    String? name;
    String? surname;
    String? career;
    String? email;
    String?  email_verified_at;
    DateTime? createdAt;
    DateTime? updatedAt;

   usuarioData(id,name,surname,career,email, email_verified_at,createdAt,updatedAt){
       this.id=id;
       this.name=name;
       this.surname=surname;
       this.career=career;
       this.email=email;
       this.email_verified_at=email_verified_at;
       this.createdAt=createdAt;
       this.updatedAt=updatedAt;

    } 

 
  
}*/