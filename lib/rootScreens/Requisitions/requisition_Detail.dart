// ignore_for_file: camel_case_types, prefer_const_constructors_in_immutables, unused_import, must_call_super, non_constant_identifier_names, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_function_type_syntax_for_parameters

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:procurementapp/Controller/RequisitionsController.dart';
import 'package:procurementapp/color.dart' as color;
import 'package:procurementapp/rootScreens/Requisitions/track_Requisition.dart';
import 'package:procurementapp/rootScreens/common.dart';
import 'package:procurementapp/rootScreens/profile.dart';
import 'package:procurementapp/tabBar.dart';

class RequisitionDetail extends StatefulWidget {
  final id;
  RequisitionDetail({Key? key, required this.id}) : super(key: key);

  @override
  State<RequisitionDetail> createState() => _RequisitionDetailState();
}

dynamic items = {
  'Requisitioner': 'James',
  'Requistion No.': '',
  'Priority': '',
  'Order Currency': '',
  'Item': '',
  'Extra Budgetory': '',
  'Department': '',
  'Item Name': '',
};

class _RequisitionDetailState extends State<RequisitionDetail> {
  RequisitionsController controller = RequisitionsController();
  @override
  void initState() {
    super.initState();
    controller.getRequisition(widget.id);
    controller.requisition_detail.listen((value) {
      print(value);
    });
  }

  displayRequisitionDetail(key, value) {
    return Container(
      height: 50,
      padding: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          color: color.grey4, borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        children: [
          Expanded(
              child: Text(
            key,
            style: TextStyle(
                color: color.black, fontSize: 14, fontWeight: FontWeight.w500),
          )),
          Expanded(
              child: Text(
            value,
            style: TextStyle(
                color: color.black, fontSize: 14, fontWeight: FontWeight.w500),
          )),
        ],
      ),
    );
  }

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
                  Text("Manage Requisition",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        color: color.blue1,
                        fontWeight: FontWeight.bold,
                      )),
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                        child: Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                              color: color.perpal1,
                              borderRadius: BorderRadius.circular(7)),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: Icon(
                                  Icons.local_shipping_rounded,
                                  color: color.backgroundColor,
                                )),
                                Expanded(
                                    child: Text(
                                  'Track',
                                  style: TextStyle(
                                      color: color.backgroundColor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ))
                              ],
                            ),
                          ),
                        ),
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    TrackRequisition()))),
                  ),
                  Center(
                      child: Obx(
                    () => Column(
                      children: <Widget>[
                        displayRequisitionDetail(
                            "Requisitioner",
                            controller.requisition_detail['createdBy']
                                .toString()),
                        displayRequisitionDetail("Requistion No.",
                            controller.requisition_detail['id'].toString()),
                        displayRequisitionDetail("Priority",
                            controller.requisition_detail['priorty']),
                        displayRequisitionDetail(
                            "Order Currency",
                            controller.requisition_detail['currency']
                                ['countryCode'].toString()),
                        displayRequisitionDetail("Item", 'nkj'),
                        displayRequisitionDetail("Extra Budgetory",
                            controller.requisition_detail['extraBudgetory']),
                        displayRequisitionDetail(
                            "Department",
                            controller.requisition_detail['department']
                                ['name']),
                        displayRequisitionDetail("Item Name", 'abc'),
                        displayRequisitionDetail("Purpose",
                            controller.requisition_detail['purpose']),
                        displayRequisitionDetail(
                            "CAAC Committee Report", controller.requisition_detail['oversightCommitteeReport']),
                        displayRequisitionDetail("Location",
                            controller.requisition_detail['location']),
                        displayRequisitionDetail("Requisition Type",
                            controller.requisition_detail['requisitionType']),
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  boldTextStle() {
    return const TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: color.black);
  }
}
