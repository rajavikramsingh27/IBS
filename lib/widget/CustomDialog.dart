import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ibs/controllers/treatment_plan/TreatmentPlanController.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/models/TreatmentPlanModel/TreatmentPlanModel.dart';
import 'package:flutter_ibs/models/TreatmentPlanModel/TreatmentPlanResponseModel.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/CustomElevatedButton.dart';
import 'package:flutter_ibs/widget/DropDownList.dart';
import 'package:get/get.dart';

class CustomDialog extends StatelessWidget {
  final double height;
  final String title;
  final String description;

  const CustomDialog({Key key, this.height, this.title, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildDialog();
  }

  _buildDialog() {
    return Material(
      type: MaterialType.transparency,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: ScreenConstant.defaultHeightTwenty),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16)),
                      ),
                      height: height,
                      margin: EdgeInsets.symmetric(
                          horizontal: ScreenConstant.defaultWidthTwenty),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: ScreenConstant.defaultHeightForty),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: ScreenConstant.defaultWidthTwenty),
                            child: Text("$title",
                                textAlign: TextAlign.start,
                                style: TextStyles.textStyleIntroDescription
                                    .apply(color: Colors.black87)),
                          ),
                          SizedBox(height: ScreenConstant.defaultHeightSixteen),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: ScreenConstant.defaultWidthTwenty),
                            child: Text('''$description''',
                                textAlign: TextAlign.start,
                                style: TextStyles.textStyleRegular.apply(
                                    color: AppColors.colorDialogDescription)),
                          ),
                          SizedBox(height: ScreenConstant.defaultHeightForty),
                        ],
                      ),
                    ),
                    Container(
                      height: ScreenConstant.screenHeightTwelve,
                      margin: EdgeInsets.symmetric(
                          horizontal: ScreenConstant.defaultWidthTwenty),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16)),
                        color: AppColors.colorBackground,
                      ),
                      child: Row(
                        children: [
                          Expanded(child: Image.asset(Assets.curl6)),
                          SizedBox(width: ScreenConstant.defaultWidthTwenty),
                          Expanded(child: Image.asset(Assets.curl5))
                        ],
                      ),
                      // padding: ScreenConstant.spacingAllLarge,
                      // margin: ScreenConstant.spacingAllLarge,
                    )
                  ],
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: CircleAvatar(
                    backgroundColor: AppColors.colorCloseLight,
                    radius: 20,
                    child: CircleAvatar(
                        backgroundColor: AppColors.colorCloseLight,
                        radius: 18,
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: FontSize.s15,
                        )),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomDialog2 extends StatelessWidget {
  final double height;
  final String title;
  final String description;

  const CustomDialog2({Key key, this.height, this.title, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildDialog();
  }

  _buildDialog() {
    return Material(
      type: MaterialType.transparency,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: ScreenConstant.defaultHeightTwenty),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16)),
                      ),
                      height: height,
                      margin: EdgeInsets.symmetric(
                          horizontal: ScreenConstant.defaultWidthTwenty),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: ScreenConstant.defaultHeightForty),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: ScreenConstant.defaultWidthTwenty),
                            child: RichText(
                              text: TextSpan(
                                text: 'Are you sure you want to stop the  ',
                                style: TextStyles.textStyleIntroDescription
                                    .apply(color: Colors.black),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "STRESS MANAGEMENT",
                                    style: TextStyles.textStyleIntroDescription
                                        .apply(
                                            color: AppColors.colorArrowButton),
                                  ),
                                  TextSpan(
                                    text: " treatment plan?",
                                    style: TextStyles.textStyleIntroDescription
                                        .apply(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: ScreenConstant.defaultHeightSixteen),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: ScreenConstant.defaultWidthTwenty),
                            child: Text(
                                '''Stoping this plan will move this plan into past treatment plans area.\n\nAny data collected for this plan will be retained.''',
                                textAlign: TextAlign.start,
                                style: TextStyles.textStyleRegular.apply(
                                    color: AppColors.colorDialogDescription)),
                          ),
                          SizedBox(
                              height:
                                  ScreenConstant.defaultHeightTwentyFour * 2.2),
                          Center(
                            child: CustomElevatedButton2(
                              onTap: () {},
                              text: "Yes, Stop this Treatment Plan",
                              widthFactor: 0.9,
                              textColor: Colors.white,
                              buttonColor: AppColors.colorArrowButton,
                            ),
                          ),
                          SizedBox(
                              height: ScreenConstant.defaultHeightTwentyFour),
                          Center(
                              child: TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Text(
                                    "Cancel",
                                    style: TextStyles.textStyleRegular.apply(
                                        color: AppColors.colorBackground,
                                        fontSizeDelta: 3),
                                  ))),
                          SizedBox(height: ScreenConstant.defaultHeightForty),
                        ],
                      ),
                    ),
                    Container(
                      height: ScreenConstant.screenHeightTwelve,
                      margin: EdgeInsets.symmetric(
                          horizontal: ScreenConstant.defaultWidthTwenty),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16)),
                        color: AppColors.colorBackground,
                      ),
                      child: Row(
                        children: [
                          Image.asset(Assets.curl6),
                          SizedBox(width: ScreenConstant.defaultWidthTwenty),
                          Image.asset(Assets.curl5)
                        ],
                      ),
                      // padding: ScreenConstant.spacingAllLarge,
                      // margin: ScreenConstant.spacingAllLarge,
                    )
                  ],
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: CircleAvatar(
                    backgroundColor: AppColors.colorCloseLight,
                    radius: 20,
                    child: CircleAvatar(
                        backgroundColor: AppColors.colorCloseLight,
                        radius: 18,
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: FontSize.s15,
                        )),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomDialog3 extends StatelessWidget {
  final double height;
  final String title;
  final String description;

  const CustomDialog3({Key key, this.height, this.title, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildDialog();
  }

  _buildDialog() {
    return Material(
      borderRadius: BorderRadius.circular(ScreenConstant.sizeMedium),
      type: MaterialType.transparency,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            height: height,
            margin: EdgeInsets.symmetric(
                horizontal: ScreenConstant.defaultWidthTwenty),
            padding: ScreenConstant.spacingAllLarge,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.stop,
                  width: ScreenConstant.sizeXXXL,
                ),
                SizedBox(height: ScreenConstant.defaultHeightSixteen),
                Text(
                  title,
                  style: TextStyles.textStyleIntroDescription
                      .apply(color: AppColors.colorDialogTitle),
                ),
                SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
                Text(
                  description,
                  style: TextStyles.textStyleRegular
                      .apply(color: AppColors.colorDialogTitle),
                ),
                SizedBox(height: ScreenConstant.defaultHeightTwenty),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: ScreenConstant.defaultWidthOneForty,
                      child: CustomElevatedButton2(
                        text: "Cancel",
                        buttonColor: AppColors.colorBtnCancel,
                        onTap: () {},
                        textColor: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: ScreenConstant.defaultWidthOneForty,
                      child: CustomElevatedButton2(
                        text: "Stop",
                        buttonColor: AppColors.colorArrowButton,
                        onTap: () {},
                        textColor: Colors.white,
                      ),
                    )
                  ],
                ),
                SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomDialog4 extends StatelessWidget {
  final double height;
  final String title;
  final String description;
  final data;
  final List<Trackable> listOption;
  const CustomDialog4(
      {Key key,
      this.height,
      this.title,
      this.description,
      this.data,
      this.listOption})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildDialog();
  }

  _buildDialog() {
    return Material(
      borderRadius: BorderRadius.circular(ScreenConstant.sizeMedium),
      type: MaterialType.transparency,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              height: height,
              margin: EdgeInsets.symmetric(
                  horizontal: ScreenConstant.defaultWidthTwenty),
              padding: ScreenConstant.spacingAllLarge,
              child: DialogReminderWidget(
                listOption: listOption,
                data: data,
                title: "Edit Notification",
                description:
                    "To edit the notification, modify the options below and click Save.",
                textRemindMe: "Remind me:",
                textTime: "At time:",
                textMessage: "With message:",
              )),
        ],
      ),
    );
  }
}

