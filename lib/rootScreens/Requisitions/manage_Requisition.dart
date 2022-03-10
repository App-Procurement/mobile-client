// ignore_for_file: camel_case_types, prefer_const_constructors_in_immutables, unused_import, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:procurementapp/color.dart' as color;
import 'package:procurementapp/rootScreens/Requisitions/requisition_Detail.dart';
import 'package:procurementapp/rootScreens/common.dart';
import 'package:procurementapp/rootScreens/profile.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import '../../Controller/RequisitionsController.dart';

class ManageRequisition extends StatefulWidget {
  ManageRequisition({Key? key}) : super(key: key);
  @override
  State<ManageRequisition> createState() => _ManageRequisitionState();
}

class _ManageRequisitionState extends State<ManageRequisition> {
  String dropdownvalue = 'Filter by Status';
  RequisitionsController controller = RequisitionsController();
  @override
  void initState() {
    super.initState();
    controller.getRequisitionsList();
    calender();
  }

  calender() {
    return Stack(children: [
      TableCalendar(
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: DateTime.now(),
      ),
    ]);
  }

  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: color.backgroundColor,
        bottomNavigationBar: Common().bottomAppbar(context),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              // color: color.blue1,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Common().userProfile(context),
                  Container(
                    margin: const EdgeInsets.only(top: 30, bottom: 30),
                    child: const Text(
                      'Manage Requisition',
                      style: TextStyle(
                        color: color.blue1,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(
                          left: 15,
                          right: 15,
                        ),
                        height: 55,
                        margin: const EdgeInsets.only(bottom: 30),
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: const BoxDecoration(
                            color: color.grey6,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: DropdownButton(
                            // value: dropdownvalue,
                            //dropdownColor: Colors.white,
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
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                            color: color.grey6,
                            borderRadius: BorderRadius.circular(8)),
                        height: 55,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: const TextField(
                            maxLines: 1,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Requisition No',
                              hintStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: color.grey8,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'Date Range',
                    style: TextStyle(
                      color: color.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    child: Row(
                      children: [
                        Container(
                          margin:
                              EdgeInsets.only(top: 15, bottom: 15, right: 5),
                          decoration: BoxDecoration(
                              color: color.grey6,
                              borderRadius: BorderRadius.circular(8)),
                          height: 55,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Container(
                            padding: const EdgeInsets.only(left: 15),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              DateFormat('dd - MM - yyyy')
                                  .format(DateTime.now()),
                              // DateTime.now().toString(),
                              style: const TextStyle(
                                color: color.blue5,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
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
                      children: [
                        Container(
                          margin:
                              EdgeInsets.only(top: 10, bottom: 10, right: 5),
                          decoration: BoxDecoration(
                              color: color.grey6,
                              borderRadius: BorderRadius.circular(8)),
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Container(
                            padding: const EdgeInsets.only(left: 15),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              DateFormat('dd - MM - yyyy')
                                  .format(DateTime.now()),
                              style: const TextStyle(
                                color: color.blue5,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
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
                      calender();
                    },
                  ),
                  Center(
                    child: GestureDetector(
                        child: Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 50),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: color.perpal1,
                      ),
                      height: 50,
                      width: 150,
                      child: const Center(
                          child: Text(
                        'Search',
                        style: TextStyle(
                            fontSize: 17, color: color.backgroundColor),
                      )),
                    )),
                  ),
                  Center(
                    child: Obx(() => Container(
                          // color: color.grey5,
                          height: 500,
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: ListView.builder(
                            itemCount: controller.requisitions_list.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: color.grey4,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  padding: const EdgeInsets.only(
                                      top: 20, right: 15, bottom: 20, left: 15),
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: 25),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                CircleAvatar(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  radius: 20,
                                                  child: Image.network(
                                                    controller
                                                            .requisitions_list[
                                                        index]['profilePic'],
                                                    height: 30,
                                                    width: 30,
                                                  ),
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 10),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        controller
                                                                .requisitions_list[
                                                            index]['createdBy'],
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          height: 1.5,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: color.black,
                                                        ),
                                                      ),
                                                      Text(
                                                        controller
                                                                .requisitions_list[
                                                            index]['email'],
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          height: 1.5,
                                                          fontWeight:
                                                              FontWeight.normal,
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
                                                    top: 10,
                                                    right: 15,
                                                    bottom: 10,
                                                    left: 15),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: color.perpal1,
                                                ),
                                                child: const Center(
                                                    child: Text(
                                                  'View Details',
                                                  style: TextStyle(
                                                      color:
                                                          color.backgroundColor,
                                                      fontSize: 10),
                                                )),
                                              ),
                                              onTap: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          RequisitionDetail(
                                                              id: controller
                                                                      .requisitions_list[
                                                                  index]['id'])),
                                                );
                                              },
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Requisition No',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    height: 1.5,
                                                    color: color.black,
                                                  ),
                                                ),
                                                Text(
                                                  controller
                                                      .requisitions_list[index]
                                                          ['id']
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.5,
                                                    color: color.black,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Request Type',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    height: 1.5,
                                                    color: color.black,
                                                  ),
                                                ),
                                                Text(
                                                  controller.requisitions_list[
                                                      index]['requisitionType'],
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.5,
                                                    color: color.black,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Department',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    height: 1.5,
                                                    color: color.black,
                                                  ),
                                                ),
                                                Text(
                                                  controller.requisitions_list[
                                                          index]['department']
                                                      ['name'],
                                                  style: TextStyle(
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                'Created On',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1.5,
                                                  color: color.black,
                                                ),
                                              ),
                                              Text(
                                                controller
                                                    .requisitions_list[index]
                                                        ['createdOn']
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1.5,
                                                  color: color.black,
                                                ),
                                              )
                                            ],
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(
                                                top: 10,
                                                right: 15,
                                                bottom: 10,
                                                left: 15),
                                            decoration: BoxDecoration(
                                                color: color.red5,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.0)),
                                            child: Text(
                                              controller
                                                      .requisitions_list[index]
                                                  ['status'],
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: color.pink1,
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
