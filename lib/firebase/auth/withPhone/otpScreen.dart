import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:practice/firebase/BottomNavBar/bottombar.dart';

class OtpScreen extends StatefulWidget {
  final String vid;
  const OtpScreen({
    super.key,
    required this.vid,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  var code = "";
  singIn() async {
    PhoneAuthCredential credential =
        PhoneAuthProvider.credential(verificationId: widget.vid, smsCode: code);
    try {
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) => Get.offAll(() => const BottomBar()));
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error Occured", e.code);
    } catch (e) {
      Get.snackbar("Error Occured", e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              "OTP Verification",
              style: TextStyle(fontSize: 30),
            ),
          ),
          const Text(
            "Enter OTP sent to +91 255145215",
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          textCode(),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                singIn();
              },
              child: const Text("Verifiy"))
        ],
      )),
    );
  }

  Widget textCode() {
    return Center(
      child: Pinput(
        length: 6,
        onChanged: (value) {
          setState(() {
            code = value;
          });
        },
      ),
    );
  }
}
