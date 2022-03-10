// ignore_for_file: unnecessary_new, prefer_const_constructors, unrelated_type_equality_checks, curly_braces_in_flow_control_structures, avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:procurementapp/color.dart' as color;
import 'package:procurementapp/rootScreens/common.dart';
import 'package:procurementapp/rootScreens/profile.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dotted_border/dotted_border.dart';

class NewRequsition extends StatefulWidget {
  NewRequsition({Key? key}) : super(key: key);

  @override
  State<NewRequsition> createState() => _NewRequsitionState();
}

class _NewRequsitionState extends State<NewRequsition> {
  int _activeCurrentStep = 0;

  String currencyId = '-Select-';
  String departmentId = '-Select-';
  String priority = '-Select-';
  dynamic PickedFile;
  List requisitionLineItemLists = [];
  DateTime financialYear = DateTime.now();

  TextEditingController notes = new TextEditingController();
  TextEditingController ItemTxt = new TextEditingController();
  TextEditingController Quantitytxt = new TextEditingController();
  TextEditingController Unittxt = new TextEditingController();
  TextEditingController UnitCosttxt = new TextEditingController();
  TextEditingController TotalCosttxt = new TextEditingController();
  TextEditingController roleName = new TextEditingController();
                // status: "",
                // totalPrice: "",

  @override
  void initState() {
    super.initState();
  }

  var CurrencyList = [
    'INR',
    'USD',
    'EUR',
    'Pound',
  ];
  var departmentIdList = [
    'department 1',
    'department 2',
    'department 3',
    'department 4',
    'department 5',
  ];
  var Label = ['name', 'Quantity', 'Unit', 'Unit Cost', 'Total Cost'];
  var Product = [
    'hp laptop 500gb',
    'hp laptop 500gb',
    'hp laptop 500gb',
    'hp laptop 500gb',
    'hp laptop 500gb'
  ];

