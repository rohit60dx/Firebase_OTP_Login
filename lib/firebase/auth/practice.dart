import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileImageState createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  late ImagePicker _imagePicker;
  late XFile _pickedImage;
  final TextEditingController _name = TextEditingController();
  final TextEditingController _number = TextEditingController();

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
    _pickedImage = XFile('');
  }

  Future<void> _getImage() async {
    final pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _pickedImage = pickedFile ?? XFile('');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _getImage,
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.deepPurple,
                ),
                child: ClipOval(
                  child: _pickedImage.path.isNotEmpty
                      ? Image.file(
                          File(_pickedImage.path),
                          fit: BoxFit.cover,
                          width: 100.0,
                          height: 100.0,
                        )
                      : const Icon(
                          Icons.add_a_photo,
                          size: 40.0,
                          color: Colors.white,
                        ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: TextField(
                controller: _name,
                decoration: const InputDecoration(
                    hintText: "Name", border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: TextField(
                controller: _number,
                decoration: const InputDecoration(
                    hintText: "Number", border: OutlineInputBorder()),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () {}, child: const Text("ADD"))
          ],
        ),
      ),
    );
  }
}
