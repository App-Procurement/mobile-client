import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:procurementapp/Controller/ReceivedRFPController.dart';
import 'package:procurementapp/color.dart' as color;
import 'package:procurementapp/rootScreens/RecievedRFP/recieved_RFP_Detail.dart';
import 'package:procurementapp/rootScreens/Requisitions/approve_Requisition_Detail.dart';
import 'package:procurementapp/rootScreens/common.dart';
import 'package:procurementapp/Services/receivde_RFP_Services.dart';
import 'package:intl/intl.dart';

class ReceivedRFP extends StatefulWidget {
  ReceivedRFP({Key? key}) : super(key: key);

  @override
  State<ReceivedRFP> createState() => _ReceivedRFPState();
}

final ReceivedRFPController Controller = Get.find<ReceivedRFPController>();

class _ReceivedRFPState extends State<ReceivedRFP> {
  // List<dynamic> RFP_List = [];
  String dropdownvalue = 'Filter by Status';
  @override
  void initState() {
    super.initState();
    Controller.GetReceivedRFP();
    // calender();
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
              //margin: EdgeInsets.only(left: 20, right: 20),
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
                      'Recieved RFP',
                      style: TextStyle(
                        color: color.blue1,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      // Container(
                      //   padding: EdgeInsets.only(left: 30, right: 20),
                      //   decoration: BoxDecoration(
                      //       color: color.grey6,
                      //       borderRadius: BorderRadius.circular(8)),
                      //   height: 50,
                      //   width: MediaQuery.of(context).size.width * 0.7,
                      //   child: const TextField(
                      //     maxLines: 1,
                      //     decoration: InputDecoration(
                      //       border: InputBorder.none,
                      //       hintText: 'Filter by Status',
                      //       // contentPadding: const EdgeInsets.only(left: 20),
                      //       // suffixIcon: IconButton(
                      //       //   icon: Icon(
                      //       //     Icons.arrow_drop_down_circle_outlined,
                      //       //     color: color.perpal1,
                      //       //   ),
                      //       //   onPressed: null,
                      //       // ),
                      //     ),
                      //   ),
                      // ),
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
                      )
                    ],
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
                              DateFormat('dd - MM - yyyy')
                                  .format(DateTime.now()),
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
                              DateFormat('dd - MM - yyyy')
                                  .format(DateTime.now()),
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
                  Container(
                    margin: EdgeInsets.only(top: 40, bottom: 40),
                    child: Center(
                      child: GestureDetector(
                          child: Container(
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
                  ),
                  Center(
                    child: SizedBox(
                      // color: color.grey5,
                      height: 500,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Obx(
                        () => ListView.builder(
                          itemCount: Controller.Received_RFP.length,
                          itemBuilder: (BuildContext context, int index) {
                            // print(Controller.Received_RFP);
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
                                                  Controller.Received_RFP[index]
                                                          ['profilePic']
                                                      .toString(),
                                                  height: 40,
                                                  width: 40,
                                                ),
                                              ),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    left: 10),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      Controller.Received_RFP[
                                                          index]['createdBy'],
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                        height: 1.5,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: color.black,
                                                      ),
                                                    ),
                                                    Text(
                                                      Controller.Received_RFP[
                                                          index]['email'],
                                                      style: const TextStyle(
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
                                                    BorderRadius.circular(5),
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
                                                          RecievedRFPDetail(id: Controller
                                                                  .Received_RFP[
                                                              index]['id'])));
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 15),
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
                                                  fontWeight: FontWeight.normal,
                                                  height: 1.5,
                                                  color: color.black,
                                                ),
                                              ),
                                              Text(
                                                Controller.Received_RFP[index]
                                                    ['createdBy'],
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
                                                  fontWeight: FontWeight.normal,
                                                  height: 1.5,
                                                  color: color.black,
                                                ),
                                              ),
                                              Text(
                                                Controller.Received_RFP[index]
                                                    ['requisitionType'],
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
                                                  fontWeight: FontWeight.normal,
                                                  height: 1.5,
                                                  color: color.black,
                                                ),
                                              ),
                                              Text(
                                                Controller.Received_RFP[index]
                                                    ['department']['name'],
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
                                              DateFormat('dd-MM-yyyy').format(
                                                  DateTime.parse(Controller
                                                          .Received_RFP[index]
                                                      ['createdOn'])),
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
                                                  BorderRadius.circular(20.0)),
                                          child: Text(
                                            '#${Controller.Received_RFP[index]['status']}',
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
                      ),
                    ),
                  )
                  // ListView.builder(
                  //   itemCount: 1,
                  //   itemBuilder: (BuildContext context, int index) {
                  //     return Container(
                  //       height: 200,width: MediaQuery.of(context).size.width*0.8,
                  //       color: color.blue1,
                  //       child: Column(
                  //         children: [
                  //           Text('sdfdghyjn'),
                  //           Row(
                  //             children: [
                  //               const CircleAvatar(
                  //                 radius: 20,
                  //               ),
                  //               Column(
                  //                 children: const [
                  //                   Text('James Harpeny'),
                  //                   Text('James Harpeny')
                  //                 ],
                  //               ),
                  //               const TextButton(
                  //                   onPressed: null,
                  //                   child: Text('View Details'))
                  //             ],
                  //           )
                  //         ],
                  //       ),
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