  _pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc', 'ppt', 'png'],
    );
    if (result == null) {
      return result;
    }
    final file = result.files.first;
    PickedFile = file.name;
  }

  uploadFile(String FileType) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(bottom: 40),
        child: DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(12),
          //padding: EdgeInsets.all(5),
          child: Container(
              height: 70,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                  color: color.grey6, borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.upload_file_rounded,
                    color: color.blue1,
                    size: 40,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Upload Files',
                        style: TextStyle(
                          color: color.grey3,
                          fontSize: 14,
                          height: 1.5,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      PickedFile == null
                          ? Text(
                              FileType,
                              style: const TextStyle(
                                color: color.grey3,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          : Text(PickedFile.toString())
                    ],
                  )
                ],
              )),
        ),
      ),
      onTap: () => _pickFile(),
    );
  }

  AddNewItemDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding:
              const EdgeInsets.only(top: 170, left: 0, right: 0, bottom: 0),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Container(
            color: color.backgroundColor,
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Item',
                        style: TextStyle(
                            color: color.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Container(
                        height: 60,
                        margin: const EdgeInsets.only(top: 10, bottom: 20),
                        padding: const EdgeInsets.only(
                            top: 10, right: 20, bottom: 10, left: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: color.grey6),
                        child: TextField(
                          controller: ItemTxt,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'PSDS Admin',
                            hintStyle: TextStyle(
                                color: color.grey8,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      const Text(
                        'Quantity',
                        style: TextStyle(
                            color: color.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Container(
                        height: 60,
                        margin: const EdgeInsets.only(top: 10, bottom: 20),
                        padding: const EdgeInsets.only(
                            top: 10, right: 20, bottom: 10, left: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: color.grey6),
                        child: TextField(
                          controller: Quantitytxt,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'PSDS Admin',
                            hintStyle: TextStyle(
                                color: color.grey8,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      const Text(
                        'Unit',
                        style: TextStyle(
                            color: color.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Container(
                        height: 60,
                        margin: const EdgeInsets.only(top: 10, bottom: 20),
                        padding: const EdgeInsets.only(
                            top: 10, right: 20, bottom: 10, left: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: color.grey6),
                        child: TextField(
                          controller: Unittxt,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'PSDS Admin',
                            hintStyle: TextStyle(
                                color: color.grey8,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      const Text(
                        'Unit Cost',
                        style: TextStyle(
                            color: color.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Container(
                        height: 60,
                        margin: const EdgeInsets.only(top: 10, bottom: 20),
                        padding: const EdgeInsets.only(
                            top: 10, right: 20, bottom: 10, left: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: color.grey6),
                        child: TextField(
                          controller: UnitCosttxt,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'PSDS Admin',
                            hintStyle: TextStyle(
                                color: color.grey8,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      const Text(
                        'Total Cost',
                        style: TextStyle(
                            color: color.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Container(
                        height: 60,
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.only(
                            top: 10, right: 20, bottom: 10, left: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: color.grey6),
                        child: TextField(
                          controller: TotalCosttxt,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'PSDS Admin',
                            hintStyle: TextStyle(
                                color: color.grey8,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          height: 50,
                          width: 100,
                          margin: const EdgeInsets.only(top: 30, bottom: 10),
                          decoration: BoxDecoration(
                            color: color.perpal1,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Text(
                              'Save',
                              style: TextStyle(
                                  color: color.backgroundColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: GestureDetector(
                          child: Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                              color: color.grey5,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Center(
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                    color: color.perpal1,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          onTap: () => Navigator.pop(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

datePicker()async{
    DateTime? date = await showDatePicker(
        context: context,
        firstDate: DateTime(DateTime.now().year - 1),
        lastDate: DateTime(DateTime.now().year + 2)
         initialDate: financialYear,);
         if(date != null){
           setState(() {
             financialYear = date;
           });
         }
  }
  @override
  Widget build(BuildContext context) {
    print(roleName.text);
    List<Step> stepList = [
      Step(
        state: _activeCurrentStep >= 0 ? StepState.indexed : StepState.disabled,
        isActive: _activeCurrentStep >= 0,
        content: Container(
          //width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Requister',
                style: TextStyle(
                    color: color.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20),
                margin: const EdgeInsets.only(top: 15, bottom: 20),
                height: 60,
                decoration: BoxDecoration(
                    color: color.grey6,
                    borderRadius: BorderRadius.circular(15)),
                child:  TextField(
                  controller: roleName,
                  maxLines: 1,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Psds Admin',
                  ),
                    // onChanged: (text) {
                    //   print('First text field: $text');
                    //   setState(() {
                    //     roleName: text;
                    //   });
                    // },
                  style: TextStyle(
                      color: color.grey8,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const Text(
                'Financial Year',
                style: TextStyle(
                    color: color.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              ListTile(
                    iconColor: color.grey3,
                    textColor: color.blue5,
                    tileColor: color.grey4,
                    dense: true,
                    title: Text(DateFormat('dd - MM - yyyy')
                                  .format(financialYear), style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                    trailing: Icon(Icons.calendar_month, color: color.grey3, size: 40,),
                    onTap: () {datePicker();},
                  ),
              const Text(
                'Department',
                style: TextStyle(
                    color: color.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 15, right: 15),
                height: 60,
                margin: const EdgeInsets.only(top: 15, bottom: 30),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: color.grey6,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: DropdownButton(
                    underline: const SizedBox(),
                    icon: Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: color.perpal1),
                      child: const Icon(
                        Icons.arrow_drop_down,
                      ),
                    ),
                    hint: Text(
                      departmentId,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: color.grey8),
                    ),
                    iconSize: 30,
                    elevation: 1,
                    isExpanded: true,
                    iconEnabledColor: color.backgroundColor,
                    items: departmentIdList.map((String departmentIdList) {
                      return DropdownMenuItem(
                        value: departmentIdList,
                        child: Text(departmentIdList),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        departmentId = newValue!;
                      });
                    }),
              ),
              const Text(
                'Currency',
                style: TextStyle(
                    color: color.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 15, right: 15),
                height: 60,
                margin: const EdgeInsets.only(top: 15, bottom: 40),
                //width: MediaQuery.of(context).size.width * 0.8,
                decoration: const BoxDecoration(
                    color: color.grey6,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: DropdownButton(
                    underline: const SizedBox(),
                    icon: Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: color.perpal1),
                      child: const Icon(Icons.arrow_drop_down),
                    ),
                    hint: Text(
                      currencyId,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: color.grey8),
                    ),
                    iconSize: 30,
                    alignment: Alignment.center,
                    elevation: 1,
                    isExpanded: true,
                    iconEnabledColor: color.backgroundColor,
                    items: CurrencyList.map((String CurrencyList) {
                      return DropdownMenuItem(
                        value: CurrencyList,
                        child: Text(CurrencyList),
                      );
                    }).toList(),
                    onChanged: (String? val) {
                      setState(() {
                        currencyId = val!;
                      });
                    }),
              ),
            ],
          ),
        ),
        title: const Text(''),
      ),
      Step(
        state: _activeCurrentStep >= 1 ? StepState.indexed : StepState.disabled,
        isActive: _activeCurrentStep >= 1,
        content: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Currency',
                style: TextStyle(
                    color: color.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20),
                margin: const EdgeInsets.only(top: 15, bottom: 20),
                height: 60,
                decoration: BoxDecoration(
                    color: color.grey6,
                    borderRadius: BorderRadius.circular(15)),
                //width: MediaQuery.of(context).size.width * 0.9,
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Dollar',
                      style: TextStyle(
                          color: color.grey8,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    )),
              ),
              const Text(
                'Priority',
                style: TextStyle(
                    color: color.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              // Container(
              //   alignment: Alignment.centerLeft,
              //   padding: const EdgeInsets.only(left: 15, right: 15),
              //   height: 60,
              //   margin: const EdgeInsets.only(top: 15, bottom: 30),
              //   decoration: const BoxDecoration(
              //       color: color.grey6,
              //       borderRadius: BorderRadius.all(Radius.circular(10))),
              //   child: DropdownButton(
              //       icon: const Icon(Icons.arrow_drop_down),
              //       hint: Text(
              //         priority,
              //         style: const TextStyle(
              //           fontSize: 20,
              //           fontWeight: FontWeight.w500,
              //           color: color.grey8,
              //         ),
              //       ),
              //       iconSize: 30,
              //       elevation: 1,
              //       isExpanded: true,
              //       iconEnabledColor: color.perpal1,
              //       items: PriorityList.map((String PriorityList) {
              //         return DropdownMenuItem(
              //           value: PriorityList,
              //           child: Text(PriorityList),
              //         );
              //       }).toList(),
              //       onChanged: (String? newValue) {
              //         setState(() {
              //           priority = newValue!;
              //         });
              //       }),
              // ),
             
              const Text(
                'General Purpose',
                style: TextStyle(
                    color: color.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 15, right: 15),
                margin: const EdgeInsets.only(top: 15, bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: color.grey6,
                ),
                height: 150,
                width: double.infinity,
                child: TextField(
                    controller: notes,
                    maxLines: 15,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Requester Writes Any Thing Here',
                      hintStyle: TextStyle(
                          color: color.grey8,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    )),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: const Text(
                      'General Purpose',
                      style: TextStyle(
                          color: color.grey3,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  const Icon(
                    Icons.info_outline,
                    size: 30,
                    color: color.grey3,
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 15),
                child: const Text(
                  'Attach Files',
                  style: TextStyle(
                      color: color.grey3,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
              uploadFile(
                'PDF, DOC, PPT, JPG, PNG',
              ),
            ],
          ),
        ),
        title: const Text(''),
      ),
      Step(
        state: _activeCurrentStep >= 2 ? StepState.indexed : StepState.disabled,
        isActive: _activeCurrentStep >= 2,
        content: Container(
          child: Column(
            children: [
              GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(top: 10, bottom: 20),
                  height: 60,
                  width: 215,
                  decoration: BoxDecoration(
                      color: color.perpal1,
                      borderRadius: BorderRadius.circular(15)),
                  child: const Center(
                      child: Text(
                    'Add New Item',
                    style: TextStyle(
                        color: color.backgroundColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  )),
                ),
                onTap: () => AddNewItemDialog(),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: Label.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 50,
                      padding: const EdgeInsets.only(
                          top: 10, right: 15, bottom: 10, left: 15),
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      decoration: BoxDecoration(
                          color: color.grey4,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              Label[index],
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: color.black),
                            ),
                          ),
                          Text(
                            Product[index],
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: color.black),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 20, bottom: 15),
                child: const Text(
                  'Attach Files',
                  style: TextStyle(
                      color: color.grey3,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
              uploadFile('Excel File'),
            ],
          ),
        ),
        title: const Text(''),
      )
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: color.backgroundColor,
        bottomNavigationBar: Common().bottomAppbar(context),
        body: Center(
          child: Container(
            //width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Common().userProfile(context),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text(
                      'Add New Requsition',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: color.blue1),
                    ),
                  ),
                ),
                Expanded(
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme:
                          const ColorScheme.light(primary: color.perpal1),
                    ),
                    child: Center(
                      child: Container(
                        //width: MediaQuery.of(context).size.width * 0.9,
                        color: color.backgroundColor,
                        child: Theme(
                          data: ThemeData(
                             canvasColor: Colors.white,
                              shadowColor: Colors.white.withOpacity(0.1),
                              primaryColor: color.perpal1),
                          child: Stepper(
                            type: StepperType.horizontal,
                            steps: stepList,
                            currentStep: _activeCurrentStep,
                            onStepContinue: () {
                              if (_activeCurrentStep < stepList.length - 1) {
                                setState(() {
                                  _activeCurrentStep++;
                                });
                                if (_activeCurrentStep == 2) {
                                  print('perform operation');
                                }
                              }
                            },
                            onStepCancel: () {
                              if (_activeCurrentStep == 0) {
                                return;
                              }
                              setState(() {
                                _activeCurrentStep--;
                              });
                            },
                            onStepTapped: (step) {
                              setState(() {
                                _activeCurrentStep = step;
                              });
                            },
                            controlsBuilder: (BuildContext context,
                                ControlsDetails controls) {
                              return Container(
                                margin:
                                    const EdgeInsets.only(left: 80, right: 80),
                                height: 50,
                                decoration: BoxDecoration(
                                    color: color.perpal1,
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextButton(
                                  onPressed: checkvalidation(controls),
                                  // (() {
                                  //   print(roleName.text);
                                  //   print(financialYear);
                                  //   print(departmentId);
                                  //   print(currencyId);
                                  //   if(roleName.text!= '' && financialYear!='' && departmentId!=''&&currencyId!=''){
                                  //    controls.onStepContinue;
                                  // }
                                  // ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        _activeCurrentStep == 2
                                            ? 'Send'
                                            : 'Next',
                                        style: const TextStyle(
                                            color: color.backgroundColor,
                                             fontSize: 16),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Icon(
                                        _activeCurrentStep == 2
                                            ? Icons.send_outlined
                                            : Icons.arrow_right_alt,
                                        color: color.backgroundColor,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  checkvalidation(controls){  
    if(roleName.text != "" && roleName.text != null ){
         controls.onStepContinue;
         }
  }
}
