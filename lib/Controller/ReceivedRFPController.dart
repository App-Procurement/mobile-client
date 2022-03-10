import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';
import 'package:procurementapp/Services/receivde_RFP_Services.dart';

class ReceivedRFPController extends GetxController {
  var Received_RFP = [].obs;
  var Received_RFP_Detail = {}.obs;

    set_RFP_List(value) {
      Received_RFP.value = value;
      update();
    }
    set_RFP_Detail_List(value) {
      Received_RFP_Detail.value = value;
      update();
    }

  void GetReceivedRFP() async {
    try {
      var Received_RFP = await received_RFP_Services.received_RFP();
      var Received_RFP_Json = jsonDecode(Received_RFP);
      if (Received_RFP_Json['code'] == 200) {
        set_RFP_List(Received_RFP_Json['object']);
      }
    } catch (e) {
      print(e);
    }
  }
   void GetReceivedRFP_Detail(id) async {
    try {
      var Received_RFP_Detail = await received_RFP_Services.received_RFP_Detail(id);
      var Received_RFP_Detail_Json = jsonDecode(Received_RFP_Detail);
      if (Received_RFP_Detail_Json['code'] == 200) {
        set_RFP_Detail_List(Received_RFP_Detail_Json['object']);
      }
    } catch (e) {
      print(e);
    }
  }
}
