import 'package:flutter/material.dart';
import 'package:procurementapp/rootScreens/common.dart';
import 'package:procurementapp/color.dart' as color;

class TrackRequisition extends StatefulWidget {
  TrackRequisition({Key? key}) : super(key: key);

  @override
  State<TrackRequisition> createState() => _TrackRequisitionState();
}

class _TrackRequisitionState extends State<TrackRequisition>
    with TickerProviderStateMixin {
  List<dynamic> trackdata = [
    {
      'title': 'Request created by',
      'subTitle': 'james Harpeny',
      'status': 'compeleted',
      'date': 'Mar 21, 2021',
      'time': '08:00 PM'
    },
    {
      'title': 'Request approved by',
      'subTitle': 'PSDS Admin',
      'status': 'compeleted',
      'date': 'Mar 21, 2021',
      'time': '08:00 PM'
    },
    {
      'title': 'P.O Generated by',
      'subTitle': ' PSDS Admin',
      'status': 'compeleted',
      'date': 'Mar 21, 2021',
      'time': '08:00 PM'
    },
    {
      'title': 'Request Created by',
      'subTitle': 'james Harpeny',
      'status': 'compeleted',
      'date': 'Mar 21, 2021',
      'time': '08:00 PM'
    }
  ];
  late TabController _controller;
  int current_step = 0;
  List<Step> stepsList = [];

  @override
  void initState() {
    _controller = TabController(length: 4, vsync: this, initialIndex: 0);
    for (int i = 0; i < trackdata.length; i++) {
      Map<String, String> data = trackdata[i];
      stepsList.add(
        Step(
          title: Column(
            children: [
              Text(data["date"].toString()),
              Text(data["time"].toString())
            ],
          ),
          content: Container(
            decoration: BoxDecoration(
                color: color.backgroundColor,
                borderRadius: BorderRadius.circular(15)),
            // height: 70,
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const CircleAvatar(
                  radius: 20,
                  child: Icon(Icons.museum_rounded),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data["title"].toString()),
                    Text(data["subTitle"].toString())
                  ],
                )
              ],
            ),
          ),
          isActive: true,
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
              // color: color.grey1,
              // padding: const EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width * 0.9,
              // height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Common().userProfile(context),
                  const Text("Track Requisition",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        color: color.blue1,
                        fontWeight: FontWeight.bold,
                      )),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          height: 500,
                          child: Stepper(
                            steps: stepsList,
                            currentStep: current_step,
                            type: StepperType.vertical,
                            controlsBuilder: (BuildContext context,
                                ControlsDetails controls) {
                              return Row();
                            },
                            onStepTapped: (step) {
                              setState(() {
                                current_step = step;
                              });
                            },
                            // onStepContinue: () {
                            //   if (current_step < stepsList.length - 1) {
                            //     setState(() {
                            //       current_step++;
                            //     });
                            //   }
                            // },
                            // onStepCancel: () {
                            //   setState(() {
                            //     if (current_step > 0) {
                            //       current_step--;
                            //     }
                            //   });
                            // },
                          ),
                        )
                      ],
                    ),
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
