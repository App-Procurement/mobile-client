// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:procurementapp/Controller/rfqController.dart';
import 'package:procurementapp/color.dart' as color;
import 'package:procurementapp/rootScreens/common.dart';
import 'package:procurementapp/rootScreens/profile.dart';
import 'package:procurementapp/rootScreens/RecievedRFQ/recieved_RFQ_Detail.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class RecievedRFQ extends StatefulWidget {
  const RecievedRFQ({Key? key}) : super(key: key);

  @override
  State<RecievedRFQ> createState() => _RecievedRFQState();
}

 rfqController controller = new rfqController();

class _RecievedRFQState extends State<RecievedRFQ> {
  String dropdownvalue = 'Filter by Status';
  DateTime selectedDate = DateTime.now();
  @override
  void initState() {
    super.initState();
    controller.getRFQlist();
    calender();
    selectedDate;
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
          child: Container(
            // padding: const EdgeInsets.only(
            //   top: 20,
            // ),
            width: MediaQuery.of(context).size.width * 0.9,
            // color: color.blue1,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Container(
                    child: Common().userProfile(context),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  child: const Text(
                    'Recieved RFQ',
                    style: TextStyle(
                        color: color.blue1,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: [
                    Center(
                      child: Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        margin: const EdgeInsets.only(bottom: 10),
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
                                )),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Text(
                  'Date Range',
                  style: TextStyle(
                      // color: color.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                ListTile(
                  
                  iconColor: color.grey3,
                  textColor: color.blue5,
                  tileColor: color.grey4,
                  dense: true,
                  title: Text(DateFormat('dd - MM - yyyy')
                                .format(selectedDate), style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                  trailing: Icon(Icons.calendar_month, color: color.grey3, size: 40,),
                  onTap: () {datePicker();},
                ),SizedBox(height: 20,),
                 ListTile(
                  iconColor: color.grey3,
                  textColor: color.blue5,
                  tileColor: color.grey4,
                  dense: true,
                  title: Text(DateFormat('dd - MM - yyyy')
                                .format(selectedDate), style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                  trailing: Icon(Icons.calendar_month, color: color.grey3, size: 40,),
                  onTap: () {datePicker();},
                ),
               
                Center(
                  child: GestureDetector(
                      child: Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.0),
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
                  child: SingleChildScrollView(
                    child: Container(
                      // color: color.grey5,
                      height: 280,
                      // width: MediaQuery.of(context).size.width * 0.9,
                      child: Obx(()=>
                                ListView.builder(
                          itemCount: controller.rfqList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: EdgeInsets.only(top: 10),
                              decoration: const BoxDecoration(
                                color: color.grey4,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              padding: const EdgeInsets.only(
                                  top: 20, right: 15, bottom: 20, left: 15),
                              child: 
                              Column(
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
                                                controller.rfqList[index]['profilePic'].toString(),
                                                height: 30,
                                                width: 30,
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children:  [
                                                  Text(
                                                    controller.rfqList[index]['createdBy'],
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      height: 1.5,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: color.black,
                                                    ),
                                                  ),
                                                  Text(
                                                   controller.rfqList[index]['email'],
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
                                                  color: color.backgroundColor,
                                                  fontSize: 10),
                                            )),
                                          ),
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          recivedRFQdetail(id: controller.rfqList[index]['id'])),
                                            );
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
                                          children:  [
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
                                              controller.rfqList[index]['id'].toString(),
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
                                          children:  [
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
                                              controller.rfqList[index]['requisitionType'],
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
                                          children:  [
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
                                              controller.rfqList[index]['department']['name'],
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
                                        children:  [
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
                                            controller.rfqList[index]['createdOn'].toString(),
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
                                        padding:  EdgeInsets.only(
                                            top: 10,
                                            right: 15,
                                            bottom: 10,
                                            left: 15),
                                        decoration: BoxDecoration(
                                            color: color.red5,
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                        child:  Text(
                                          '#${controller.rfqList[index]['status']}',
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
                            
                            );
                          },
                        ),
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
    );
  }

  datePicker()async{
    DateTime? date = await showDatePicker(
        context: context,
       
        firstDate: DateTime(DateTime.now().year - 1),
        lastDate: DateTime(DateTime.now().year + 2)
         initialDate: selectedDate,);
         if(date != null){
           setState(() {
             selectedDate = date;
           });
         }
  }
}
