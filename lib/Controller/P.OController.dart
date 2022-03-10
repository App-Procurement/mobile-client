import 'dart:convert';

import 'package:get/state_manager.dart';
import 'package:procurementapp/Services/P.OServices.dart';
import 'package:procurementapp/rootScreens/common.dart';

class POController extends GetxController {
  var PO_List = [].obs;
  var GeneratePOLIst = [].obs;
  var GeneratePODetailList = {}.obs;
  var PODetailList = {}.obs;

  setPOList(value) {
    PO_List.value = value;
    update();
  }

  setGeneratePOList(value) {
    GeneratePOLIst.value = value;
    update();
  }

  setGeneratePODetailList(value) {
    GeneratePODetailList.value = value;
    update();
  }

  setPODetailList(value) {
    PODetailList.value = value;
    update();
  }

  getPOList() async {
    try {
      var po_List = await POService.getPOData();
      var PO_List_Json = jsonDecode(po_List);
      if (PO_List_Json['code'] == 200) {
        setPOList(PO_List_Json['object']);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  getPOGenerateDetailList(id) async {
    try {
      var GeneratePODetailLIst = await POService.getGeneratePODetailData(id);
      var GeneratePODetailLIstListJson = jsonDecode(GeneratePODetailLIst);
      if (GeneratePODetailLIstListJson['code'] == 200) {
        setGeneratePODetailList(GeneratePODetailLIstListJson['object']);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  getPOGenerateList() async {
    try {
      var GeneratePOLIst = await POService.getGeneratePOData();
      var GeneratePOLIstListJson = jsonDecode(GeneratePOLIst);
      if (GeneratePOLIstListJson['code'] == 200) {
        setGeneratePOList(GeneratePOLIstListJson['object']);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  GetPOListDetail(id) async {
    try {
      var PODetailList = await POService.PODetail(id);
      var PODetailListJson = jsonDecode(PODetailList);
      if (PODetailListJson['code'] == 200) {
        setPODetailList(PODetailListJson['object']);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  setApprovePO(data, context) async {
    try {
      var approvePO = await POService.setApprovePO(data);
      var approvePOJson = jsonDecode(approvePO);
      if (approvePOJson["code"] == 200) {
        // committeelistJSON.value = [];
        Common().toastMessage(approvePOJson["message"], context);
      }
    } catch (e) {
      print(e);
    }
  }
  setGeneratePO(data, context) async {
    try {
      var generatePO = await POService.setGeneratePO(data);
      var generatePOJson = jsonDecode(generatePO);
      if (generatePOJson["code"] == 200) {
        // committeelistJSON.value = [];
        Common().toastMessage(generatePOJson["message"], context);
      }
    } catch (e) {
      print(e);
    }
  }
}
