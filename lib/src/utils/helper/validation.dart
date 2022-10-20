////////////
class Validators {
  static String? validateName(String? value) {
    String text = value ?? '';
    String pattern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = RegExp(pattern);
    if (text.isEmpty) {
      return "User Name is Required";
    } else if (!regExp.hasMatch(text)) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    String text = value ?? '';
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (text.isEmpty) {
      return "Email is Required";
    } else if (!regExp.hasMatch(text)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  static String? validateMobile(String? value) {
    String text = value ?? '';
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = RegExp(patttern);
    if (text.isEmpty) {
      return "Mobile is Required";
    } else if (text.length != 10) {
      return "Mobile number must 10 digits";
    } else if (!regExp.hasMatch(text)) {
      return "Mobile Number must be digits";
    }
    return null;
  }
}
