import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  List<Map<String, dynamic>> vendorsData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http
        .get(Uri.parse("https://mybar.sg/uatnew/index.php/api/get_vendors"));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      if (data['status'] == true) {
        setState(() {
          vendorsData = List<Map<String, dynamic>>.from(data['data']);
        });
      } else {}
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 47, 71, 209),
        title: const Text(
          "DASHBOARD",
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "ID",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "Phone",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "Email",
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: vendorsData.length,
                  itemBuilder: (context, index) {
                    final vendor = vendorsData[index];
                    return Container(
                      margin: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: 50,
                              child:
                                  Text(vendor['ecom_ae_vendor_id'].toString())),
                          SizedBox(
                              width: 80,
                              child: Text(
                                  vendor['ecom_ae_vendor_contact'].toString())),
                          SizedBox(
                              width: 70,
                              child: Text(
                                  vendor['ecom_ae_vendor_email'].toString()))
                        ],
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
