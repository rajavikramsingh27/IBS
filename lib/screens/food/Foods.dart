import 'package:flutter/material.dart';
import 'package:flutter_ibs/controllers/food/FoodController.dart';
import 'package:flutter_ibs/controllers/trackables/TrackablesController.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:flutter_ibs/widget/CustomArcPainter.dart';
import 'package:flutter_ibs/widget/CustomElevatedButton.dart';
import 'package:flutter_ibs/widget/DateTimeCardWidget.dart';
import 'package:flutter_ibs/widget/ScreenControls/RenderWidgetByType.dart';
import 'package:flutter_ibs/widget/WavePainter.dart';
import 'package:get/get.dart';

class Foods extends StatelessWidget {
  final TrackablesListModel trackFoodList;

  Foods({Key key, this.trackFoodList}) : super(key: key);

  final FoodController controller = Get.find();
  final TrackablesController _trackablesController = Get.find();

  @override
  Widget build(BuildContext context) {
    //print("model:$trackFoodList");

    return Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: _trackablesController.loader.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(height: ScreenConstant.defaultHeightTen),
                    controller.loader.value
                        ? Offstage()
                        : CustomElevatedButton(
                            widthFactor: 0.7,
                            text: "Save",
                            onTap: controller.onSave,
                          ),
                    TextButton(
                        onPressed: controller.onCancel,
                        child: Text("Cancel",
                            style: TextStyles.textStyleIntroDescription.apply(
                              color: AppColors.colorskip_also_proceed,
                            )))
                  ],
                ),
              ),
        backgroundColor: Color(0xff1A103E).withOpacity(0.6),
        body: Obx(
          () => ListView(
            physics: ClampingScrollPhysics(),
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: ScreenConstant.defaultHeightOneThirty),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: ScreenConstant.defaultHeightTwenty),
                      child: Card(
                        margin: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        )),
                        child: Column(
                          children: [
                            SizedBox(height: ScreenConstant.defaultHeightSixty),
                            Text(
                              _trackablesController.foods.value.header.tr,
                              style: TextStyles.textStyleIntroDescription.apply(
                                  color: Colors.black, fontSizeDelta: -2),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: ScreenConstant.defaultHeightForty),
                            DateTimeCardWidget(),
                            SizedBox(height: ScreenConstant.defaultHeightForty),
                            Text(
                              _trackablesController
                                  .foods.value.items.first.name.tr,
                              style: TextStyles.textStyleIntroDescription.apply(
                                  color: Colors.black, fontSizeDelta: -2),
                              textAlign: TextAlign.center,
                            ),
                            _buildMealList(controller.formWidgetList.first),

                            controller.loader.value
                                ? Center(
                                    child: Padding(
                                    padding: ScreenConstant.spacingAllLarge,
                                    child: Container(
                                        height:
                                            ScreenConstant.screenHeightThird,
                                        child: Center(
                                            child:
                                                CircularProgressIndicator())),
                                  ))
                                : //RenderItemChildrenWidget(trackableItem:controller.formWidgetList.first),
                                controller.formWidgetList.first.list.value !=
                                        null
                                    ? _renderFoodGroup(controller
                                        .formWidgetList.first.list.value)
                                    : Offstage(),
                            // Render hydration:
                            RenderWidgetByType().renderTrackableItem(
                                controller.formWidgetList[
                                    controller.formWidgetList.length - 2],
                                isLast: true,
                                onValueChanged: controller.valueChanged,
                                onValueRemoved: controller.onValueRemoved),
                            //Render text input:
                            RenderWidgetByType().renderTrackableItem(
                                controller.formWidgetList.last,
                                onValueChanged: controller.valueChanged,
                                onValueRemoved: controller.onValueRemoved),
                            Container(
                              height: 70,
                              child: Stack(children: [
                                Positioned.fill(
                                  bottom: 0,
                                  child: _buildWavePainter(),
                                ),
                              ]),
                            ),
                            Text(
                              "For best results track your food every day.",
                              textAlign: TextAlign.center,
                              style: TextStyles.textStyleRegular,
                            ),
                            SizedBox(
                                height: ScreenConstant.defaultHeightTwenty),
                            Text(
                              '''Click “Save” to log your results''',
                              textAlign: TextAlign.center,
                              style: TextStyles.textStyleRegular,
                            ),
                            SizedBox(height: ScreenConstant.defaultHeightForty)
                          ],
                        ),
                      ),
                    ),
                    Positioned(right: 0, left: 0, child: CustomArcPainter())
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  /// HACK: We're hard-coding the food selection list to save some time.
  _buildMealList(TrackableItem foodParent) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenConstant.defaultHeightForty * 1.2,
          vertical: ScreenConstant.defaultHeightTwentyFour),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: foodParent.list?.options?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        //controller.mealOptionDefault(mealIndex: index);
        var model = foodParent.list?.options[index];

        return InkWell(
          onTap: () {
            controller.formWidgetList.first.list.options.forEach((element) {
              if (element.selected) {
                element.selected = false;
              }
            });
            model.selected = true;
            controller.formWidgetList.first.list.value = model;
            controller.formWidgetList.refresh();
          },
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    // ((endTime.difference(u).inSeconds) > 0 &&
                    //         (u.difference(startTime).inSeconds) > 0)
                    //     ? model.image.active
                    model.selected ? model.image.active : model.image.normal,
                  ),
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.colorBorder, width: 1)),
            child: Stack(
              children: [
                Positioned(
                  bottom: ScreenConstant.sizeLarge,
                  left: 0,
                  right: 0,
                  child: Text(
                    model.label.tr ?? "",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.textStyleRegular.apply(
                        color: model.selected ? Colors.white : Colors.black,
                        fontSizeDelta: 2),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          crossAxisCount: 2,
          childAspectRatio: 1.2),
    );
  }

  _renderFoodGroup(ListOption option) {
    TrackableItem item;

    switch (option.value) {
      case "breakfast":
        item = controller.formWidgetList.first.children[0].items[0];
        return RenderWidgetByType().renderTrackableItem(item,
            isFirst: true,
            isLast: true,
            onValueChanged: controller.valueChanged,
            onValueRemoved: controller.onValueRemoved);
      case "lunch":
        item = controller.formWidgetList.first.children[1].items[0];
        return RenderWidgetByType().renderTrackableItem(item,
            isFirst: true,
            isLast: true,
            onValueChanged: controller.valueChanged,
            onValueRemoved: controller.onValueRemoved);
      case "dinner":
        item = controller.formWidgetList.first.children[2].items[0];
        return RenderWidgetByType().renderTrackableItem(item,
            isFirst: true,
            isLast: true,
            onValueChanged: controller.valueChanged,
            onValueRemoved: controller.onValueRemoved);
      case "snacks":
        item = controller.formWidgetList.first.children[3].items[0];
        return RenderWidgetByType().renderTrackableItem(item,
            isFirst: true,
            isLast: true,
            onValueChanged: controller.valueChanged,
            onValueRemoved: controller.onValueRemoved);
      default:
        return Offstage();
    }
  }

  _buildWavePainter() {
    return Container(
      margin:
          EdgeInsets.only(bottom: 30), //ScreenConstant.defaultHeightSeventy),
      width: Get.context.mediaQuerySize.width,
      child: CustomPaint(
        size: Size(Get.context.mediaQuerySize.width, 52),
        painter: WavePainter(),
      ),
    );
  }
}
