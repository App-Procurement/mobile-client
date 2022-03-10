import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:procurementapp/global.dart' as global;

class POService {
  static Future<String> getPOData() async {
    var response = await http.get(Uri.parse('${global.common}purchaseorders'));
    if (response.statusCode == 200) {
      var data = response.body;
      return data;
    } else {
      throw Exception();
    }
  }

  static Future<String> getGeneratePOData() async {
    var response = await http.get(Uri.parse('${global.common}purchaseorders'));
    if (response.statusCode == 200) {
      var data = response.body;
      return data;
    } else {
      throw Exception();
    }
  }

  static Future<String> getGeneratePODetailData(id) async {
    var response =
        await http.get(Uri.parse('${global.common}purchaseorders/${id}'));
    if (response.statusCode == 200) {
      var data = response.body;
      return data;
    } else {
      throw Exception();
    }
  }

  static Future<String> PODetail(id) async {
    var response =
        await http.get(Uri.parse('${global.common}purchaseorders/approve/$id'));
    if (response.statusCode == 200) {
      var data = response.body;
      return data;
    } else {
      throw Exception();
    }
  }

  static Future<String> setApprovePO(data) async {
    var response = await http.post(
      Uri.parse('${global.common}purchaseorders/approve/${data['id']}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return Exception().toString();
    }
  }

  static Future<String> setGeneratePO(data) async {
    var response = await http.post(
      Uri.parse('${global.common}purchaseorders'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return Exception().toString();
    }
  }
}
