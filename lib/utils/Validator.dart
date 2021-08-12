class Validator {

  String validateEmail(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern as String);
    if (email == null || email.isEmpty)
      return 'Enter Email';
    else if (!regex.hasMatch(email))
      return 'Enter Valid Email';
    else
      return null;
  }

  String validatePassword(String password) {
    if (password == null || password.isEmpty)
      return 'Enter Password';
    else if (password.length < 6)
      return 'Password should be 6 character';
    else
      return null;
  }

  String validateConfirmPassword(String password, String cPassword) {
    if (cPassword == null || cPassword.isEmpty)
      return 'Enter Confirm Password';
    else if (cPassword != password)
      return "Confirm password doesn't match with Password";
    else
      return null;
  }

  String textFieldValidation(String value, String msg) {
    Pattern pattern = r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-.]';
    RegExp regex = new RegExp(pattern as String);
    if (value == null || value.isEmpty)
      return msg ?? "Enter text";
    else if (regex.hasMatch(value))
      return "Invalid Text";
    else if (value.length < 3)
      return msg;
    else
      return null;
  }

  String emptyFieldValidation(String value, String msg) {
    Pattern pattern = r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-.]';
    RegExp regex = new RegExp(pattern as String);
    print("$regex");
    if (value == null || value.isEmpty)
      return msg ?? "Enter text";
    else if (value.length < 3)
      return msg;
    else
      return null;
  }

  String validateMobile(String value) {
    String pattern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value == null || value.isEmpty)
      return 'Enter Mobile Number';
    else if (!regExp.hasMatch(value))
      return "Enter a Valid Number";
    else if (value.length != 11)
      return "Enter a valid Mobile number";
    else
      return null;
  }

  String validateEmailAndMobile(String value) {
    if (value.isEmpty) {
      return "Enter Email/Mobile";
    } else if (value.length > 3) {
      if (isNumeric(value)) {
        return validateMobile(value);
      } else {
        return validateEmail(value);
      }
    } else {
      return null;
    }
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    try {
      return double.parse(s) != null;
    } catch (e) {
      print("Error: $e");

      return false;
    }
  }
}
