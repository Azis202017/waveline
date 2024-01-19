// To parse this JSON data, do
//
//     final feedbackModel = feedbackModelFromJson(jsonString);

import 'dart:convert';

FeedbackModel feedbackModelFromJson(String str) => FeedbackModel.fromJson(json.decode(str));

String feedbackModelToJson(FeedbackModel data) => json.encode(data.toJson());

class FeedbackModel {
    int? id;
    int? recordId;
    String? text;
    DateTime? createdAt;
    DateTime? updatedAt;
    Record? record;

    FeedbackModel({
        this.id,
        this.recordId,
        this.text,
        this.createdAt,
        this.updatedAt,
        this.record,
    });

    factory FeedbackModel.fromJson(Map<String, dynamic> json) => FeedbackModel(
        id: json["id"],
        recordId: json["record_id"],
        text: json["text"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        record: json["record"] == null ? null : Record.fromJson(json["record"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "record_id": recordId,
        "text": text,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "record": record?.toJson(),
    };
}

class Record {
    int? id;
    int? patientId;
    String? heaPath;
    String? datPath;
    int? isVerified;
    DateTime? createdAt;
    DateTime? updatedAt;
    Patient? patient;

    Record({
        this.id,
        this.patientId,
        this.heaPath,
        this.datPath,
        this.isVerified,
        this.createdAt,
        this.updatedAt,
        this.patient,
    });

    factory Record.fromJson(Map<String, dynamic> json) => Record(
        id: json["id"],
        patientId: json["patient_id"],
        heaPath: json["hea_path"],
        datPath: json["dat_path"],
        isVerified: json["is_verified"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        patient: json["patient"] == null ? null : Patient.fromJson(json["patient"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "patient_id": patientId,
        "hea_path": heaPath,
        "dat_path": datPath,
        "is_verified": isVerified,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "patient": patient?.toJson(),
    };
}

class Patient {
    int? id;
    int? userId;
    int? doctorId;
    int? deviceId;
    dynamic profilePicture;
    String? status;
    DateTime? createdAt;
    DateTime? updatedAt;
    Doctor? doctor;
    Doctor? user;

    Patient({
        this.id,
        this.userId,
        this.doctorId,
        this.deviceId,
        this.profilePicture,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.doctor,
        this.user,
    });

    factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json["id"],
        userId: json["user_id"],
        doctorId: json["doctor_id"],
        deviceId: json["device_id"],
        profilePicture: json["profile_picture"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        doctor: json["doctor"] == null ? null : Doctor.fromJson(json["doctor"]),
        user: json["user"] == null ? null : Doctor.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "doctor_id": doctorId,
        "device_id": deviceId,
        "profile_picture": profilePicture,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "doctor": doctor?.toJson(),
        "user": user?.toJson(),
    };
}

class Doctor {
    int? id;
    String? name;
    String? email;
    dynamic emailVerifiedAt;
    String? roles;
    DateTime? createdAt;
    DateTime? updatedAt;

    Doctor({
        this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.roles,
        this.createdAt,
        this.updatedAt,
    });

    factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        roles: json["roles"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "roles": roles,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
