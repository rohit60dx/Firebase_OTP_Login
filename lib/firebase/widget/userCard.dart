import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final String title;
  final String text;
  const UserCard({super.key, required this.text, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        child: ListTile(
          title: Text(title),
          trailing: Text(text),
        ),
      ),
    );
  }
}
