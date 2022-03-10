import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:procurementapp/Controller/P.OController.dart';
import 'package:procurementapp/color.dart' as color;
import 'package:procurementapp/rootScreens/common.dart';
import 'package:intl/intl.dart';

class GeneratePODetail extends StatefulWidget {
  final id;
  GeneratePODetail({Key? key, required this.id}) : super(key: key);

  @override
  State<GeneratePODetail> createState() => _GeneratePODetailState();
}

POController controller = new POController();

class _GeneratePODetailState extends State<GeneratePODetail>
    with TickerProviderStateMixin {
  late TabController _Tabcontroller;

  TextEditingController PaymentTermtxt = new TextEditingController();
  TextEditingController TermsAndConditiontxt = new TextEditingController();

  @override
  void initState() {
    _Tabcontroller = new TabController(length: 3, vsync: this);
    controller.getPOGenerateDetailList(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: color.backgroundColor,
        bottomNavigationBar: Common().bottomAppbar(context),
        body: Center(
          child: Container(
            // color: color.perpal1,
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Common().userProfile(context),
                const Text('Generate Purchase Order'),
                Center(
                  child: Container(
                    color: color.grey4,
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: TabBar(
                      labelColor: color.perpal1,
                      indicatorColor: color.perpal1,
                      unselectedLabelColor: color.grey3,
                      controller: _Tabcontroller,
                      tabs: const [
                        Tab(
                          text: "Details",
                        ),
                        Tab(text: "Viocom Tech Ltd"),
                        Tab(text: "PO Parameters"),
                      ],
                    ),
                  ),
                ),
                Container(
                  // margin: EdgeInsets.only(top: 20,bottom: 20),
                  height: MediaQuery.of(context).size.height * 0.5,
                  // width: MediaQuery.of(context).size.width * 0.9,
                  // color: color.perpal1,
                  child: Obx(
                    () => TabBarView(controller: _Tabcontroller, children: [
                      Tab1View(),
                      Tab2View(),
                      Tab3View(),
                    ]),
                  ),
                )
              ],
            ),
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

  countDays() {
    final today = DateTime.now();
    final date =
        DateTime.tryParse(controller.GeneratePODetailList['createdOn']);
    final days = today.difference(date!).inDays;
    return days.toString();
  }

  onGenerateTap() {
    if (TermsAndConditiontxt.text != null && TermsAndConditiontxt.text != "") {
      var data = {
        'conditionText': TermsAndConditiontxt.text,
        'id': widget.id,
      };
      controller.setGeneratePO(data, context);
    }
  }

  Tab1View() {
    return SingleChildScrollView(
      child: Column(
        children: [
          overviewTabData("Requisitioner",
              controller.GeneratePODetailList['createdBy'].toString()),
          overviewTabData("Requistion No.",
              controller.GeneratePODetailList['id'].toString()),
          overviewTabData("Priority",
              controller.GeneratePODetailList['priorty'].toString()),
          overviewTabData("Extra Budgetory",
              controller.GeneratePODetailList['extraBudgetory'].toString()),
          overviewTabData("Department",
              controller.GeneratePODetailList['department']['name'].toString()),
          overviewTabData("Requistion Total",
              controller.GeneratePODetailList['totalPrice'].toString()),
          overviewTabData(
              "Purpose", controller.GeneratePODetailList['purpose'].toString()),
          overviewTabData(
              "Oversight Committee Report",
              controller.GeneratePODetailList['oversightCommitteeReport']
                  .toString()),
          overviewTabData("Approved Vendor",
              controller.GeneratePODetailList['Approved Vendor'].toString()),
          overviewTabData("Requisition Type",
              controller.GeneratePODetailList['requisitionType'].toString()),
          overviewTabData(
              "Date Created", controller.GeneratePODetailList['createdOn']),
          overviewTabData("Time Span", "${countDays()}  Day ago"),
          overviewTabData(
              "Status", controller.GeneratePODetailList['status'].toString()),
        ],
      ),
    );
  }

  Tab2View() {
    return Column(
      children: [
        // overviewTabData("Initial Quotation", controller.GeneratePODetailList['']),
        // overviewTabData("Final Quotation", controller.GeneratePODetailList['']),
        // overviewTabData("Id", controller.GeneratePODetailList['']),
        // overviewTabData("Item Description", controller.GeneratePODetailList['']),
        // overviewTabData("Quantity", controller.GeneratePODetailList['']),
        // overviewTabData("Rate", controller.GeneratePODetailList['']),
        // overviewTabData("Amount", controller.GeneratePODetailList['']),
      ],
    );
  }

  Tab3View() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Start Date'),
          GestureDetector(
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10, right: 5),
                  decoration: BoxDecoration(
                      color: color.grey6,
                      borderRadius: BorderRadius.circular(8)),
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Center(
                      child: Text(
                    DateFormat('dd - MM - yyyy').format(DateTime.now()),
                    // DateTime.now().toString(),
                    style: const TextStyle(
                        color: color.perpal1,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  )),
                ),
                const Icon(
                  Icons.calendar_today_outlined,
                  size: 35,
                  color: color.grey3,
                )
              ],
            ),
            onTap: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.utc(2030, 3, 14),
                initialEntryMode: DatePickerEntryMode.calendar,
              );
            },
          ),
          const Text('Delivery Date'),
          GestureDetector(
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10, right: 5),
                  decoration: BoxDecoration(
                      color: color.grey6,
                      borderRadius: BorderRadius.circular(8)),
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Center(
                      child: Text(
                    DateFormat('dd - MM - yyyy').format(DateTime.now()),
                    // DateTime.now().toString(),
                    style: const TextStyle(
                        color: color.perpal1,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  )),
                ),
                const Icon(
                  Icons.calendar_today_outlined,
                  size: 35,
                  color: color.grey3,
                )
              ],
            ),
            onTap: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.utc(2030, 3, 14),
                initialEntryMode: DatePickerEntryMode.calendar,
              );
            },
          ),
          const Text('Payment Terms'),
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                color: color.grey4, borderRadius: BorderRadius.circular(10)),
            height: 110,
            child: Center(
              child: TextField(
                controller: PaymentTermtxt,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintMaxLines: 6,
                    hintText:
                        'Viocom Tech Ltdviocom Tech dviocom Tech Ltdviocom Tech Ltd Viocom Tech Ltdviocom Tech dviocom Tech Ltdviocom Tech Ltd'),
              ),
            ),
          ),
          const Text('Other Terms And Conditions'),
          DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(12),
              padding: EdgeInsets.all(5),
              child: Container(
                height: 150,
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: color.grey4,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: TextField(
                    controller: TermsAndConditiontxt,
                    decoration: const InputDecoration(
                      hintMaxLines: 10,
                      hintText:
                          'Viocom Tech Ltdviocom Tech dviocom Tech Ltdviocom Tech Ltd Viocom Tech Ltdviocom Tech dviocom Tech Ltdviocom Tech Ltd',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              )),
          Center(
            child: GestureDetector(
              child: Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                    color: color.perpal1,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                    child: Text(
                  'GENERATE',
                  style: TextStyle(
                      color: color.backgroundColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w400),
                )),
              ),
              onTap: () {
                onGenerateTap();
              },
            ),
          )
        ],
      ),
    );
  }
}
