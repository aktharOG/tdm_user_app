// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tdm_user_app/services/dio_services/apis.dart';

import 'package:tdm_user_app/services/pref_services/pref_service.dart';

//String ip = "192.168.29.107:8000";
// String live = "masterz.noviindus.in";
// String url = "https://$live";
// String baseUrl = "$url/api/";
// String mediaBaseUrl = url;
// //String baseUrlVideo = "http://$ip:8000";

enum apiMethod {
  get,
  post,
  delete,
  update,
}

class ResponseML {
  Response? response;
  Failed? failed;

  ResponseML({required this.response, required this.failed});
}

// class Success {
//   final String? message;
//   final Response? status;

//   Success({required this.message, required this.status});
// }

class Failed {
  String? message;
  int? status;

  Failed({required this.message, required this.status});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'status': status,
    };
  }

  factory Failed.fromMap(Map<String, dynamic> map) {
    return Failed(
      message: map['message'] != null ? map['message'] as String : null,
      status: map['status'] != null ? map['status'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Failed.fromJson(String source) =>
      Failed.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ApiService {
// static Response
  // static Map errorResponse = {};
  static ResponseML responseML = ResponseML(response: null, failed: null);
  static Dio dio = Dio();

  static Future<void> dioInitializerAndSetter({required String token}) async {
    if (token.length > 5) {
      String tokenFromShared;
      await SharedPreferencesService.prefs.setString("token", token);
      tokenFromShared = await SharedPreferenceController().getToken() ?? '';

      print(tokenFromShared);
      dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $tokenFromShared';
      print(dio.options.headers['Authorization'] = 'Bearer $tokenFromShared');
    }
  }

  ///token remover
  static Future<void> tokenRemover() async {
    // dio.options.headers["Authorization"] = "";
    print("token remover");
  }

  ///api method set up
  static Future<ResponseML>? apiMethodSetup(
      {required apiMethod method,
      required String url,
      var data,
      var queryParameters,
      Function(int, int)? onSendProgress,
      Function(int, int)? onRecieveProgress,
      Options? options}) async {
    dio.options.baseUrl = Apis.baseUrl;
    dio.options.connectTimeout = const Duration(milliseconds: 10000);
    dio.options.receiveTimeout = const Duration(milliseconds: 10000);
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Accept'] = 'application/json';
    //  dio.options.contentType = Headers.acceptHeader;
    try {
      print("api==>>$url");
      // if(data!=null){
      // print("data==>${data.fields}");

      // }
      //? response;
      //  int? statusCode;
      switch (method) {
        case apiMethod.get:
          if (data != null) {
            responseML.response =
                await dio.get(url, data: data, options: options ?? Options());
          } else {
            responseML.response = await dio.get(url,
                queryParameters: queryParameters,
                options: options ?? Options());
          }
          break;
        case apiMethod.post:
          responseML.response = await dio.post(url,
              data: data,
              queryParameters: queryParameters,
              onSendProgress: onSendProgress,
              onReceiveProgress: onRecieveProgress,
              options: options ?? Options());
          break;
        case apiMethod.delete:
          responseML.response = await dio.delete(url,
              data: data,
              queryParameters: queryParameters,
              options: options ?? Options());
          break;
        // ignore: todo
        // TODO: Handle this case.

        case apiMethod.update:
          responseML.response = await dio.patch(url,
              data: data,
              queryParameters: queryParameters,
              onSendProgress: onSendProgress,
              onReceiveProgress: onRecieveProgress,
              options: options);
          break;
      }

      return responseML;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
      } else if (e.response?.statusCode == 500) {
      } else if (e.response?.statusCode == 404) {
        responseML.failed = Failed.fromMap(Failed(
                message: e.response?.data["msg"],
                status: e.response?.statusCode)
            .toMap());
      } else if (e.response?.statusCode == 409) {
      } else if (e.type == DioExceptionType.receiveTimeout) {
      } else if (e.type == DioExceptionType.connectionTimeout) {
      } else if (e.error is SocketException) {
      } else {
        print("error $e");
      }
    }
    return responseML;
  }
}
