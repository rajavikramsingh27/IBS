import 'package:flutter/material.dart';
import 'package:flutter_ibs/models/response_model/TrackablesListModel.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';

class DropListModel {
  DropListModel(this.listSelectOptions);

  final List<SelectOption> listSelectOptions;
}

class SelectDropList extends StatefulWidget {
  final SelectOption itemSelected;
  final List<SelectOption> listSelectOptions;
  final Function(SelectOption selectOptionFn) onOptionSelected;

  SelectDropList(this.itemSelected, this.listSelectOptions, this.onOptionSelected,);

  @override
  _SelectDropListState createState() =>
      _SelectDropListState(itemSelected, listSelectOptions);
}

class _SelectDropListState extends State<SelectDropList>
    with SingleTickerProviderStateMixin {
  SelectOption optionSelected;
  final List<SelectOption> listSelectOptions;

  AnimationController expandController;
  Animation<double> animation;

  bool isShow = false;

  _SelectDropListState(this.optionSelected, this.listSelectOptions);

  @override
  void initState() {
    super.initState();
    expandController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 350));
    animation = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );
    _runExpandCheck();
  }

  void _runExpandCheck() {
    if (isShow) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: Wrap(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  this.isShow = !this.isShow;
                  _runExpandCheck();
                  setState(() {});
                },
                child: Text(
                  optionSelected?.label ?? "",
                ),
              )),
              Align(
                alignment: Alignment(1, 0),
                child: Icon(
                  isShow ? Icons.keyboard_arrow_down_outlined : Icons.keyboard_arrow_right_outlined,
                  size: 20,
                ),
              ),
            ],
          ),
          SizeTransition(
              axisAlignment: 1.0,
              sizeFactor: animation,
              child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.only(bottom: 10),
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 4,
                          color: Colors.black26,
                          offset: Offset(0, 4))
                    ],
                  ),
                  child: _buildDropListOptions(
                      listSelectOptions ?? [SelectOption(value: null, label: "")],
                      context))),
//          Divider(color: Colors.grey.shade300, height: 1,)
        ],
      ),
    );
  }

  Column _buildDropListOptions(List<SelectOption> items, BuildContext context) {
    return Column(
      children: items.map((item) => _buildSubMenu(item, context)).toList(),
    );
  }

  Widget _buildSubMenu(SelectOption item, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 26.0, top: 5, bottom: 5),
      child: GestureDetector(
        child: Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.grey[200], width: 1)),
              ),
              child: Text(item.label,
                  maxLines: 3,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis),
            ),
          ],
        ),
        onTap: () {
            this.optionSelected = item;
            isShow = false;
            expandController.reverse();
            widget.onOptionSelected(item);
        },
      ),
    );
  }
}
