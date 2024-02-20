import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practice/firebase/auth/signup.dart';
import 'package:practice/firebase/widget/userCard.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final user = FirebaseAuth.instance.currentUser;
  File? pickedImage;

  signout() async {
    await FirebaseAuth.instance.signOut();
    // Get.offAll(() => const SingUp());
  }

  getImage(ImageSource imageSource) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageSource);
      if (photo == null) return;
      final temImage = File(photo.path);
      setState(() {
        pickedImage = temImage;
      });
    } catch (e) {
      print('not get imageeee$e');
    }
  }

  saveFirebase() async {
    try {
      UploadTask uploadTask = FirebaseStorage.instance
          .ref("Profile")
          .child("${user!.email}")
          .putFile(pickedImage!);
      TaskSnapshot taskSnapshot = await uploadTask;
      String url = await taskSnapshot.ref.getDownloadURL();
      const SnackBar(content: Text('Yay! Image Loaded'));
      print("image url $url");
      FirebaseFirestore.instance.collection("profile").doc(user!.email).set({
        "name": user!.email.toString(),
        "image": url,
      }).then((value) {
        print("DATA UPLOADEDDDDD");
      });
    } catch (e) {
      print("notsaveeee${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () async {
                      await getImage(ImageSource.gallery);
                      await saveFirebase();
                    },
                    child: Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.deepPurple,
                        ),
                        child: pickedImage != null
                            ? CircleAvatar(
                                radius: 80,
                                backgroundImage: FileImage(pickedImage!),
                              )
                            : const CircleAvatar(
                                child: Icon(Icons.person),
                              ))),
                IconButton(
                    onPressed: signout, icon: const Icon(Icons.login_rounded))
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: 130,
                  width: 130,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image(
                      image: const NetworkImage(
                          "https://images.unsplash.com/photo-1633332755192-727a05c4013d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D"),
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;

                        return const Center(child: CircularProgressIndicator());
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.error);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      UserCard(
                        text: '${user!.email}',
                        title: 'Email:',
                      ),
                      UserCard(
                        text: "${user!.phoneNumber}",
                        title: 'Number:',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
