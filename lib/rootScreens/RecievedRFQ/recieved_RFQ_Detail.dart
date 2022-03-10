// ignore_for_file: camel_case_types, prefer_const_constructors_in_immutables, unused_import, must_call_super, non_constant_identifier_names, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:procurementapp/Controller/rfqController.dart';
import 'package:procurementapp/color.dart' as color;
import 'package:procurementapp/global.dart';
import 'package:procurementapp/rootScreens/common.dart';
import 'package:procurementapp/rootScreens/profile.dart';
import 'package:procurementapp/tabBar.dart';

class recivedRFQdetail extends StatefulWidget {
  final id;
  recivedRFQdetail({Key? key, required this.id}) : super(key: key);

  @override
  State<recivedRFQdetail> createState() => _recivedRFQdetailState();
}

class _recivedRFQdetailState extends State<recivedRFQdetail> {
  rfqController controller = rfqController();

  int activeStep = 1;
  int upperBound = 3;

  @override
  void initState() {
    super.initState();
    controller.getRFQdetaillist(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: Common().bottomAppbar(context),
      backgroundColor: color.backgroundColor,
      body: Center(
          child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Common().userProfile(context),
            // NumberStepper(
            //   lineColor: color.perpal1,
            //   numberStyle: TextStyle(color: color.perpal1),
            //   //  stepReachedAnimationEffect: Curves.bounceOut,
            //   activeStepBorderColor: color.perpal1,
            //   activeStepBorderWidth: 2,
            //   enableNextPreviousButtons: false,
            //   activeStepBorderPadding: 0,
            //   stepRadius: 15,
            //   stepColor: color.grey4,
            //   activeStepColor: color.perpal1,
            //   scrollingDisabled: false,
            //   numbers: [1, 2, 3],
            //   activeStep: activeStep,
            //   onStepReached: (index) {
            //     setState(() {
            //       activeStep = index;
            //     });
            //   },
            // ),
            
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(children: [
                Expanded(child: CircleAvatar(radius: 20, child: Text('data'),)), 
                Expanded(child: Divider(color: color.perpal1,)),
                Expanded(child: CircleAvatar(radius: 20, child: Text('data'),)), 
                Expanded(child: Divider(color: color.perpal1,)),
                Expanded(child: CircleAvatar(radius: 20, child: Text('data'),)), 
              ],),
            ),
           
          ],
        ),
      )),
    ));
  }

 
}
// class RecievedRFQDetail extends StatefulWidget {
//   final id;
//   RecievedRFQDetail({Key? key, required this.id}) : super(key: key);

//   @override
//   State<RecievedRFQDetail> createState() => _RecievedRFQDetailState();
// }

// class _RecievedRFQDetailState extends State<RecievedRFQDetail> {
//   efqController controller = efqController();

//   // List<dynamic>? trackdata = [];
//   // late TabController _controller;

