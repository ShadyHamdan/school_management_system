// import 'package:get/get.dart';

validInput(var val, int min, int max, String type) {
  if (val.isEmpty) {
    return " cannot be Empty ";
  }
  if (val.length < min) {
    return " cannot be less than  $min";
  }
  if (val.length > max) {
    return " cannot be larger than $max";
  }

  // if (type == "Phone") {
  //   if (!GetUtils.isPhoneNumber(val)) {
  //     return "not valid Phone";
  //   }
  // }
  // if (type == "username") {
  //   if (!GetUtils.isUsername(val)) {
  //     return "not valid username";
  //   }
  // }
}
