import 'package:http/http.dart' as http;
import 'package:procurementapp/global.dart' as global;

class rfqService {

  static Future<String> getRFQservice() async {
    var response = await http.get(Uri.parse('${global.common}rfq'));
    if (response.statusCode == 200) {
      var data = response.body;
      return data;
    } else {
      throw Exception();
    }
  }
  static Future<String> getRFQdetailService(id) async {
    var response = await http.get(Uri.parse('${global.common}rfq/${id}'));
    if (response.statusCode == 200) {
      var data = response.body;
      return data;
    } else {
      throw Exception();
    }
  }
}
