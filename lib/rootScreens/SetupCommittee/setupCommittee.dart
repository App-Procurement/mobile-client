// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, prefer_is_empty

import 'package:flutter/material.dart';
import 'package:charts_common/common.dart';
import 'package:get/get.dart';
import 'package:procurementapp/Controller/CommiteeController.dart';
import 'package:procurementapp/Services/commiteeServices.dart';
import 'package:procurementapp/color.dart' as color;
import 'package:procurementapp/global.dart' as global;
import 'package:procurementapp/rootScreens/SetupCommittee/selectCommitteeMember.dart';
import 'package:procurementapp/rootScreens/common.dart';

class SetupCommittee extends StatefulWidget {
  SetupCommittee({Key? key}) : super(key: key);

  @override
  State<SetupCommittee> createState() {
    print('call create');
    return _SetupCommitteeState();
  }
}

class _SetupCommitteeState extends State<SetupCommittee> {
  @override
  void initState() {
    print('call init');
    super.initState();
  }

  final CommiteeController controller = Get.find<CommiteeController>();
  String selectedCommitee = "-Select-";

  sendInvitation() {
    var invitationList = [];
    if (controller.selectedMemberList.length > 0) {
      for (var i = 0; i < controller.selectedMemberList.length; i++) {
        if (controller.selectedMemberList[i]["isCheked"] == true) {
          invitationList.add(controller.selectedMemberList[i]['id']);
        }
      }
      var sendData = {"selectedMember": invitationList, "userid": 5};
      controller.setInvitationToMember(sendData, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: color.backgroundColor,
        bottomNavigationBar: Common().bottomAppbar(context),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Common().userProfile(context),
                Text('Setup Committee'),
                // Text('Select Committee Type'),
                // Container(
                //   height: 50,
                //   width: MediaQuery.of(context).size.width * 0.9,
                //   child: Center(
                //     child: DropdownButton(
                //       // value: selectedCommitee,
                //       isDense: true,
                //       icon: Icon(Icons.arrow_downward_outlined),
                //       items: commiteeType.map((String value) {
                //         return DropdownMenuItem(
                //           value: value,
                //           child: Text(value),
                //         );
                //       }).toList(),
                //       onChanged: (String? value) {},
                //     ),
                //   ),
                // ),
                GestureDetector(
                  child: Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    height: 30,
                    width: 150,
                    decoration: BoxDecoration(color: color.perpal1),
                    child: Center(
                      child: Row(
                        children: [
                          Icon(Icons.person),
                          Text('Select Members'),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            SelectCommiteeMember()));
                  },
                ),
                Center(
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.68,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Obx(() => commiteeListView())),
                ),
                RaisedButton(
                  child: Text('Send Invites'),
                  onPressed: () {
                    sendInvitation();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  commiteeListView() {
    return ListView.builder(
      // shrinkWrap: true,
      itemCount: controller.selectedMemberList.length,
      itemBuilder: (BuildContext context, int index) {
        if (controller.selectedMemberList[index]["isCheked"] == true) {
          return SingleChildScrollView(
            child: Container(
              // color: color.blue3,
              // padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(
                  color: color.grey4, borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            child: Checkbox(
                                value: controller.selectedMemberList[index]
                                    ["isCheked"],
                                onChanged: (bool? value) {}),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            color: color.blue2,
                            child: CircleAvatar(
                              backgroundColor: color.grey4,
                              backgroundImage: NetworkImage(
                                  "${controller.selectedMemberList[index]['profile']}"),
                              radius: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(controller.selectedMemberList[index]['name'].toString()),
                  Text(
                    '${controller.selectedMemberList[index]['company'].toString()}',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            color: color.pink3,
                            borderRadius: BorderRadius.circular(5)),
                        child: Icon(
                          Icons.call,
                          size: 20,
                          color: color.pink2,
                        ),
                      ),
                      Text(controller.selectedMemberList[index]['contNo']
                          .toString())
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            color: color.pink3,
                            borderRadius: BorderRadius.circular(5)),
                        child: Icon(
                          Icons.mail,
                          size: 20,
                          color: color.pink2,
                        ),
                      ),
                      Text(controller.selectedMemberList[index]['email']
                          .toString())
                    ],
                  ),
                ],
              ),
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
