import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/firebase/auth/withPhone/otpScreen.dart';

class Phone extends StatefulWidget {
  const Phone({super.key});

  @override
  State<Phone> createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  final TextEditingController phone = TextEditingController();

  sendCode() async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: '+91' + "" + phone.text,
          verificationCompleted: (PhoneAuthCredential credential) {},
          verificationFailed: (FirebaseAuthException e) {
            Get.snackbar("Error Occured", e.code);
          },
          codeSent: (String vid, int? token) {
            Get.to(() => OtpScreen(
                  vid: vid,
                ));
          },
          codeAutoRetrievalTimeout: (vid) {});
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error occured", e.code);
    } catch (e) {
      Get.snackbar("Errror Occured", e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 182, 50, 17),
        title: const Text("Phone"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Enter your Number",
                style: TextStyle(
                    color: Color.fromARGB(255, 161, 3, 3), fontSize: 20),
              ),
              const SizedBox(
                height: 150,
              ),
              Container(
                height: 300,
                width: 300,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextField(
                        controller: phone,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          prefix: Text("+91"),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          labelText: 'Phone',
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            sendCode();
                          },
                          child: const Text("Send Otp"))
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
