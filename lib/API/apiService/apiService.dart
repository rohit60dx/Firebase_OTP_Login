import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:practice/API/model/model.dart';

class allServices {
  var url = 'https://jsonplaceholder.typicode.com/albums';
  Future<List<model>?> getData() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        var list = data.map((item) => model.fromJson(item)).toList();
        return list;
      }
    } catch (e) {
      throw Exception('error$e');
    }
    return null;
  }
}
