// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  bool status;
  List<MatchML> match;
  List<Banner> banner;

  HomeModel({
    required this.status,
    required this.match,
    required this.banner,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        status: json["status"],
        match:
            List<MatchML>.from(json["Match"].map((x) => MatchML.fromJson(x))),
        banner:
            List<Banner>.from(json["banner"].map((x) => Banner.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "Match": List<dynamic>.from(match.map((x) => x.toJson())),
        "banner": List<dynamic>.from(banner.map((x) => x.toJson())),
      };
}

class Banner {
  int id;
  String name;
  String img;

  Banner({
    required this.id,
    required this.name,
    required this.img,
  });

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        id: json["id"],
        name: json["name"],
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "img": img,
      };
}

List<MatchML> matchModelFromJson(String str) => List<MatchML>.from(json.decode(str).map((x) => MatchML.fromJson(x)));

String matchModelToJson(List<MatchML> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class MatchML {
  int? id;
  String? matchName;
  DateTime? matchDate;
  String? matchType;
  String? matchTime;
  String? matchStartTime;
  String? roomName;
  String? roomPass;
  String? matchId;
  String? userId2;
  String? userId1;

  MatchML({
    required this.id,
    required this.matchName,
    required this.matchDate,
    required this.matchType,
    required this.matchTime,
    required this.matchStartTime,
    required this.roomName,
    required this.roomPass,
    required this.matchId,
    required this.userId2,
    required this.userId1,
  });

  factory MatchML.fromJson(Map<String, dynamic> json) => MatchML(
        id: json["id"],
        matchName: json["match_name"],
        matchDate: DateTime.parse(json["match_date"]),
        matchType: json["match_type"],
        matchTime: json["match_time"],
        matchStartTime: json["match_start_time"],
        roomName: json["room_name"],
        roomPass: json["room_pass"],
        matchId: json["match_id"],
        userId2: json["user_id_2"],
        userId1: json["user_id_1"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "match_name": matchName,
        "match_date":
            "${matchDate?.year.toString().padLeft(4, '0')}-${matchDate?.month.toString().padLeft(2, '0')}-${matchDate?.day.toString().padLeft(2, '0')}",
        "match_type": matchType,
        "match_time": matchTime,
        "match_start_time": matchStartTime,
        "room_name": roomName,
        "room_pass": roomPass,
        "match_id": matchId,
        "user_id_2": userId2,
        "user_id_1": userId1,
      };
}