//   // int current_step = 0;
//   // List<Step> stepsList = [];
//   @override
//   void initState() {
//     super.initState();
//     // _controller = TabController(length: 3, vsync: this, initialIndex: 0);
//     controller.rfqDetail(widget.id!);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: color.backgroundColor,
//         bottomNavigationBar: Common().bottomAppbar(context),
//         body: Center(
//           child: Container(
//             width: MediaQuery.of(context).size.width * 0.9,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Center(
//                   child: Container(
//                     child: Common().userProfile(context),
//                   ),
//                 ),
//                 const Text("Recieved RFQ",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 24,
//                       color: color.blue1,
//                       fontWeight: FontWeight.bold,
//                     )),
//                 // Container(
//                 //   width: MediaQuery.of(context).size.width,
//                 //   child: TabBar(
//                 //     labelColor: color.backgroundColor,
//                 //     unselectedLabelColor: color.perpal1,
//                 //     indicator: BoxDecoration(
//                 //       borderRadius: BorderRadius.circular(50),
//                 //       color: color.perpal1,
//                 //     ),
//                 //     controller: _controller,
//                 //     tabs: const [
//                 //       Tab(
//                 //         text: '1',
//                 //       ),
//                 //       // Tab(
//                 //       //   text: '2',
//                 //       // ),
//                 //       // Tab(
//                 //       //   text: '3',
//                 //       // )
//                 //     ],
//                 //   ),
//                 // ),
//                 // Obx(
//                 //   () => Container(
//                 //     height: MediaQuery.of(context).size.height * 0.6,
//                 //     child: TabBarView(
//                 //       controller: _controller,
//                 //       physics: const NeverScrollableScrollPhysics(),
//                 //       children: <Widget>[
//                 //         firstTab(),
//                 //         // secondTab(),
//                 //         // thirdTab(),
//                 //       ],
//                 //     ),
//                 //   ),
//                 // ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   ContainerDesign(key, value) {
//     return Container(
//       height: 50,
//       margin: EdgeInsets.only(bottom: 15),
//       padding: EdgeInsets.only(top: 10, right: 15, bottom: 10, left: 15),
//       width: MediaQuery.of(context).size.width * 0.9,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(5),
//         color: color.grey4,
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 key,
//                 style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                     color: color.black),
//               ),
//             ],
//           ),
//           Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//             Text(
//               value,
//               style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                   color: color.black),
//             ),
//           ]),
//         ],
//       ),
//     );
//   }

//   // setNextTab() {
//   //   _controller.index = _controller.index + 1;
//   // }

//   firstTab() {
//     return SingleChildScrollView(
//       child: Container(
//         // color: color.blue5,
//         padding: const EdgeInsets.only(top: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             // ContainerDesign(
//             //     "Requisitioner", controller.rfqDetail['createdBy'].toString()),
//             // ContainerDesign(
//             //     "Requistion No.", controller.rfqDetail['id'].toString()),
//             // ContainerDesign(
//             //     "Priority", controller.rfqDetail['createdBy'].toString()), /////
//             // ContainerDesign(
//             //     "Order Currency", controller.rfqDetail['currency']['code'].toString()),
//             // ContainerDesign("Item", controller.rfqDetail['createdBy'].toString()), ///////
//             // ContainerDesign(
//             //     "Extra Budgetory", 'fgdfdf'), ///////
//             // ContainerDesign(
//             //     "Department", controller.rfqDetail['department']['name'].toString()),
//             // ContainerDesign(
//             //   "Item Name",
//             //   controller.rfqDetail['createdBy'].toString(),
//             // ), ///////////
//             // ContainerDesign(
//             //   "Purpose",
//             //   controller.rfqDetail['createdBy'].toString(),
//             // ), ////////////
//             // ContainerDesign("CAAC Committee Report",
//             //     controller.rfqDetail['createdBy'].toString()), ////////////
//             // ContainerDesign("Location", controller.rfqDetail['location'].toString()),
//             // ContainerDesign(
//             //     "Requisition Type", controller.rfqDetail['requisitionType'].toString()),
//             // Center(
//             //   child: Container(
//             //     alignment: Alignment.center,
//             //     margin: EdgeInsets.only(top: 20, bottom: 20),
//             //     height: 50,
//             //     width: 130,
//             //     decoration: BoxDecoration(
//             //         borderRadius: BorderRadius.circular(10),
//             //         color: color.perpal1),
//             //     child: Center(
//             //       child: TextButton(
//             //         onPressed: () => setNextTab(),
//             //         child: Text('Next'),
//             //         style: TextButton.styleFrom(
//             //           padding: const EdgeInsets.all(15.0),
//             //           primary: Colors.white,
//             //           textStyle:
//             //               const TextStyle(fontSize: 16, color: color.grey4),
//             //         ),
//             //       ),
//             //     ),
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }

//   secondTab() {
//     return SizedBox();
//   }

//   thirdTab() {
//     return SizedBox();
//   }

//   boldTextStle() {
//     return const TextStyle(
//         fontSize: 14, fontWeight: FontWeight.w500, color: color.black);
//   }
// }
