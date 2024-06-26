import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  RxString obscureText = "Show".obs;
  RxBool obscure = true.obs;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  // final ApiService _apiService = Get.find<ApiService>();

  void obscureFunction() {
    if (obscureText.value == "Show") {
      obscureText.value = "Hide";
      obscure.value = false;
      log(obscureText.value);
    } else {
      obscureText.value = "Show";
      log(obscureText.value);
      obscure.value = true;
    }
  }

  // Future<LoginResponseModel> login(String username, String password) async {
  //   try {
  //     http.Response response = await _apiService.apiRequest(
  //         endPoint: 'user-login-username',
  //         params: {"email": username, "password": password});
  //     log("response is ${response.body}", name: "LOGINCONTROLLER");
  //     AppStorage().writeAccessToken(
  //         jsonDecode(response.body)["result"]["data"]["token"]);
  //     AppStorage().writeIsLoggedIn(true);
  //     LoginResponseModel data =
  //         LoginResponseModel.fromJson(json.decode(response.body));
  //         int userId = data.result?.data.userId??-1;
  //         AppStorage().writeUserId(userId);
  //         AppStorage().writeProfileName(data.result?.data.profileName??"");
  //         AppStorage().writeProfilePic(data.result?.data.profileImageUrl??"");
        
  //         log("::::::::::::::::::::::::${AppStorage().getAccessToken()} ist your access token");
  //     return data;
  //   } catch (e) {
  //     debugPrint("-------Api issue in : ${e.toString()}");
  //     return LoginResponseModel();
  //   }
  // }

  String? userValidator(String val) {
    if (val.trim().isEmpty) {
      return "Enter email";
    }
    final emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (!emailRegex.hasMatch(val)) {
      return "Enter a valid email address";
    }
    return null;
  }

  String? passwordValidator(String val) {
    if (val.trim().isEmpty) {
      return "Enter password";
    }
    final passwordRegex = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,32}$');
    if (!passwordRegex.hasMatch(val)) {
      return "Password must contain 8 character, a uppercase and lowercase letter, a digit and a special character";
    }
    return null;
  }

//TODO: Implement LoginController
  final count = 0.obs;
  void increment() => count.value++;
}