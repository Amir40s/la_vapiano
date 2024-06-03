import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:la_vapiano/provider/language_code_provider.dart';
import 'package:la_vapiano/utils/constants.dart';
import 'package:la_vapiano/widget/button_widget.dart';
import 'package:la_vapiano/widget/text_widget.dart';
import 'package:provider/provider.dart';

import '../utils/app_text.dart';
import '../widget/custom_textfield.dart';

class ReservationScreen extends StatelessWidget {
   ReservationScreen({super.key});
  var nameController =  TextEditingController();
  var mobileController =  TextEditingController();
  var poxController =  TextEditingController();
  var dateController =  TextEditingController();
  var timeController =  TextEditingController();
  @override
  Widget build(BuildContext context) {
    final language = Provider.of<LanguageCodeProvider>(context,listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: TextWidget(text:
        language.languageCode == "en" ? reservation_en : language.languageCode == "ku" ? reservation_ku
            : reservation_ar,
            size: 18.0,color: Colors.white,),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.0,),
            TextWidget(text:
            language.languageCode == "en" ? name_en : language.languageCode == "ku" ? name_ku
                : name_ar,
              size: 14.0,color: Colors.white,),
            SizedBox(height: 10.0,),
            CustomTextField(hintText: language.languageCode == "en" ? name_en : language.languageCode == "ku" ? name_ku
                : name_ar, controller: nameController),
            SizedBox(height: 20.0,),
            TextWidget(text: language.languageCode == "en" ? mobile_en :
               language.languageCode == "ku" ? mobile_ku
                : mobile_ar
              , size: 14.0,color: Colors.white,),
            SizedBox(height: 10.0,),
            CustomTextField(hintText: language.languageCode == "en" ? mobile_en :
            language.languageCode == "ku" ? mobile_ku
                : mobile_ar, controller: mobileController),
            SizedBox(height: 20.0,),

            TextWidget(text: language.languageCode == "en" ? noOfPox_en :
            language.languageCode == "ku" ? noOfPox_ku
                : noOfPox_ar
              , size: 14.0,color: Colors.white,),
            SizedBox(height: 10.0,),
            CustomTextField(hintText: language.languageCode == "en" ? noOfPox_en :
            language.languageCode == "ku" ? noOfPox_ku
                : noOfPox_ar, controller: poxController),
            SizedBox(height: 20.0,),

            TextWidget(text: language.languageCode == "en" ? date_en :
            language.languageCode == "ku" ? date_ku
                : date_ar,
              size: 14.0,color: Colors.white,),
            SizedBox(height: 10.0,),
            CustomTextField(hintText: language.languageCode == "en" ? date_en :
            language.languageCode == "ku" ? date_ku
                : date_ar, controller: dateController),
            SizedBox(height: 20.0,),

            TextWidget(text: language.languageCode == "en" ? time_en :
            language.languageCode == "ku" ? time_ku
                : time_ar, size: 14.0,color: Colors.white,),
            SizedBox(height: 10.0,),
            CustomTextField(hintText: language.languageCode == "en" ? time_en :
            language.languageCode == "ku" ? time_ku
                : time_ar, controller: timeController),
            SizedBox(height: 20.0,),

            ButtonWidget(text: language.languageCode == "en" ? reservation_en : language.languageCode == "ku" ? reservation_ku
                : reservation_ar, onClicked: (){}, width: Get.width, height: 50.0)
          ],

        ),
      ),
    );
  }
}
