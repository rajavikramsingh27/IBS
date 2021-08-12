import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ibs/utils/ScreenConstants.dart';
import 'package:flutter_ibs/utils/TextStyles.dart';

class CustomTextFormField extends StatelessWidget {
  final Function onTap;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final String hintText;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final FocusNode currentFocus;
  final FocusNode nextFocus;
  final bool obscureText;
  final List<TextInputFormatter> inputFormatters;
  final Function(String value) validationFunction;
  final Function(String value) onSavedFunction;
  final Function(String value) onchangedFunction;

  final bool readOnly;
  final TextEditingController controller;

  const CustomTextFormField(
      {Key key,
      this.textInputAction = TextInputAction.next,
      this.keyboardType = TextInputType.text,
      this.currentFocus,
      this.nextFocus,
      this.obscureText = false,
      this.controller,
      this.validationFunction,
      this.readOnly = false,
      this.inputFormatters,
      this.onSavedFunction,
      this.onchangedFunction,
      this.prefixIcon,
      this.hintText,
      this.onTap,
      this.suffixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        textAlignVertical: TextAlignVertical.bottom,
        enableInteractiveSelection: false,
        cursorColor: Colors.black,
        style: TextStyles.textStyleIntroDescription
            .apply(fontSizeFactor: 0.7, color: Colors.black87),
        onTap: onTap as void Function(),
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        obscureText: obscureText,
        maxLines: 1,
        readOnly: readOnly,
        focusNode: currentFocus,
        inputFormatters: inputFormatters,
        onEditingComplete: () =>
            FocusScope.of(context).requestFocus(nextFocus),
        controller: controller,
        validator: validationFunction as String Function(String),
        onSaved: onSavedFunction,
        onChanged: onchangedFunction,
        onFieldSubmitted: onSavedFunction,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.only(left: 20, bottom: 16),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintText: hintText,
          hintStyle:
              TextStyles.textStyleIntroDescription.apply(fontSizeFactor: 0.7),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.transparent,width: 0)
            
          ),

          isDense: true,

          // focusedBorder: OutlineInputBorder(
          //   borderSide: BorderSide(color: colorButtton, width: 1.0),
          // ),
          // enabledBorder: OutlineInputBorder(
          //   borderSide: BorderSide(color: Colors.grey[50], width: 1.0),
          // ),
          // errorBorder: UnderlineInputBorder(
          //   borderSide: BorderSide(color: colorButtton),
          // ),
        ));
  }
}

InputDecoration hintedInputDecoration(String hint) {
  return InputDecoration(
    hintText: hint,
// suffixIcon: Icon(Icons.arrow_drop_down,),
    border: UnderlineInputBorder(
        borderSide:
            new BorderSide(color: Colors.black, style: BorderStyle.solid)),
    isDense: true,
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue[900], width: 1.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xffE5E5E5), width: 1.0),
    ),
    errorBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.blue[900]),
    ),
  );
}
