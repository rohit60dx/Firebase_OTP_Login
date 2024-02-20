import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/login&SignupWithApi/auth/controller/loginController.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final controller = Get.put(loginController());
  // void loginAccount(String email, password) async {
  //   try {
  //     var response = await post(Uri.parse("http://192.168.1.12:8000/login/"),
  //         body: {"username": email, "password": password});

  //     if (response.statusCode == 200) {
  //       print("account login");
  //       Get.to(() => Home());
  //     } else {
  //       print('Login error: ${response}');
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
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 150,
              ),
              SizedBox(
                height: 300,
                width: 300,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextField(
                        controller: controller.username,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          labelText: 'Email/phone',
                        ),
                      ),
                      TextField(
                        controller: controller.pass,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          labelText: 'Password',
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            controller.submit();
                          },
                          child: const Text("Login"))
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
