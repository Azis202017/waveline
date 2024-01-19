// To parse this JSON data, do
//
//     final detailRecordModel = detailRecordModelFromJson(jsonString);

import 'dart:convert';

DetailRecordModel detailRecordModelFromJson(String str) => DetailRecordModel.fromJson(json.decode(str));

String detailRecordModelToJson(DetailRecordModel data) => json.encode(data.toJson());

class DetailRecordModel {
    num? id;
    num? patientId;
    String? heaPath;
    String? datPath;
    dynamic txtPath;
    num? isVerified;
    DateTime? createdAt;
    DateTime? updatedAt;
    Patient? patient;
    Result? result;
    Feedback? feedback;

    DetailRecordModel({
        this.id,
        this.patientId,
        this.heaPath,
        this.datPath,
        this.txtPath,
        this.isVerified,
        this.createdAt,
        this.updatedAt,
        this.patient,
        this.result,
        this.feedback,
    });

    factory DetailRecordModel.fromJson(Map<String, dynamic> json) => DetailRecordModel(
        id: json["id"],
        patientId: json["patient_id"],
        heaPath: json["hea_path"],
        datPath: json["dat_path"],
        txtPath: json["txt_path"],
        isVerified: json["is_verified"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        patient: json["patient"] == null ? null : Patient.fromJson(json["patient"]),
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
        feedback: json["feedback"] == null ? null : Feedback.fromJson(json["feedback"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "patient_id": patientId,
        "hea_path": heaPath,
        "dat_path": datPath,
        "txt_path": txtPath,
        "is_verified": isVerified,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "patient": patient?.toJson(),
        "result": result?.toJson(),
        "feedback": feedback?.toJson(),
    };
}

class Feedback {
    num? id;
    num? recordId;
    String? text;
    DateTime? createdAt;
    DateTime? updatedAt;

    Feedback({
        this.id,
        this.recordId,
        this.text,
        this.createdAt,
        this.updatedAt,
    });

    factory Feedback.fromJson(Map<String, dynamic> json) => Feedback(
        id: json["id"],
        recordId: json["record_id"],
        text: json["text"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "record_id": recordId,
        "text": text,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

class Patient {
    num? id;
    num? userId;
    num? doctorId;
    num? deviceId;
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
    num? id;
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

class Result {
    num? id;
    num? recordId;
    num? sve;
    num? normal;
    num? ve;
    num? pv;
    num? v;
    num? a;
    num? l;
    num? r;
    num? e;
    num? f;
    num? n;
    String? finalDecision;
    DateTime? createdAt;
    DateTime? updatedAt;

    Result({
        this.id,
        this.recordId,
        this.sve,
        this.normal,
        this.ve,
        this.pv,
        this.v,
        this.a,
        this.l,
        this.r,
        this.e,
        this.f,
        this.n,
        this.finalDecision,
        this.createdAt,
        this.updatedAt,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        recordId: json["record_id"],
        sve: json["SVE"],
        normal: json["normal"],
        ve: json["VE"],
        pv: json["PV"],
        v: json["V"],
        a: json["A"],
        l: json["L"],
        r: json["R"],
        e: json["E"],
        f: json["F"],
        n: json["N"],
        finalDecision: json["final_decision"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "record_id": recordId,
        "SVE": sve,
        "normal": normal,
        "VE": ve,
        "PV": pv,
        "V": v,
        "A": a,
        "L": l,
        "R": r,
        "E": e,
        "F": f,
        "N": n,
        "final_decision": finalDecision,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
