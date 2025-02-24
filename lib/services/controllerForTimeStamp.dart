// //from https://www.youtube.com/watch?v=x2CoecrzBCA

import 'visitorTimeStamp.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ControllerForTimeStamp {
  final void Function(String) callback;
  /*
  static const String URL =
      "https://script.google.com/macros/s/AKfycbwDh23coA0b6JN2JIQY7lGfvhqOed3vDa6_zLlmWEQ-wUBDal_p5OmqjmdWbKHYTnsC/exec";
  */

  // new deployment as of 2024.11.11 - now adding location as well
  static const String URL =
      "https://script.google.com/macros/s/AKfycbwwbVHAKxsEcKI9KuZKijJ6kc2A-iWDjOJdOAol4ABUtTaGts-i4TdLGq-nWBUgLnkI/exec";
  static const STATUS_SUCCESS = "SUCCESS";

  ControllerForTimeStamp(this.callback);

  void submitTimeStampForm(VisitorTimeStampForm visitorTimeStampForm) async {
    try {
      await http
          .get(Uri.parse(URL + visitorTimeStampForm.toParams()))
          .then((response) {
        callback(convert.jsonDecode(response.body)['status']);
      });
    } catch (e) {
      print(e);
    }
  }
}
