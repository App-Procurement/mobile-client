import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:procurementapp/Controller/P.OController.dart';
import 'package:procurementapp/rootScreens/PurchaseOrder/generatePODetail.dart';
import 'package:procurementapp/rootScreens/common.dart';
import 'package:intl/intl.dart';
import 'package:procurementapp/color.dart' as color;

class genratePO extends StatefulWidget {
  genratePO({Key? key}) : super(key: key);

  @override
  State<genratePO> createState() => _genratePOState();
}

String dropdownvalue = '-Select-';
var items = ['one', 'two', 'three', 'four', 'five'];

POController controller = new POController();

class _genratePOState extends State<genratePO> {
  @override
  void initState() {
    super.initState();
    controller.getPOGenerateList();
  }

  userCard(index) {
    return Center(
      child: Container(
        height: 175,
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: color.grey4, borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 20,
                        child: Image.network(
                          controller.GeneratePOLIst[index]['profilePic'],
                          height: 40,
                          width: 40,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.GeneratePOLIst[index]['createdBy'],
                              style: const TextStyle(
                                fontSize: 14,
                                height: 1.5,
                                fontWeight: FontWeight.w500,
                                color: color.black,
                              ),
                            ),
                            Text(
                              controller.GeneratePOLIst[index]['email'],
                              style: const TextStyle(
                                fontSize: 12,
                                height: 1.5,
                                fontWeight: FontWeight.normal,
                                color: color.black,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 10, right: 15, bottom: 10, left: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: color.perpal1,
                      ),
                      child: const Center(
                          child: Text(
                        'Generate',
                        style: TextStyle(
                            color: color.backgroundColor, fontSize: 10),
                      )),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => GeneratePODetail(
                              id: controller.GeneratePOLIst[index]['id'])));
                    },
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Requisition No',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          height: 1.5,
                          color: color.black,
                        ),
                      ),
                      Text(
                        controller.GeneratePOLIst[index]['id'].toString(),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                          color: color.black,
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Request Type',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          height: 1.5,
                          color: color.black,
                        ),
                      ),
                      Text(
                        controller.GeneratePOLIst[index]['requisitionType']
                            .toString(),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                          color: color.black,
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Department',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          height: 1.5,
                          color: color.black,
                        ),
                      ),
                      Text(
                        controller.GeneratePOLIst[index]['department']['name'],
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                          color: color.black,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text(
                      'Created On',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        height: 1.5,
                        color: color.black,
                      ),
                    ),
                    Text(
                      DateFormat('dd-MM-yyyy').format(DateTime.parse(
                          controller.GeneratePOLIst[index]['createdOn'])),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        height: 1.5,
                        color: color.black,
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: color.red5,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Text('# ${controller.GeneratePOLIst[index]['status']}',
                      style: TextStyle(color: color.pink1)),
                )
              ],
            )
          ],
        ),
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
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Common().userProfile(context),
              Container(
                margin: const EdgeInsets.only(top: 15, bottom: 15),
                child: const Text(
                  'Generate Purchase Order',
                  style: TextStyle(
                    color: color.blue1,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                height: 55,
                margin: const EdgeInsets.only(bottom: 10),
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: const BoxDecoration(
                    color: color.grey6,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: DropdownButton(
                    icon: const Icon(
                      Icons.arrow_drop_down,
                    ),
                    hint: Text(
                      dropdownvalue,
                      style: const TextStyle(
                        color: color.perpal1,
                      ),
                    ),
                    iconSize: 30,
                    elevation: 1,
                    isExpanded: true,
                    iconEnabledColor: color.perpal1,
                    underline: const SizedBox(),
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    }),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: const Text(
                  'Date Range',
                  style: TextStyle(
                      color: color.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
              GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                          color: color.grey6,
                          borderRadius: BorderRadius.circular(8)),
                      height: 55,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Container(
                        padding: const EdgeInsets.only(left: 15),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          DateFormat('dd - MM - yyyy').format(DateTime.now()),
                          // DateTime.now().toString(),
                          style: const TextStyle(
                              color: color.blue5,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
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
              GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: color.grey6,
                          borderRadius: BorderRadius.circular(8)),
                      height: 55,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Container(
                        padding: const EdgeInsets.only(left: 20),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          DateFormat('dd - MM - yyyy').format(DateTime.now()),
                          style: const TextStyle(
                              color: color.blue5,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
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
              Center(
                child: GestureDetector(
                    child: Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: color.perpal1,
                  ),
                  height: 50,
                  width: 150,
                  child: const Center(
                      child: Text(
                    'Search',
                    style:
                        TextStyle(fontSize: 17, color: color.backgroundColor),
                  )),
                )),
              ),
              SingleChildScrollView(
                child: Container(
                    // color: color.perpal4,
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.28,
                    child: Obx(
                      () => ListView.builder(
                        itemCount: controller.GeneratePOLIst.length,
                        itemBuilder: (BuildContext context, int index) {
                          return userCard(index);
                        },
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
