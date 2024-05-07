import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:la_vapiano/utils/app_text.dart';
import 'package:la_vapiano/utils/constants.dart';
import 'package:la_vapiano/widget/header.dart';
import 'package:la_vapiano/widget/text_widget.dart';

import '../../widget/button_widget.dart';

class TableSlipScreen extends StatelessWidget {
  const TableSlipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Header(text: '',),

            SizedBox(height: 30.0,),
            TextWidget(text: must_login_text, size: 22.0,fontFamily: oleoFont,color: Colors.white,),

            SizedBox(height: 60.0,),
            Container(
              width: Get.width,
              height: 300.0,
              padding: EdgeInsets.all(50.0),
              child: Image.asset(cartoon_image),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextWidget(text: "You must login to see the history", size: 16.0,fontFamily: oleoFont,color: Colors.white,),
                ),
                Container(
                    padding: EdgeInsets.all(20.0),
                    child: ButtonWidget(text: "Login", onClicked: (){}, width: 100.0, height: 30.0,radius: 50.0,)),
              ],
            ),

            Container(
              margin: EdgeInsets.only(left: 20.0,right: 20.0),
              child: Table(
                border: TableBorder.all(color: Colors.white),
                columnWidths: const {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(1),
                  2: FlexColumnWidth(3),
                  3: FlexColumnWidth(1),
                  4: FlexColumnWidth(1),
                },
                children: [
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Center(child: TextWidget(text: "#", size: 16.0,color: Colors.white,)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Center(child: TextWidget(text: "image", size: 16.0,color: Colors.white,)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Center(child: TextWidget(text: "Description", size: 16.0,color: Colors.white,)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Center(child: TextWidget(text: "Qty", size: 16.0,color: Colors.white,)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Center(child: TextWidget(text: "Price", size: 16.0,color: Colors.white,)),
                      ),

                    ]
                  )
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 20.0,right: 20.0,top: 30.0),
              child: Table(
                border: TableBorder.all(color: Colors.white),
                columnWidths: const {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(2),
                  2: FlexColumnWidth(2),
                  3: FlexColumnWidth(2),
                },
                children: [
                  TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Center(child: TextWidget(text: "#", size: 16.0,color: Colors.white,)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Center(child: TextWidget(text: "Price", size: 16.0,color: Colors.white,)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Center(child: TextWidget(text: "QTY", size: 16.0,color: Colors.white,)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Center(child: TextWidget(text: "Total", size: 16.0,color: Colors.white,)),
                        ),

                      ]
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20.0,right: 20.0),
              child: Table(
                border: TableBorder.all(color: Colors.white),
                columnWidths: const {
                  0: FlexColumnWidth(5),
                  1: FlexColumnWidth(2),
                },
                children: [
                  TableRow(
                      children: [
                        Container(
                          color: Colors.red,
                          padding: const EdgeInsets.all(4.0),
                          child: Center(child: TextWidget(text: "Total", size: 16.0,color: Colors.white,)),
                        ),
                        Container(
                          color: Colors.red,
                          padding: const EdgeInsets.all(4.0),
                          child: Center(child: TextWidget(text: "IQD: 0", size: 16.0,color: Colors.white,)),
                        ),
                      ]
                  )
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0),
                child: Divider())
          ],
        ),
      ),
    );
  }
}
