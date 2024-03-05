// To parse this JSON data, do
//
//     final createMatchModel = createMatchModelFromJson(jsonString);

import 'dart:convert';

CreateMatchModel createMatchModelFromJson(String str) => CreateMatchModel.fromJson(json.decode(str));

String createMatchModelToJson(CreateMatchModel data) => json.encode(data.toJson());

class CreateMatchModel {
    String? matchName;
    DateTime? matchDate;
    String? matchType;
    String? matchTime;
    String? matchStartTime;
    String? roomName;
    String? roomPass;
    String? matchId;
    String? userId1;
    String? userId2;
    String? userId;

    CreateMatchModel({
        required this.matchName,
        required this.matchDate,
        required this.matchType,
        required this.matchTime,
        required this.matchStartTime,
        required this.roomName,
        required this.roomPass,
        required this.matchId,
        required this.userId1,
        required this.userId2,
        required this.userId,
    });

    factory CreateMatchModel.fromJson(Map<String, dynamic> json) => CreateMatchModel(
        matchName: json["match_name"],
        matchDate: DateTime.parse(json["match_date"]),
        matchType: json["match_type"],
        matchTime: json["match_time"],
        matchStartTime: json["match_start_time"],
        roomName: json["room_name"],
        roomPass: json["room_pass"],
        matchId: json["match_id"],
        userId1: json["user_id_1"],
        userId2: json["user_id_2"],
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "match_name": matchName,
        "match_date": "${matchDate?.year.toString().padLeft(4, '0')}-${matchDate?.month.toString().padLeft(2, '0')}-${matchDate?.day.toString().padLeft(2, '0')}",
        "match_type": matchType,
        "match_time": matchTime,
        "match_start_time": matchStartTime,
        "room_name": roomName,
        "room_pass": roomPass,
        "match_id": matchId,
        "user_id_1": userId1,
        "user_id_2": userId2,
        "user_id": userId,
    };
}
