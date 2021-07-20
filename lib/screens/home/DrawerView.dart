import 'package:flutter/material.dart';
import 'package:flutter_ibs/utils/Assets.dart';
import 'package:flutter_ibs/utils/Colors.dart';

class DrawerView extends StatefulWidget {
  @override
  _DrawerViewState createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {
  TextStyle styleNavMenu =
      TextStyle(color: Colors.black87, fontSize: 14, fontFamily: 'Poppins');

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 16.0,
      child: SingleChildScrollView(
        child: Container(
            decoration: BoxDecoration(color: AppColors.colorBackground),
            child: Column(
              children: <Widget>[
                _buildDrawerMenu(context),
              ],
            )),
      ),
    );
  }

  _buildMenuItem(String text, Widget icon, GestureTapCallback onTapCallback) {
    return ListTile(
        dense: true,
        leading: icon,
        title: Text(text, style: styleNavMenu),
        onTap: onTapCallback);
  }

  _buildDrawerMenu(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        color: Colors.white,
        height: 150,
        child: Center(
            child: Image.asset(
          Assets.book,
          height: 100,
        )),
      ),
      _buildMenuItem(
          'My Profile',
          Image.asset(
            Assets.book,
            height: 22,
            color: Colors.black,
          ),
          () {}),
      Divider(height: 1.0, color: Colors.grey),
    ]);
  }
}
