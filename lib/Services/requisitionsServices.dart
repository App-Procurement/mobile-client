import 'dart:convert';

import 'package:procurementapp/global.dart' as global;
import 'package:http/http.dart' as http;

class requisitionsServices {
  static Future<String> Approve_Requisition() async {
    var response = await http.get(Uri.parse(('${global.common}requisitions')));
    if (response.statusCode == 200) {
      var data = response.body;
      return data;
    } else {
      throw Exception();
    }
  }

  static Future<String> ApproveRequisitionDetail(id) async {
    var response =
        await http.get(Uri.parse(('${global.common}requisitions/${id}')));
    if (response.statusCode == 200) {
      var data = response.body;
      return data;
    } else {
      throw Exception();
    }
  }

  static Future<String> getBuyerList() async {
    var response = await http.get(Uri.parse(('${global.common}buyers')));
    if (response.statusCode == 200) {
      var data = response.body;
      return data;
    } else {
      throw Exception();
    }
  }

  static Future<dynamic> sendApproveRequestToBuyer(data) async {
    print(data);
    var response = await http.post(
      Uri.parse('${global.common}buyers/${data['id']}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'data': data['list']}),
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return Exception().toString();
    }
  }

  static Future<dynamic> getRequisitionsList() async {
    var response = await http.get(Uri.parse(('${global.common}requisitions')));
    if (response.statusCode == 200) {
      var data = response.body;
      return data;
    } else {
      throw Exception();
    }
  }

  static Future<dynamic> getRequisition(id) async {
    var response =
        await http.get(Uri.parse(('${global.common}requisitions/${id}')));
    if (response.statusCode == 200) {
      var data = response.body;
      return data;
    } else {
      throw Exception();
    }
  }
}
