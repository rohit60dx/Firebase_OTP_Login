import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:practice/login&SignupWithApi/auth/login.dart';
import 'package:practice/login&SignupWithApi/auth/model/signupModel.dart';

class signUpController extends GetxController {
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPass = TextEditingController();
  String msg = '';

  Future<void> createAccount() async {
    signupModel user = signupModel(
        firstname: firstname.text,
        lastname: lastname.text,
        email: email.text,
        phone: phone.text,
        password: password.text,
        confirmPass: confirmPass.text);
    await authCreateAccount(user);
    firstname.clear();
    lastname.clear();
    email.clear();
    phone.clear();
    password.clear();
    confirmPass.clear();
  }
  //   bool validateResult = validateUser(user);
  //   if (validateResult) {
  //   } else {
  //     Get.snackbar(
  //       'Validation Error',
  //       msg,
  //       snackPosition: SnackPosition.BOTTOM,
  //       duration: const Duration(seconds: 3),
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );
  //   }
  // }

  // bool validateUser(signupModel user) {
  //   if (user.username.toString().isEmpty) {
  //     msg = 'Username is empty';
  //     return false;
  //   }
  //   if (user.password.toString().isEmpty) {
  //     msg = "Password is empty";
  //     return false;
  //   }
  //   return true;
  // }

  Future authCreateAccount(signupModel user) async {
    try {
      Map<String, dynamic> bodyData = {
        "first_name": firstname.text.trim(),
        "last_name": lastname.text.trim(),
        "email": email.text.trim(),
        "phone_number": phone.text.trim(),
        "password": password.text.trim(),
        "password2": confirmPass.text.trim()
      };
      final response = await post(
          Uri.parse("http://157.245.97.144:8000/register/"),
          body: bodyData);
      print('Request Body: $bodyData');
      if (response.statusCode == 201) {
        print("account created");
        Get.off(() => loginScreen());
        Get.snackbar(
          "Confirm",
          "User Account Created Successfully",
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          "oh ho",
          response.body,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 5),
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        throw Exception(
            'Api failed with status code ${response.statusCode}. Error: ${response.body}');
      }
    } catch (e) {
      Get.snackbar(
        "Oh No!",
        "Account Crteated Failed",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      throw Exception("Api failed $e");
    }
  }
}
