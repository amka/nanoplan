import 'dart:convert';

class TeamMember {
  String firstName;
  String? lastName;
  String email;
  String? role;
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  List<dynamic> permissions;
  String databaseId;
  String collectionId;

  TeamMember({
    required this.firstName,
    this.lastName,
    required this.email,
    this.role,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.permissions,
    required this.databaseId,
    required this.collectionId,
  });

  factory TeamMember.fromRawJson(String str) =>
      TeamMember.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TeamMember.fromJson(Map<String, dynamic> json) => TeamMember(
        firstName: json["firstName"],
        lastName: json["lastName"] ?? '',
        email: json["email"],
        role: json["role"] ?? '',
        id: json["\u0024id"],
        createdAt: DateTime.parse(json["\u0024createdAt"]),
        updatedAt: DateTime.parse(json["\u0024updatedAt"]),
        permissions:
            List<dynamic>.from(json["\u0024permissions"].map((x) => x)),
        databaseId: json["\u0024databaseId"],
        collectionId: json["\u0024collectionId"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "role": role,
        "\u0024id": id,
        "\u0024createdAt": createdAt.toIso8601String(),
        "\u0024updatedAt": updatedAt.toIso8601String(),
        "\u0024permissions": List<dynamic>.from(permissions.map((x) => x)),
        "\u0024databaseId": databaseId,
        "\u0024collectionId": collectionId,
      };
}
