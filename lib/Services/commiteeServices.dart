import 'dart:convert';
import 'package:get/get.dart';
import 'package:procurementapp/Controller/CommiteeController.dart';
import 'package:procurementapp/global.dart' as global;
import 'package:http/http.dart' as http;
import 'package:procurementapp/rootScreens/common.dart';

// class commitee_Services extends GetConnect {
//   final controller = Get.find<CommiteeController>();
//   Future<dynamic> commitee_Api() async {
//     final response = await get('${global.common}committee');
//     if (response.status.hasError) {
//       return Future.error(response.statusText!);
//     } else {
//       controller.setCommiteeList(response.body);
//     }
//   }
// }

class CommitteeServices {
  static Future<String> commiteeApi() async {
    var response = await http.get(Uri.parse('${global.common}committee'));
    if (response.statusCode == 200) {
      var data = response.body;
      return data;
    } else {
      throw Exception();
    }
  }

  static Future<String> setInvitationToMember(data) async {
    var response = await http.post(
      Uri.parse('${global.common}committee'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({'data': data}),
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return Exception().toString();
    }
  }
}
