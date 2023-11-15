
import 'dart:convert';

Patient patientFromJson(String str) => Patient.fromJson(json.decode(str));

String patientToJson(Patient data) => json.encode(data.toJson());

class Patient {
    int? id;
    int? userId;
    int? doctorId;
    int? deviceId;
    dynamic profilePicture;
    String? status;
    DateTime? createdAt;
    DateTime? updatedAt;
    Doctor? user;
    Doctor? doctor;
    Device? device;

    Patient({
        this.id,
        this.userId,
        this.doctorId,
        this.deviceId,
        this.profilePicture,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.user,
        this.doctor,
        this.device,
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
        user: json["user"] == null ? null : Doctor.fromJson(json["user"]),
        doctor: json["doctor"] == null ? null : Doctor.fromJson(json["doctor"]),
        device: json["device"] == null ? null : Device.fromJson(json["device"]),
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
        "user": user?.toJson(),
        "doctor": doctor?.toJson(),
        "device": device?.toJson(),
    };
}

class Device {
    int? id;
    String? deviceName;
    String? macAddress;
    DateTime? createdAt;
    DateTime? updatedAt;

    Device({
        this.id,
        this.deviceName,
        this.macAddress,
        this.createdAt,
        this.updatedAt,
    });

    factory Device.fromJson(Map<String, dynamic> json) => Device(
        id: json["id"],
        deviceName: json["device_name"],
        macAddress: json["mac_address"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "device_name": deviceName,
        "mac_address": macAddress,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
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
