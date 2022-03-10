// ignore_for_file: unrelated_type_equality_checks
import 'dart:convert';
import 'package:get/state_manager.dart';
import 'package:procurementapp/Services/commiteeServices.dart';
import 'package:procurementapp/rootScreens/common.dart';

class CommiteeController extends GetxController {
  var commiteeList = [].obs;
  var selectedMemberList = [].obs;

  setCommiteeList(value) {
    if (value.length > 0) {
      for (var i = 0; i < value.length; i++) {
        value[i]['isCheked'] = false;
      }
    }
    commiteeList.value = value;
    update();
  }

  setUpdateselectedMemberList(data) {
    selectedMemberList.value = data;
    update();
  }

  setInvitationToMember(list, context) async {
    try {
      var committeelist = await CommitteeServices.setInvitationToMember(list);
      var committeelistJSON = jsonDecode(committeelist);
      if (committeelistJSON["code"] == 200) {
        selectedMemberList.value = [];
        Common().toastMessage(committeelistJSON["message"], context);
      }
    } catch (e) {
      print(e);
    }
  }

  void commiteeApi() async {
    try {
      var committeelist = await CommitteeServices.commiteeApi();
      var committeelistJSON = jsonDecode(committeelist);
      if (committeelistJSON["code"] == 200) {
        setCommiteeList(committeelistJSON['object']);
      }
    } catch (e) {
      print(e);
    }
  }
}
