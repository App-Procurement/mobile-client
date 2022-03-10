// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:procurementapp/Controller/CommiteeController.dart';
import 'package:procurementapp/color.dart' as color;
import 'package:procurementapp/global.dart' as global;
import 'package:procurementapp/rootScreens/SetupCommittee/setupCommittee.dart';
import 'package:procurementapp/rootScreens/common.dart';

class SelectCommiteeMember extends StatefulWidget {
  const SelectCommiteeMember({Key? key}) : super(key: key);

  @override
  State<SelectCommiteeMember> createState() => _SelectCommiteeMemberState();
}

class _SelectCommiteeMemberState extends State<SelectCommiteeMember> {
  TextEditingController searchtxt = new TextEditingController();

  final CommiteeController controller = Get.find<CommiteeController>();
  List list = [];
  int length = 0;
  int ind = 0;
  @override
  void initState() {
    super.initState();
    controller.commiteeApi();
    length = controller.selectedMemberList.length;
  }

  setSelectedData() {
    controller.setUpdateselectedMemberList(controller.commiteeList);
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
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      color: color.grey4,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: searchtxt,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        fillColor: color.perpal1,
                        focusColor: color.perpal1,
                        hintText: 'Search Members',
                        prefixIcon: Icon(
                          Icons.search_rounded,
                          color: color.perpal1,
                        )),
                  ),
                ),
                GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    height: 30,
                    width: 150,
                    decoration: const BoxDecoration(color: color.perpal1),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Icon(Icons.person_add),
                          Text('Add Members'),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    setSelectedData();
                    Navigator.pop(context, true);
                  },
                ),
                Center(
                  child: Obx(
                    () => Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: ListView.builder(
                        key: UniqueKey(),
                        itemCount: controller.commiteeList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(top: 10, bottom: 10),
                            decoration: BoxDecoration(
                                color: color.grey4,
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Checkbox(
                                            checkColor: color.backgroundColor,
                                            value:
                                                controller.commiteeList[index]
                                                    ['isCheked'],
                                            onChanged: (value) {
                                              controller.commiteeList[index]
                                                  ['isCheked'] = value;
                                              setState(() {
                                                controller.commiteeList;
                                              });
                                            })),
                                    Expanded(
                                      child: CircleAvatar(
                                        backgroundColor: color.grey4,
                                        backgroundImage: NetworkImage(
                                            "${controller.commiteeList[index]['profile']}"),
                                        radius: 30,
                                      ),
                                    )
                                  ],
                                ),
                                Text(controller.commiteeList[index]['name']
                                    .toString()),
                                Text(
                                    controller.commiteeList[index]['company']
                                        .toString(),
                                    style: TextStyle(
                                        color: color.grey3, fontSize: 12)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                          color: color.pink3,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Icon(
                                        Icons.call,
                                        size: 20,
                                        color: color.pink2,
                                      ),
                                    ),
                                    Text(controller.commiteeList[index]
                                            ['contNo']
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
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Icon(
                                        Icons.mail,
                                        size: 20,
                                        color: color.pink2,
                                      ),
                                    ),
                                    Text(controller.commiteeList[index]['email']
                                        .toString())
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
