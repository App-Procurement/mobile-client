import 'package:flutter/material.dart';
import 'package:procurementapp/color.dart' as color;
import 'package:procurementapp/rootScreens/PurchaseOrder/approvePO.dart';
import 'package:procurementapp/rootScreens/PurchaseOrder/genratePO.dart';
import 'package:procurementapp/rootScreens/RecievedRFP/received_RFP.dart';
import 'package:procurementapp/rootScreens/Requisitions/approve_Requisition.dart';
import 'package:procurementapp/rootScreens/Contact/contact.dart';
import 'package:procurementapp/rootScreens/Dashboard/dashboard.dart';
import 'package:procurementapp/rootScreens/Email/email.dart';
import 'package:procurementapp/rootScreens/Invoice/invoice.dart';
import 'package:procurementapp/rootScreens/Kanban/kanban.dart';
import 'package:procurementapp/rootScreens/SetupCommittee/setupCommittee.dart';
import 'package:procurementapp/rootScreens/Vendor/vendor.dart';
import 'package:procurementapp/rootScreens/RecievedRFQ/received_RFQ.dart';
import 'package:procurementapp/rootScreens/Requisitions/new_Requsition.dart';
import 'package:procurementapp/rootScreens/Requisitions/manage_Requisition.dart';

// add_new_requsition()
// manageRequisition()
class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    option() {
      return Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            //border: Border.all(color: color.grey6),
            color: color.backgroundColor,
            borderRadius: BorderRadius.circular(14),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(43, 83, 82, 82),
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0, 2),
              )
            ],
          ),
          child: const Icon(
            Icons.stacked_line_chart_rounded,
            color: color.perpal8,
          ));
    }

    textstyle(text) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 11,
            color: color.grey3,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }

    headText(text) {
      return Text(
        text,
        style: const TextStyle(
            fontSize: 14, color: color.grey3, fontWeight: FontWeight.bold),
      );
    }

    return Container(
      height: double.infinity,
      width: MediaQuery.of(context).size.width,
      color: color.grey4,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              // color: color.blue1,
              height: MediaQuery.of(context).size.height * 0.9,
              // width: MediaQuery.of(context).size.width * 0.9,
              margin: const EdgeInsets.only(bottom: 20),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    headText('Recently open'),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            child: Container(
                              width: 60,
                              margin:
                                  const EdgeInsets.only(right: 20, bottom: 10),
                              child: Column(
                                children: [option(), textstyle('RFQ')],
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      RecievedRFQ()));
                            },
                          ),
                          GestureDetector(
                            child: Container(
                              width: 60,
                              margin:
                                  const EdgeInsets.only(right: 20, bottom: 10),
                              child: Column(
                                children: [option(), textstyle('Generate P.O')],
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      genratePO()));
                            },
                          ),
                          GestureDetector(
                            child: Container(
                              width: 60,
                              margin:
                                  const EdgeInsets.only(right: 20, bottom: 10),
                              child: Column(
                                children: [option(), textstyle('Approve P.O')],
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ApprovePO()));
                            },
                          ),
                        ],
                      ),
                    ),
                    headText('Request'),
                    Wrap(
                      children: [
                        GestureDetector(
                          child: Container(
                            width: 60,
                            margin:
                                const EdgeInsets.only(right: 20, bottom: 10),
                            child: Column(
                              children: [option(), textstyle('RFP')],
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ReceivedRFP()));
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            width: 60,
                            margin:
                                const EdgeInsets.only(right: 20, bottom: 10),
                            child: Column(
                              children: [
                                option(),
                                textstyle('Approve Requistion')
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ApproveRequisition()));
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            width: 60,
                            margin:
                                const EdgeInsets.only(right: 20, bottom: 10),
                            child: Column(
                              children: [
                                option(),
                                textstyle('New Requisition')
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    NewRequsition()));
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            width: 60,
                            margin:
                                const EdgeInsets.only(right: 20, bottom: 10),
                            child: Column(
                              children: [
                                option(),
                                textstyle('Manage Requisition')
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ManageRequisition()));
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            width: 60,
                            margin:
                                const EdgeInsets.only(right: 20, bottom: 10),
                            child: Column(
                              children: [
                                option(),
                                textstyle('Setup Committee')
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    SetupCommittee()));
                          },
                        ),
                      ],
                    ),
                    headText('Procure'),
                    Wrap(
                      children: [
                        GestureDetector(
                          child: Container(
                            width: 60,
                            margin:
                                const EdgeInsets.only(right: 20, bottom: 10),
                            child: Column(
                              children: [option(), textstyle('RFQ')],
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    RecievedRFQ()));
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            width: 60,
                            margin:
                                const EdgeInsets.only(right: 20, bottom: 10),
                            child: Column(
                              children: [option(), textstyle('Generate P.O')],
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    genratePO()));
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            width: 60,
                            margin:
                                const EdgeInsets.only(right: 20, bottom: 10),
                            child: Column(
                              children: [option(), textstyle('Approve P.O')],
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ApprovePO()));
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            width: 60,
                            margin:
                                const EdgeInsets.only(right: 20, bottom: 10),
                            child: Column(
                              children: [option(), textstyle('Vendor')],
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => Vendor()));
                          },
                        ),
                      ],
                    ),
                    headText('Services'),
                    Wrap(
                      children: [
                        GestureDetector(
                          child: Container(
                            width: 60,
                            margin:
                                const EdgeInsets.only(right: 20, bottom: 10),
                            child: Column(
                              children: [option(), textstyle('Kanban')],
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => Kanban()));
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            width: 60,
                            margin:
                                const EdgeInsets.only(right: 20, bottom: 10),
                            child: Column(
                              children: [option(), textstyle('Email')],
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => Email()));
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            width: 60,
                            margin:
                                const EdgeInsets.only(right: 20, bottom: 10),
                            child: Column(
                              children: [option(), textstyle('Invoice')],
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => Invoice()));
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            width: 60,
                            margin:
                                const EdgeInsets.only(right: 20, bottom: 10),
                            child: Column(
                              children: [option(), textstyle('Calender')],
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => DashBord()));
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            width: 60,
                            margin:
                                const EdgeInsets.only(right: 20, bottom: 10),
                            child: Column(
                              children: [option(), textstyle('Contact')],
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => Contact()));
                          },
                        ),
                      ],
                    ),
                    // customTabBar(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
