
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/HexColor.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/LeadingBackButton.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';


class MyAccount extends StatefulWidget {
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {

  String selectedAge = '<20';
  int selectedGender = 0;
  int selectedHistoryIBS = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorProfileBg,
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            "MY ACCOUNT",
            style: TextStyles.appBarTitle,
          ),
          leading: LeadingBackButton(
            onPressed: () => Get.back(),
          ),
        ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
            left: 20, right: 20, bottom: 40
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text("My Account Details.",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Roboto-Regular',
                    color: HexColor('4A358B'),
                  )
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 40, right: 40
              ),
              child: Text(
                  "You may edit your account details at any time. Changing your account’s email address and password requires email confirmation.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto-Regular',
                    color: HexColor('4A358B'),
                  )
              ),
            ),
            buildEmail(),
            buildPassword(),
            SizedBox(
              height: 14,
            ),
            buildGenderCard(),
            SizedBox(
              height: 14,
            ),
            buildAgeCard(),
            SizedBox(
              height: 14,
            ),
            buildFamilyIBSHistory(),
          ],
        ),
      ),
    );
  }

  buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 17),
        Text("Email address:",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Roboto-Regular',
              color: HexColor('4A358B'),
            )
        ),
        SizedBox(height: 17),
        Container(
          decoration: decoration(),
          child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.only(
                      left: 20, right: 20
                  )
              ),
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Roboto-Regular',
                fontWeight: FontWeight.normal,
                color: Colors.black,
              )
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            child: Text("Change email",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Roboto-Regular',
                  color: HexColor('4A358B'),
                )
            ),
            onPressed: () {

            },
          ),
        )
      ],
    );
  }

  buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Password:",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Roboto-Regular',
              color: HexColor('4A358B'),
            )
        ),
        SizedBox(height: 17),
        Container(
          decoration: decoration(),
          child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.only(
                      left: 20, right: 20
                  )
              ),
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Roboto-Regular',
                fontWeight: FontWeight.normal,
                color: Colors.black,
              )
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            child: Text("Change Password",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: 'Roboto-Regular',
                  fontWeight: FontWeight.normal,
                  color: HexColor('4A358B'),
                )
            ),
            onPressed: () {

            },
          ),
        )
      ],
    );
  }

  genderSelection(int selected) {
    selectedGender = selected;

    setState(() {

    });
  }

  buildGenderCard() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: decoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              "What is your sex :",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto-Regular',
                color: HexColor('4A358B'),
              )
          ),
          SizedBox(height: 16),
          Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(0),
                  primary: Colors.transparent,
                  elevation: 0
                ),
                child: Row(
                  children: [
                    Image.asset(
                      (selectedGender == 1)
                          ? 'assets/images/my_profile/mark.png'
                          : 'assets/images/my_profile/mark-noactive.png',
                      height: 26,
                    ),
                    SizedBox(width: 5),
                    Text("Female", style: TextStyles.textStyleRegular),
                  ],
                ),
                onPressed: () {
                  genderSelection(1);
                },
              ),
              SizedBox(width: 14),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(0),
                    primary: Colors.transparent,
                    elevation: 0
                ),
                child: Row(
                  children: [
                    Image.asset(
                      (selectedGender == 2)
                          ? 'assets/images/my_profile/mark.png'
                          : 'assets/images/my_profile/mark-noactive.png',
                      height: 26,
                    ),
                    SizedBox(width: 5),
                    Text("Male", style: TextStyles.textStyleRegular),
                  ],
                ),
                onPressed: () {
                  genderSelection(2);
                },
              ),
              SizedBox(width: 14),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(0),
                    primary: Colors.transparent,
                    elevation: 0
                ),
                child: Row(
                  children: [
                    Image.asset(
                      (selectedGender == 3)
                          ? 'assets/images/my_profile/mark.png'
                          : 'assets/images/my_profile/mark-noactive.png',
                      height: 26,
                    ),
                    SizedBox(width: 5),
                    Text("Prefer no response", style: TextStyles.textStyleRegular),
                  ],
                ),
                onPressed: () {
                  genderSelection(3);
                },
              ),
              SizedBox(width: 14),
            ],
          )
        ],
      ),
    );
  }

  buildAgeCard() {
    return Container(
      decoration: decoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: ScreenConstant.spacingAllMedium,
            child: Text("What is your age :",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Roboto-Regular',
                  color: HexColor('4A358B'),
                )
            ),
          ),
          Container(
            height: ScreenConstant.defaultHeightForty,
            width: double.maxFinite,
            margin: EdgeInsets.only(
                left: ScreenConstant.defaultWidthTen * 1.5,
                right: ScreenConstant.defaultWidthTen * 1.5,
                bottom: ScreenConstant.defaultHeightTen * 1.5),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            decoration: BoxDecoration(
                color: AppColors.colordropdownArrowBg,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            // dropdown below..
            child: DropdownButton<String>(
                isExpanded: true,
                dropdownColor: AppColors.white,
                value: selectedAge,
                elevation: 30,
                icon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: AppColors.colordropdownArrow,
                ),
                iconSize: 20,
                underline: SizedBox(),
                onChanged: (String newValue) {
                  selectedAge = newValue;

                  setState(() {

                  });
                },
                items: <String>[
                  "<20",
                  "20-29",
                  "30-39",
                  "40-49",
                  "50-59",
                  "60-69",
                  "70+"
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value.toString(),
                    child: Text(value.toString(),
                        style: TextStyles.textStyleRegular),
                  );
                }).toList()),
          ),
        ],
      ),
    );
  }

  ibsSelection(int selected) {
    selectedHistoryIBS = selected;

    setState(() {

    });
  }

  buildFamilyIBSHistory() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: decoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Do you have a family history of IBS?",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto-Regular',
                color: HexColor('4A358B'),
              )
          ),
          SizedBox(height: 16),
          Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(0),
                    primary: Colors.transparent,
                    elevation: 0
                ),
                child: Row(
                  children: [
                    Image.asset(
                      (selectedHistoryIBS == 1)
                          ? 'assets/images/my_profile/mark.png'
                          : 'assets/images/my_profile/mark-noactive.png',
                      height: 26,
                    ),
                    SizedBox(width: 5),
                    Text("Yes", style: TextStyles.textStyleRegular),
                  ],
                ),
                onPressed: () {
                  ibsSelection(1);
                },
              ),
              SizedBox(width: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(0),
                    primary: Colors.transparent,
                    elevation: 0
                ),
                child: Row(
                  children: [
                    Image.asset(
                      (selectedHistoryIBS == 2)
                          ? 'assets/images/my_profile/mark.png'
                          : 'assets/images/my_profile/mark-noactive.png',
                      height: 26,
                    ),
                    SizedBox(width: 5),
                    Text("No", style: TextStyles.textStyleRegular),
                  ],
                ),
                onPressed: () {
                  ibsSelection(2);
                },
              ),
              SizedBox(width: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(0),
                    primary: Colors.transparent,
                    elevation: 0
                ),
                child: Row(
                  children: [
                    Image.asset(
                      (selectedHistoryIBS == 3)
                          ? 'assets/images/my_profile/mark.png'
                          : 'assets/images/my_profile/mark-noactive.png',
                      height: 26,
                    ),
                    SizedBox(width: 5),
                    Text("Unsure", style: TextStyles.textStyleRegular),
                  ],
                ),
                onPressed: () {
                  ibsSelection(3);
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  decoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 6,
          offset: Offset(0, 0), // Shadow position
        ),
      ],
    );
  }

}
