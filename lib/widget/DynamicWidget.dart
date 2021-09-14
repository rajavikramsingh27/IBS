import 'package:flutter/material.dart';
import 'package:flutter_ibs/models/TrackablesListModel/TrackablesListModel.dart';
import 'package:flutter_ibs/utils/Colors.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';
import 'package:get/get.dart';

import 'AdditionalNoteWidget.dart';
import 'DropDownList.dart';

class DynamicWidget extends StatelessWidget {
  final List<dynamic> data;
  final GetxController controller;
  DynamicWidget({this.data,this.controller});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (BuildContext context,int index){
          switch(data[index].kind) {
            case "textInput": {
              return AdditionalNoteWidget(bottomText: "",messageText: data[index].name,hintText: "It's time to...",);
            }
            break;

            case "timePicker": {
              return ListTile(
                  leading: Icon(Icons.list),
                  trailing: Text("GFG",
                    style: TextStyle(
                        color: Colors.green,fontSize: 15),),
                  title:Text("List item $index")
              );
            }
            break;
            case "select": {
              return Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(data[index].name, style: TextStyles.textStyleIntroDescription.apply(color: Colors.white, fontSizeDelta: -6)),
                  ),
                  Container(
                    width: ScreenConstant.sizeSmall,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      decoration: BoxDecoration(color: AppColors.colordropdownArrowBg, borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: CustomDropdown<SelectOption>(
                        value: data[index].select.selectDefault.label == null?data[index].select.options.first:data[index].select.selectDefault,
                        dropdownMenuItemList: buildDropList(data[index].select.options),
                        onChanged: (optionItem) {
                          data[index].select.selectDefault = optionItem;
                        },
                        isEnabled: true,
                      ),
                    ),
                  )
                ],
              );
            }
            break;

            default: {
              return Offstage();
            }
            break;
          }
        }
    );
  }

  List<DropdownMenuItem<SelectOption>> buildDropList(
      List favouriteFoodModelList) {
    List<DropdownMenuItem<SelectOption>> items = [];
    for (SelectOption favouriteFoodModel in favouriteFoodModelList) {
      items.add(DropdownMenuItem(
        value: favouriteFoodModel,
        child: Text(
          favouriteFoodModel.label,
          overflow: TextOverflow.ellipsis,
        ),
      ));
    }
    return items;
  }
}
