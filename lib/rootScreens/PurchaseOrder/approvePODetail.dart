import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:procurementapp/Controller/P.OController.dart';
import 'package:procurementapp/global.dart' as global;
import 'package:procurementapp/color.dart' as color;
import 'package:procurementapp/rootScreens/PurchaseOrder/approvePO.dart';
import 'package:procurementapp/rootScreens/common.dart';
import 'package:intl/intl.dart';

class ApprovePODetail extends StatefulWidget {
  final id;
  ApprovePODetail({Key? key, required this.id}) : super(key: key);

  @override
  State<ApprovePODetail> createState() => _ApprovePODetailState();
}

POController POcontroller = new POController();
TextEditingController commitTXT = new TextEditingController();

class _ApprovePODetailState extends State<ApprovePODetail>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this, initialIndex: 0);
    POcontroller.GetPOListDetail(widget.id);
  }

  late TabController _controller;

  checkTextfield(status) {
    var sendData = {'id': widget.id, 'status': status};
    POcontroller.setApprovePO(sendData, context);
  }

  @override
  Widget build(BuildContext context) {
    print(POcontroller.PODetailList.length.toString());
    return SafeArea(
      child: Scaffold(
        backgroundColor: color.backgroundColor,
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Common().userProfile(context),
              Container(
                margin: const EdgeInsets.only(top: 30, bottom: 30),
                child: const Text(
                  'Approve Purchase Order',
                  style: TextStyle(
                    color: color.blue1,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: TabBar(
                    labelColor: color.perpal1,
                    indicatorColor: color.perpal1,
                    unselectedLabelColor: color.grey3,
                    controller: _controller,
                    tabs: const [
                      Tab(
                        text: 'Overview',
                      ),
                      Tab(
                        text: 'Vendor',
                      ),
                    ]),
              ),
              Expanded(
                  child: Obx(
                () => Container(
                  child: TabBarView(
                      controller: _controller,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        overviewTab(),
                        vendorTab(),
                      ]),
                ),
              ))
            ]),
          ),
        ),
      ),
    );
  }

  overviewTabData(key, value) {
    return Container(
      height: 50,
      padding: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          color: color.grey4, borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        children: [
          Expanded(child: Text(key)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  tabbarButton() {
    return Column(
      children: [
        Center(
          child: GestureDetector(
            child: Container(
              height: 60,
              width: 200,
              margin: EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: color.perpal1),
              child: const Center(
                child: Text(
                  'APPROVE',
                  style: TextStyle(
                      color: color.backgroundColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            onTap: () {
              checkTextfield('APPROVE');
            },
          ),
        ),
        Center(
          child: GestureDetector(
            child: Container(
              height: 60,
              width: 200,
              margin: EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14), color: color.pink3),
              child: const Center(
                child: Text(
                  'Decline',
                  style: TextStyle(
                      color: color.perpal1,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            onTap: () {
              checkTextfield('Decline');
            },
          ),
        ),
      ],
    );
  }

  overviewTab() {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Container(
          //     height: 220,
          //     color: color.blue6,
          //     child: Obx(
          //       () => ListView.builder(
          //         itemCount: POcontroller.PODetailList.length,
          //         itemBuilder: (BuildContext context, int index) {
          //           return Container(
          //               height: 50,
          //               color: color.perpal6,
          //               child:
          //                   Text(POcontroller.PODetailList[index]['status']));
          //         },
          //       ),
          //     )),

          overviewTabData("Status", POcontroller.PODetailList['Status']),
          overviewTabData(
              "Delivery Status", POcontroller.PODetailList['DeliveryStatus']),
          overviewTabData(
              "Payment Status", POcontroller.PODetailList['PaymentStatus']),
          overviewTabData(
              "PO Number", POcontroller.PODetailList['id'].toString()),
          overviewTabData(
              "Department", POcontroller.PODetailList['Department']),
          overviewTabData(
              "Requister", POcontroller.PODetailList['RequestorName']),
          overviewTabData("Item", POcontroller.PODetailList['Item']),
          overviewTabData(
              "Date Created",
              DateFormat('dd-MM-yyyy-  HH:mm:ss:a').format(DateTime.parse(
                  POcontroller.PODetailList['CreationOn'].toString()))),
          Text('Comments'),
          DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(20),
              padding: EdgeInsets.all(3.0),
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: EdgeInsets.all(10.0),
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: color.grey4),
                  child: TextField(
                    controller: commitTXT,
                    decoration: InputDecoration(
                      hintText: "${POcontroller.PODetailList['Comment']}",
                      border: InputBorder.none,
                      // labelText: "${POcontroller.PODetailList['Comment']}",
                      hintMaxLines: 5,
                    ),
                  )
                  //  Text(POcontroller.PODetailList['Comment']) ,
                  )),
          tabbarButton(),
        ],
      ),
    );
  }

  vendorTab() {
    return Column(
      children: [
        overviewTabData("Vendor", POcontroller.PODetailList['VendorName']),
        overviewTabData(
            "Vendor Email", POcontroller.PODetailList['VendorEmail']),
        overviewTabData("Nature Of Business",
            POcontroller.PODetailList['NatureOfBusiness']),
        overviewTabData(
            "PO Generated By", POcontroller.PODetailList['RequestorName']),
        overviewTabData(
            "Limit \$10K", POcontroller.PODetailList['Limit'].toString()),
        Container(
          height: 50,
          padding: EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
              color: color.grey4, borderRadius: BorderRadius.circular(10.0)),
          child: Row(
            children: [
              Expanded(child: Text('Quotation')),
              Expanded(
                child: Container(
                  width: 150,
                  decoration:
                      BoxDecoration(border: Border.all(color: color.perpal1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.download,
                        color: color.perpal1,
                      ),
                      Text(
                        'Download File',
                        style: TextStyle(color: color.perpal1),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        tabbarButton(),
      ],
    );
  }
}
