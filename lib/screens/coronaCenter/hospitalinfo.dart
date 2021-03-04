// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    Welcome({
        this.success,
        this.data,
        this.lastRefreshed,
        this.lastOriginUpdate,
    });

    bool success;
    Data data;
    DateTime lastRefreshed;
    DateTime lastOriginUpdate;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        success: json["success"],
        data: Data.fromJson(json["data"]),
        lastRefreshed: DateTime.parse(json["lastRefreshed"]),
        lastOriginUpdate: DateTime.parse(json["lastOriginUpdate"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "lastRefreshed": lastRefreshed.toIso8601String(),
        "lastOriginUpdate": lastOriginUpdate.toIso8601String(),
    };
}

class Data {
    Data({
        this.medicalColleges,
        this.sources,
    });

    List<MedicalCollege> medicalColleges;
    List<String> sources;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        medicalColleges: List<MedicalCollege>.from(json["medicalColleges"].map((x) => MedicalCollege.fromJson(x))),
        sources: List<String>.from(json["sources"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "medicalColleges": List<dynamic>.from(medicalColleges.map((x) => x.toJson())),
        "sources": List<dynamic>.from(sources.map((x) => x)),
    };
}

class MedicalCollege {
    MedicalCollege({
        this.state,
        this.name,
        this.city,
        this.ownership,
        this.admissionCapacity,
        this.hospitalBeds,
    });

    String state;
    String name;
    String city;
    Ownership ownership;
    int admissionCapacity;
    int hospitalBeds;

    factory MedicalCollege.fromJson(Map<String, dynamic> json) => MedicalCollege(
        state: json["state"],
        name: json["name"],
        city: json["city"],
        ownership: json["ownership"] == null ? null : ownershipValues.map[json["ownership"]],
        admissionCapacity: json["admissionCapacity"],
        hospitalBeds: json["hospitalBeds"],
    );

    Map<String, dynamic> toJson() => {
        "state": state,
        "name": name,
        "city": city,
        "ownership": ownership == null ? null : ownershipValues.reverse[ownership],
        "admissionCapacity": admissionCapacity,
        "hospitalBeds": hospitalBeds,
    };
}

enum Ownership { GOVT, TRUST, SOCIETY, UNIVERSITY, GOVT_SOCIETY, PRIVATE, OWNERSHIP_GOVT, OWNERSHIP_SOCIETY }

final ownershipValues = EnumValues({
    "Govt.": Ownership.GOVT,
    "Govt-Society": Ownership.GOVT_SOCIETY,
    "Govt": Ownership.OWNERSHIP_GOVT,
    "society": Ownership.OWNERSHIP_SOCIETY,
    "Private": Ownership.PRIVATE,
    "Society": Ownership.SOCIETY,
    "Trust": Ownership.TRUST,
    "University": Ownership.UNIVERSITY
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
