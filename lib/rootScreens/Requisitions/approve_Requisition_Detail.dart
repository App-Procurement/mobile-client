// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_is_empty, deprecated_member_use, unrelated_type_equality_checks
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:procurementapp/Controller/RequisitionsController.dart';
import 'package:procurementapp/color.dart' as color;
import 'package:procurementapp/rootScreens/RecievedRFP/received_RFP.dart';
import 'package:procurementapp/rootScreens/common.dart';

class ApproveRequisitionDetail extends StatefulWidget {
  final Indexdata;
  ApproveRequisitionDetail({Key? key, required this.Indexdata})
      : super(key: key);

  @override
  State<ApproveRequisitionDetail> createState() =>
      _ApproveRequisitionDetailState();
}

class _ApproveRequisitionDetailState extends State<ApproveRequisitionDetail> {
  RequisitionsController controller = RequisitionsController();
  bool buyerListShow = false;
  bool selectedBuyerShow = false;

  @override
  void initState() {
    super.initState();
    controller.getApproveRequisitionsDetail(widget.Indexdata, context);
    controller.invitationSend.listen((value) {
      if (controller.invitationSend == true) {
        Navigator.pop(context, true);
        controller.invitationSend.value == false;
      }
    });
  }

  TextEditingController searchtxt = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: color.backgroundColor,
        bottomNavigationBar: Common().bottomAppbar(context),
        body: Center(
            child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 40),
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Common().userProfile(context),
                buyerListShow == false && selectedBuyerShow == false
                    ? Text("Approve Requsition",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          color: color.blue1,
                          fontWeight: FontWeight.bold,
                        ))
                    : selectedBuyerShow == false && buyerListShow == true
                        ? Container(
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
                          )
                        : SizedBox(),
                Center(
                  child: buyerListShow == false && selectedBuyerShow == false
                      ? Obx(() => approveDetail())
                      : selectedBuyerShow == false && buyerListShow == true
                          ? Obx(() => displayBuyerList())
                          : Obx(() => displaySelectedBuyerList()),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }

  approveDetail() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    "Requisitioner",
                    style: TextStyle(
                        color: color.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Requistion No.",
                    style: TextStyle(
                        color: color.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Priority",
                    style: TextStyle(
                        color: color.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Order Currency",
                    style: TextStyle(
                        color: color.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Item",
                    style: TextStyle(
                        color: color.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Extra Budgetory",
                    style: TextStyle(
                        color: color.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Department",
                    style: TextStyle(
                        color: color.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Budget Committee Report",
                    style: TextStyle(
                        color: color.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Purpose",
                    style: TextStyle(
                        color: color.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Location",
                    style: TextStyle(
                        color: color.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    controller.approve_req_detail['createdBy'].toString(),
                    style: TextStyle(
                        color: color.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    controller.approve_req_detail['id'].toString(),
                    style: TextStyle(
                        color: color.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    controller.approve_req_detail['priorty'].toString(),
                    style: TextStyle(
                        color: color.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    controller.approve_req_detail['currency']['countryCode']
                        .toString(),
                    style: TextStyle(
                        color: color.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "",
                    style: TextStyle(
                        color: color.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    controller.approve_req_detail['extraBudgetory'].toString(),
                    style: TextStyle(
                        color: color.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    controller.approve_req_detail['department']['name']
                        .toString(),
                    style: TextStyle(
                        color: color.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Not Required',
                    style: TextStyle(
                        color: color.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    controller.approve_req_detail['purpose'].toString(),
                    style: TextStyle(
                        color: color.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    controller.approve_req_detail['location'].toString(),
                    style: TextStyle(
                        color: color.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            )
          ],
        ),
        RaisedButton(
          child: Text('Select Buyer'),
          onPressed: () {
            controller.getBuyerList();
            setState(() {
              buyerListShow = true;
            });
          },
        ),
      ],
    );
  }

  displayBuyerList() {
    return Column(
      children: [
        RaisedButton(
          child: Text('Add Buyer'),
          onPressed: () {
            var chekedLength = 0;
            if (controller.buyer_list.length > 0) {
              for (var i = 0; i < controller.buyer_list.length; i++) {
                if (controller.buyer_list[i]['isCheked'] == true) {
                  chekedLength++;
                }
              }
              if (chekedLength > 0) {
                setState(() {
                  selectedBuyerShow = true;
                  buyerListShow = false;
                });
              }
            }
          },
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width * 0.9,
          child: ListView.builder(
            key: UniqueKey(),
            itemCount: controller.buyer_list.length,
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
                                value: controller.buyer_list[index]['isCheked'],
                                onChanged: (bool? value) {
                                  controller.buyer_list[index]['isCheked'] =
                                      value;
                                  setState(() {
                                    controller.buyer_list;
                                  });
                                })),
                        Expanded(
                          child: CircleAvatar(
                            backgroundColor: color.grey4,
                            backgroundImage: NetworkImage(
                                "${controller.buyer_list[index]['profile']}"),
                            radius: 30,
                          ),
                        )
                      ],
                    ),
                    Text(controller.buyer_list[index]['name'].toString()),
                    Text(controller.buyer_list[index]['company'].toString(),
                        style: TextStyle(color: color.grey3, fontSize: 12)),
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
                        Text(controller.buyer_list[index]['contNo'].toString())
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
                        Text(controller.buyer_list[index]['email'].toString())
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  displaySelectedBuyerList() {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width * 0.9,
          child: ListView.builder(
            key: UniqueKey(),
            itemCount: controller.buyer_list.length,
            itemBuilder: (BuildContext context, int index) {
              if (controller.buyer_list[index]['isCheked'] == true) {
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
                                value: controller.buyer_list[index]['isCheked'],
                                onChanged: (bool? value) {
                                  controller.buyer_list[index]['isCheked'] =
                                      value;
                                  setState(() {
                                    controller.buyer_list;
                                  });
                                }),
                          ),
                          Expanded(
                            child: CircleAvatar(
                              backgroundColor: color.grey4,
                              backgroundImage: NetworkImage(
                                  "${controller.buyer_list[index]['profile']}"),
                              radius: 30,
                            ),
                          )
                        ],
                      ),
                      Text(controller.buyer_list[index]['name'].toString()),
                      Text(controller.buyer_list[index]['company'].toString(),
                          style: TextStyle(color: color.grey3, fontSize: 12)),
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
                          Text(
                              controller.buyer_list[index]['contNo'].toString())
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
                          // Text(controller.buyerList[index]['email'].toString())
                        ],
                      ),
                    ],
                  ),
                );
              } else {
                return SizedBox();
              }
            },
          ),
        ),
        RaisedButton(
          child: Text('Send'),
          onPressed: () {
            sendApproveRequestToBuyer();
          },
        ),
      ],
    );
  }

  sendApproveRequestToBuyer() {
    var count = [];
    if (controller.buyer_list.length > 0) {
      for (var i = 0; i < controller.buyer_list.length; i++) {
        if (controller.buyer_list[i]['isCheked'] == true) {
          count.add(controller.buyer_list[i]['id']);
        }
      }
      if (count.length > 0) {
        var sendData = {'id': widget.Indexdata, 'list': count};
        controller.sendApproveRequestToBuyer(sendData, context);
      }
    }
  }

  boldTextStle() {
    return const TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: color.black);
  }
}
