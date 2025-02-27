// ignore_for_file: sort_child_properties_last

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sau_mukratha_app/views/show_bill_ui.dart';

class CalBillUi extends StatefulWidget {
  const CalBillUi({super.key});

  @override
  State<CalBillUi> createState() => _CalBillUiState();
}

class _CalBillUiState extends State<CalBillUi> {
  bool adultCheck = false;
  bool childCheck = false;

  TextEditingController adultController = TextEditingController(text: '0');
  TextEditingController childController = TextEditingController(text: '0');

  TextEditingController cokeController = TextEditingController(text: '0');
  TextEditingController waterController = TextEditingController(text: '0');

  int waterCheck = 1;

  File? imgFile;

  Future<void> openCamera() async {
    final picker = await ImagePicker().pickImage(
      source: ImageSource.camera, //ImageSource.gallery
      imageQuality: 75,
    );
    if (picker == null) return;

    setState(() {
      imgFile = File(picker.path);
    });
  }

  List<String> memberType = [
    'ไม่เป็นสมาชิก',
    'สมาชิกทั่วไปลด 5%',
    'สมาชิก VIP 20%',
  ];

  double discount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 35, right: 35),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 50),
                InkWell(
                  onTap: () {
                    openCamera();
                  },
                  child: imgFile == null
                      ? Image.asset(
                          'assets/images/camera.jpg',
                          height: 120,
                        )
                      : Image.file(
                          imgFile!,
                          height: 120,
                        ),
                ),
                SizedBox(
                  height: 50,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'จำนวนคน',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      onChanged: (valurparam) {
                        setState(() {
                          adultCheck = valurparam!;
                          if (valurparam! == false) {
                            adultController.text = '0';
                          }
                        });
                      },
                      value: adultCheck,
                    ),
                    Text(
                      'ผู้ใหญ่ 299 บาท/คน จำนวน ',
                    ),
                    Flexible(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        enabled: adultCheck,
                        controller: adultController,
                      ),
                    ),
                    Text(
                      ' คน',
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      onChanged: (valurparam) {
                        setState(() {
                          childCheck = valurparam!;
                          if (valurparam! == false) {
                            childController.text = '0';
                          }
                        });
                      },
                      value: childCheck,
                    ),
                    Text(
                      'เด็ก 69 บาท/คน จำนวน       ',
                    ),
                    Flexible(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        enabled: childCheck,
                        controller: childController,
                      ),
                    ),
                    Text(
                      ' คน',
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'บุฟเฟ่ต์น้ำดื่ม',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Radio(
                      onChanged: (valueparam) {
                        setState(() {
                          waterCheck = valueparam!;
                          if (waterCheck == 1) {
                            cokeController.text = '0';
                            waterController.text = '0';
                          }
                        });
                      },
                      value: 1,
                      groupValue: waterCheck,
                    ),
                    Text('รับ 25 บาท/หัว ')
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      onChanged: (valueparam) {
                        setState(() {
                          waterCheck = valueparam!;
                        });
                      },
                      value: 2,
                      groupValue: waterCheck,
                    ),
                    Text('ไม่รับ')
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '              โค้ก 20 บาท/ขวด จำนวน      ',
                    ),
                    Flexible(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        enabled: waterCheck == 1 ? false : true,
                        controller: cokeController,
                      ),
                    ),
                    Text(
                      ' ขวด',
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '             น้ำเปล่า 15 บาท/ขวด จำนวน  ',
                    ),
                    Flexible(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        enabled: waterCheck == 2 ? true : false,
                        controller: waterController,
                      ),
                    ),
                    Text(
                      ' ขวด',
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ประเภทสมาชิก',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                //Dropdown ประเภทสมาชิก
                DropdownButtonFormField(
                  value: discount,
                  isExpanded: true,
                  items: memberType
                      .map(
                        (e) => DropdownMenuItem(
                          child: Text(
                            e,
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          value: memberType.indexOf(e).toDouble(),
                        ),
                      )
                      .toList(),
                  onChanged: (valueParam) {
                    switch (valueParam) {
                      case 0:
                        discount = 0;
                        break;
                      case 1:
                        discount = 0.05;
                        break;
                      case 2:
                        discount = 0.2;
                        break;
                    }
                  },
                ),
                SizedBox(height: 20.0),
                //button ปุ่ม
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          if (imgFile == null) {
                          } else if (adultCheck == true &&
                                  adultController.text == '0' ||
                              adultController.text.length == 0) {
                          } else if (childCheck == true &&
                                  childController.text == '0' ||
                              childController.text.length == 0) {
                          } else {
                            int adult = int.parse(adultController.text);
                            int child = int.parse(childController.text);
                            int coke = int.parse(cokeController.text);
                            int water = int.parse(waterController.text);
                            double payWaterBuffet =
                                waterCheck == 1 ? 25.0 * (adult + child) : 0;
                            double paytotal = (299.0 * adult) +
                                (69.0 * child) +
                                (20.0 * coke) +
                                (15.0 * water) +
                                payWaterBuffet;
                            paytotal = paytotal - (paytotal * discount);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShowBillUi(
                                  paytotal: paytotal,
                                  imgFile: imgFile,
                                ),
                              ),
                            );
                          }
                        },
                        icon: Icon(
                          Icons.calculate,
                        ),
                        label: Text(
                          'คำนวนเงิน',
                        ),
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(
                              double.infinity,
                              50.0,
                            ),
                            backgroundColor: Colors.deepOrange,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.cancel,
                        ),
                        label: Text(
                          'ยกเลิก',
                        ),
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(
                              double.infinity,
                              50.0,
                            ),
                            backgroundColor:
                                const Color.fromARGB(255, 59, 197, 71),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
