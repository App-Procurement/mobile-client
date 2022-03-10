import 'package:http/http.dart' as http;
import 'package:procurementapp/global.dart' as global;

class received_RFP_Services {
  static Future<String> received_RFP() async {
    var response = await http.get(Uri.parse(('${global.common}rfp')));
    if (response.statusCode == 200) {
      var data = response.body;
      return data;
    } else {
      throw Exception();
    }
  }
  static Future<String> received_RFP_Detail(id) async {
    var response = await http.get(Uri.parse(('${global.common}rfp/${id}')));
    if (response.statusCode == 200) {
      var RPF_id_Detail = response.body;
      return RPF_id_Detail;
    } else {
      throw Exception();
    }
  }


}
