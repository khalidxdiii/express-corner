import 'package:get/get.dart';

validinput(
    {required String val,
    required int min,
    required int max,
    required String type}) {
  // if (type == "username") {
  //   if (!GetUtils.isUsername(val)) {
  //     return "برجاء كتابة اسم المستخدم";
  //   }
  // }

  if (type == "username") {
    if (val.isEmpty) {
      return "برجاء كتابة اسم المستخدم";
    }
  }

  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "برجاء كتابة البريد الالكترونى";
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "برجاء كتابة رقم الهاتف";
    }
  }

  if (type == "num") {
    if (!GetUtils.isNum(val)) {
      return "not Valid num";
    }
  }
  if (type == "age") {
    if (!GetUtils.isNum(val)) {
      return "برجاء كتابة السن";
    }
  }
  if (type == "cash") {
    if (!GetUtils.isNum(val)) {
      return "برجاء كتابة المبلغ التقديرى للاوردر";
    }
  }

  if (type == "gender") {
    if (val.isEmpty) {
      return "برجاء اختيار النوع";
    }
  }

  if (type == "gov") {
    if (val.isEmpty) {
      return "برجاء اختيار المحافظة";
    }
  }

  if (type == "city") {
    if (val.isEmpty) {
      return "برجاء اختيار المدينة";
    }
  }

  if (type == "text") {
    if (val.isEmpty) {
      return "لايمكن ترك الحقل فارغ";
    }
  }

  if (val.isEmpty) {
    return "لا يمكن ترك الحقل فارغ";
  }

  if (val.length < min) {
    return "can't be less than $min";
  }

  if (val.length > max) {
    return "can't be less than $min";
  }
}
