import 'package:flutter/material.dart';

class LeadingBackButton extends StatelessWidget {
  final Function() onPressed;

  const LeadingBackButton({Key key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator.canPop(context)
        ? IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 14,
              color: Color(0xffD94A7C),
            ),
            onPressed: onPressed)
        : Offstage();
  }
}
