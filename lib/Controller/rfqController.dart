import 'dart:convert';

import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:procurementapp/Services/rfqService.dart';

class rfqController extends GetxController {
  var rfqList = [].obs;
  var rfqDetail = {}.obs;

  setRFQlist(value) {
    rfqList.value = value;
    update();
  }
  setRFQdetail(value) {
    rfqDetail.value = value;
    update();
  }

  getRFQlist() async {
    try {
      var rfqList = await rfqService.getRFQservice();
      var rfqListJSON = jsonDecode(rfqList);
      if (rfqListJSON["code"] == 200) {
        setRFQlist(rfqListJSON['object']);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
  getRFQdetaillist(id) async {
    try {
      var rfqDetail = await rfqService.getRFQdetailService(id);
      var rfqDetailJSON = jsonDecode(rfqDetail);
      if (rfqDetailJSON["code"] == 200) {
        setRFQdetail(rfqDetailJSON['object']);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
