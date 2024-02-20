import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/login&SignupWithApi/auth/login.dart';
import 'package:practice/login&SignupWithApi/auth/controller/signupController.dart';

class signupScreen extends StatefulWidget {
  const signupScreen({super.key});

  @override
  State<signupScreen> createState() => _signupScreenState();
}

class _signupScreenState extends State<signupScreen> {
  final controller = Get.put(signUpController());

  // void CreateAccount() async {
  //   try {
  //     var response =
  //         await post(Uri.parse("http://157.245.97.144:8000/register/"), body: {
  //       "first_name": firstname.text,
  //       "last_name": lastname.text,
  //       "email": email.text,
  //       "phone_number": phone.text,
  //       "password": password.text,
  //       "password2": confirmPass.text
  //     });

  //     if (response.statusCode == 201) {
  //       print("account login");
  //       Get.snackbar(
  //         "WelCome",
  //         "User Account Created Successfully",
  //         snackPosition: SnackPosition.BOTTOM,
  //         duration: const Duration(seconds: 3),
  //         backgroundColor: Colors.red,
  //         colorText: Colors.white,
  //       );
  //       Get.to(() => const loginScreen());
  //     } else {
  //       Get.snackbar(
  //         "ohh",
  //         response.body,
  //         snackPosition: SnackPosition.BOTTOM,
  //         duration: const Duration(seconds: 4),
  //         backgroundColor: Colors.red,
  //         colorText: Colors.white,
  //       );
  //       throw Exception('Error: ${response.body}');
  //     }
  //   } catch (e) {
  //     print('erorrorr$e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 182, 50, 17),
        title: const Text("SignUp"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: controller.firstname,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  labelText: 'First',
                ),
              ),
              TextField(
                controller: controller.lastname,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  labelText: 'last',
                ),
              ),
              TextField(
                controller: controller.email,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  labelText: 'Email',
                ),
              ),
              TextField(
                controller: controller.phone,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  labelText: 'phone',
                ),
              ),
              TextField(
                controller: controller.password,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  labelText: 'password',
                ),
              ),
              TextField(
                controller: controller.confirmPass,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  labelText: 'confirm password',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        controller.createAccount();
                      },
                      child: const Text("Sign Up")),
                  ElevatedButton(
                      onPressed: () {
                        Get.to(() => const loginScreen());
                      },
                      child: const Text("Login")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
