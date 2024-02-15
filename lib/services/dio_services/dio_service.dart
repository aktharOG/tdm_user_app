
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
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
   String? status;

  Failed({required this.message, required this.status});
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
    // dio.options.contentType = Headers.acceptHeader;
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
      //  print(e);
      // push(navigatorKey.currentContext!, const RegistrationScreen());
      // final authPro = Provider.of<AuthProviderPR>(navigatorKey.currentContext!,
      //     listen: false);
      // authPro.verifyOFF();
      if (e.response?.statusCode == 401) {
        responseML.failed?.status = "401";
        responseML.failed?.message = "Authorization error";
        // errorResponse["message"] = "Authorization error";
        Fluttertoast.showToast(msg: 'Authorization error');
        SharedPreferencesService.prefs.clear();

        //   pushAndRemoveUntil(navigatorKey.currentState!.context, const LoginScreen());
        // print(errorResponse);
      } else if (e.response?.statusCode == 500) {
        Fluttertoast.cancel();
        Fluttertoast.showToast(msg: 'Server Error');
        // pushAndRemoveUntil(
        //     navigatorKey.currentState!.context, const NoInternetScreen());
      } else if (e.response?.statusCode == 404) {
         responseML.failed?.status = "404";
        responseML.failed?.message = "Not Found";
        Fluttertoast.cancel();
        // Fluttertoast.showToast(msg: 'Server Error');

        ///  showSnackBar(navigatorKey.currentContext!, "message");
        ///   push(navigatorKey.currentContext!, const RegistrationScreen());

        // pushAndRemoveUntil(
        //     navigatorKey.currentState!.context, const NoInternetScreen());
      } else if (e.response?.statusCode == 409) {
        responseML.failed?.status = "409";
        responseML.failed?.message = e.response?.data["message"];

        // pushAndRemoveUntil(
        //     navigatorKey.currentState!.context, const NoInternetScreen());
      } else if (e.type == DioErrorType.receiveTimeout) {
        Fluttertoast.cancel();

        Fluttertoast.showToast(msg: 'Check your network speed');
        // pushAndRemoveUntil(
        //     navigatorKey.currentState!.context, const NoInternetScreen());
      } else if (e.type == DioErrorType.connectionTimeout) {
        Fluttertoast.cancel();

        Fluttertoast.showToast(msg: 'Check your connectivity');
        // pushAndRemoveUntil(
        //     navigatorKey.currentState!.context, const NoInternetScreen());
      } else if (e.error is SocketException) {
        // errorResponse["status"] = "101";
        // errorResponse["message"] = "internet error";
        Fluttertoast.cancel();

        Fluttertoast.showToast(msg: 'Please check your network');
        //   print(errorResponse);
        // pushAndRemoveUntil(
        //     navigatorKey.currentState!.context, const NoInternetScreen());
      } else {
        print("103");
      }
    }
    return responseML;
  }
}
