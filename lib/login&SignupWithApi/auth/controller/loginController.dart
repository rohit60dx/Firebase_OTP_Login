import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:practice/API/screen/apiScreen.dart';
import 'package:practice/login&SignupWithApi/auth/model/loginModel.dart';

class loginController extends GetxController {
  final TextEditingController username = TextEditingController();
  final TextEditingController pass = TextEditingController();
  String msg = '';
  Future<void> submit() async {
    userModel user = userModel(username: username.text, password: pass.text);
    bool validateResult = validateUser(user);
    if (validateResult) {
      await authLogin(user);
      username.clear();
      pass.clear();
    } else {
      Get.snackbar(
        'Validation Error',
        msg,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  bool validateUser(userModel user) {
    if (user.username.toString().isEmpty) {
      msg = 'Username is empty';
      return false;
    }
    if (user.password.toString().isEmpty) {
      msg = "Password is empty";
      return false;
    }
    return true;
  }

  Future authLogin(userModel user) async {
    try {
      Map<String, dynamic> bodyData = {
        'username': user.username.trim(),
        'password': user.password.trim()
      };
      final response = await post(
          Uri.parse("http://157.245.97.144:8000/login/"),
          body: bodyData);
      print('Request Body: $bodyData');
      if (response.statusCode == 200) {
        print("account login");
        Get.off(() => fecthData());
        Get.snackbar(
          "WelCome",
          "User Login Successfully",
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else {
        throw Exception(
            'Api failed with status code ${response.statusCode}. Error: ${response.body}');
      }
    } catch (e) {
      Get.snackbar(
        "Oh No!",
        "login Failed",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      throw Exception("Api failed $e");
    }
  }
}
