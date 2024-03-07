// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tdm_user_app/helpers/navigations.dart';
import 'package:tdm_user_app/services/dio_services/apis.dart';
import 'package:tdm_user_app/services/dio_services/dio_service.dart';
import 'package:tdm_user_app/view/model/body/create_match_model.dart';
import 'package:tdm_user_app/view/model/home_model.dart';

class MatchProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController idPassTimeController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController roomIDController = TextEditingController();
  TextEditingController roomPassController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  List<MatchML> yourMatchesList = [];

  bool isLoading = false;
  onCreateMatch() async {
    isLoading = true;
    notifyListeners();
    CreateMatchModel createMatchModel = CreateMatchModel(
        matchName: nameController.text,
        matchDate: DateTime.now(),
        matchType: null,
        matchTime: idPassTimeController.text,
        matchStartTime: startTimeController.text,
        roomName: nameController.text,
        roomPass: roomPassController.text,
        matchId: null,
        userId1: null,
        userId2: null,
        userId: null);
    ResponseML? res = await ApiService.apiMethodSetup(
        method: apiMethod.post,
        url: Apis.matchCreate,
        data: createMatchModel.toJson());

    if (res != null) {
      if (res.response != null) {
        print(res.response!.data);
        showSnackBar(
            navigatorKey.currentContext!, res.response!.data["message"]);
            onFetchYourMatches();
        pop(navigatorKey.currentContext);
        clearData();
      }
    }
    isLoading = false;
    notifyListeners();
  }

  clearData() {
    nameController.clear();
    idPassTimeController.clear();
    roomIDController.clear();
    roomPassController.clear();
    priceController.clear();
    startTimeController.clear();
    notifyListeners();
  }

  onFetchYourMatches() async {
    ResponseML? res = await ApiService.apiMethodSetup(
        method: apiMethod.get, url: Apis.youMatches);

    if (res != null) {
      if (res.response != null) {
        print("your matches : ${res.response!.data}");
        yourMatchesList =
            matchModelFromJson(jsonEncode(res.response!.data["Match"]));
            notifyListeners();
      } else {
        showSnackBar(navigatorKey.currentContext!, "Something went wrong");
      }
    }
    notifyListeners();
  }

  onDeleteMatches(id) async {
    final data = {"id": id};
    print("data : $data");
    ResponseML? res = await ApiService.apiMethodSetup(
        method: apiMethod.delete, url: Apis.deleteMatch, data: data);

    if (res != null) {
      if (res.response != null) {
        showSnackBar(navigatorKey.currentContext!, res.response!.data["msg"]);
        onFetchYourMatches();
      } else {
        showSnackBar(navigatorKey.currentContext!, "Something went wrong");
      }
    }
    notifyListeners();
  }
}
