// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:procurementapp/Services/requisitionsServices.dart';
import 'package:procurementapp/rootScreens/common.dart';

class RequisitionsController extends GetxController {
  var requisitions = [].obs;
  var approve_req_detail = {}.obs;
  var buyer_list = [].obs;
  var invitationSend = false.obs;
  var requisitions_list = [].obs;
  var requisition_detail = {}.obs;

  setRequisitionsList(value) {
    requisitions.value = value;
    update();
  }

  setApproveDetail(value) {
    approve_req_detail.value = value;
    update();
  }

  setBuyerList(data) {
    if (data.length > 0) {
      for (var i = 0; i < data.length; i++) {
        data[i]['isCheked'] = false;
      }
    }
    buyer_list.value = data;
    update();
  }

  setRequisitionList(data) {
    requisitions_list.value = data;
  }

  setRequisitionDetail(data) {
    requisition_detail.value = data;
  }

  void getApproveRequisitions() async {
    try {
      var requisitions = await requisitionsServices.Approve_Requisition();
      var approve_req_Json = jsonDecode(requisitions);
      if (approve_req_Json['code'] == 200) {
        setRequisitionsList(approve_req_Json['object']);
      }
    } catch (e) {
      print(e);
    }
  }

  void getApproveRequisitionsDetail(id, context) async {
    try {
      var requisitions =
          await requisitionsServices.ApproveRequisitionDetail(id);
      var approve_detail = jsonDecode(requisitions);
      if (approve_detail['code'] == 200) {
        setApproveDetail(approve_detail['object']);
      }
    } catch (e) {
      print(e);
    }
  }

  void getBuyerList() async {
    try {
      var requisitions = await requisitionsServices.getBuyerList();
      var buyer_list = jsonDecode(requisitions);
      if (buyer_list['code'] == 200) {
        setBuyerList(buyer_list['object']);
      }
    } catch (e) {
      print(e);
    }
  }

  void sendApproveRequestToBuyer(data, context) async {
    try {
      var sendBuyerRequest =
          await requisitionsServices.sendApproveRequestToBuyer(data);
      var invitation_res = jsonDecode(sendBuyerRequest);
      if (invitation_res['code'] == 200) {
        invitationSend.value = true;
        Common().toastMessage(invitation_res["message"], context);
        update();
      }
    } catch (e) {
      print(e);
    }
  }

  void getRequisitionsList() async {
    try {
      var requisitions = await requisitionsServices.getRequisitionsList();
      var requisitions_list = jsonDecode(requisitions);
      if (requisitions_list['code'] == 200) {
        setRequisitionList(requisitions_list['object']);
      }
    } catch (e) {
      print(e);
    }
  }

  void getRequisition(id) async {
    try {
      var requisition = await requisitionsServices.getRequisition(id);
      var requisitions = jsonDecode(requisition);
      if (requisitions['code'] == 200) {
        setRequisitionDetail(requisitions['object']);
      }
    } catch (e) {
      print(e);
    }
  }
}