class DialogReminderWidget extends StatefulWidget {
  final String title;
  final String description;
  final String textRemindMe;
  final String textTime;
  final String textMessage;
  final data;
  final List<Trackable> listOption;

  final bool valueReminder;
  final bool valueChild;
  final Function() onPressed;

  final Function(bool) onChanged;
  final Function(bool) onChangedChild;

  final String editText;

  const DialogReminderWidget(
      {Key key,
      this.title = "",
      this.description = "",
      this.valueReminder = false,
      this.valueChild = false,
      this.onChanged,
      this.onChangedChild,
      this.editText = "",
      this.onPressed,
      this.textRemindMe = "",
      this.textTime = "",
      this.textMessage = "",
      this.data,
      this.listOption})
      : super(key: key);

  @override
  State<DialogReminderWidget> createState() => _DialogReminderWidgetState();
}

class _DialogReminderWidgetState extends State<DialogReminderWidget> {
  final TreatmentPlanController _treatmentPlanController = Get.find();
  TextEditingController messageTextController;
  @override
  void initState() {
    super.initState();
    messageTextController = TextEditingController(text: widget.data.message);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: ScreenConstant.defaultHeightForty),
        Text(widget.title,
            style: TextStyles.textStyleIntroDescription
                .apply(color: AppColors.colorDialogTitle, fontSizeDelta: -3)),
        SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
        Text(
          widget.description,
          textAlign: TextAlign.center,
          style: TextStyles.textStyleRegular
              .apply(color: AppColors.colorDialogDescription),
        ),
        SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
        _dayPicker(),
        SizedBox(height: ScreenConstant.defaultHeightSixteen),
        _timePicker(),
        SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.textMessage,
            textAlign: TextAlign.start,
            style: TextStyles.textStyleRegular.apply(color: Colors.black),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: TextFormField(
            controller: messageTextController,
            inputFormatters: <TextInputFormatter>[],
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                    horizontal: ScreenConstant.sizeMedium,
                    vertical: ScreenConstant.defaultHeightTwenty),
                hintText: "It’s time to meditate!",
                hintStyle:
                    TextStyles.textStyleRegular.apply(color: Colors.black)),
            textInputAction: TextInputAction.newline,
            maxLines: 4,
            minLines: 4,

            // maxLength: 100,
            // decoration: hintedInputDecoration(""),
          ),
        ),
        SizedBox(height: ScreenConstant.defaultHeightTen),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: ScreenConstant.defaultWidthOneForty,
              child: CustomElevatedButton2(
                text: "Cancel",
                buttonColor: AppColors.colorBtnCancel,
                onTap: () => Get.back(),
                textColor: Colors.white,
              ),
            ),
            SizedBox(
              width: ScreenConstant.defaultWidthOneForty,
              child: CustomElevatedButton2(
                text: "Save",
                buttonColor: AppColors.colorArrowButton,
                onTap: () {
                  setState(() {
                    Reminder saveReminder = Reminder(
                        day: _treatmentPlanController.selectedDay.value == null
                            ? widget.data.day
                            : _treatmentPlanController.selectedDay.value,
                        time:
                            _treatmentPlanController.selectedTime.value == null
                                ? widget.data.time
                                : _treatmentPlanController.selectedTime.value,
                        message: messageTextController.text);
                    Get.back(result: saveReminder);
                  });
                },
                textColor: Colors.white,
              ),
            )
          ],
        ),
        SizedBox(height: ScreenConstant.defaultHeightTwentyFour),
      ],
    );
  }

  _dayPicker() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            widget.textRemindMe,
            style: TextStyles.textStyleRegular.apply(color: Colors.black),
          ),
        ),
        Container(
          width: ScreenConstant.sizeSmall,
        ),
        Expanded(
          flex: 2,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            decoration: BoxDecoration(
                color: AppColors.colordropdownArrowBg,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: CustomDropdown<SelectOption>(
              value: widget.listOption.first.select.selectDefault.label == null
                  ? widget.data.day
                  : widget.listOption.first.select.selectDefault,
              dropdownMenuItemList:
                  buildDropList(widget.listOption.first.select.options),
              onChanged: (optionItem) {
                setState(() {
                  widget.data.day = optionItem.value;
                  widget.listOption.first.select.selectDefault = optionItem;
                });
              },
              isEnabled: true,
            ),
          ),
        )
      ],
    );
  }

  _timePicker() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: Text(widget.textTime,
              style: TextStyles.textStyleRegular.apply(color: Colors.black)),
        ),
        Container(
          width: ScreenConstant.sizeSmall,
        ),
        Expanded(
          flex: 2,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            decoration: BoxDecoration(
                color: AppColors.colordropdownArrowBg,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: CustomDropdown<String>(
              value: widget.data.time == null ? "01:00" : widget.data.time,
              dropdownMenuItemList: buildTimeDropList([
                "01:00",
                "02:00",
                "03:00",
                "04:00",
                "05:00",
                "06:00",
                "07:00",
                "08:00",
                "09:00",
                "10:00",
                "11:00",
                "12:00",
                "13:00",
                "14:00",
                "15:00",
                "16:00",
                "17:00",
                "18:00",
                "19:00",
                "20:00",
                "21:00",
                "22:00",
                "23:00",
                "24:00",
              ]),
              onChanged: (String optionItem) {
                setState(() {
                  widget.data.time = optionItem;
                });
              },
              isEnabled: true,
            ),
          ),
        )
      ],
    );
  }

  List<DropdownMenuItem<SelectOption>> buildDropList(
      List favouriteFoodModelList) {
    List<DropdownMenuItem<SelectOption>> items = [];
    for (SelectOption favouriteFoodModel in favouriteFoodModelList) {
      items.add(DropdownMenuItem(
        value: favouriteFoodModel,
        child: Text(
          favouriteFoodModel.label.tr,
          overflow: TextOverflow.ellipsis,
        ),
      ));
    }
    return items;
  }

  List<DropdownMenuItem<String>> buildTimeDropList(
      List favouriteFoodModelList) {
    List<DropdownMenuItem<String>> items = [];
    for (String favouriteFoodModel in favouriteFoodModelList) {
      items.add(DropdownMenuItem(
        value: favouriteFoodModel,
        child: Text(favouriteFoodModel.tr),
      ));
    }
    return items;
  }
}
