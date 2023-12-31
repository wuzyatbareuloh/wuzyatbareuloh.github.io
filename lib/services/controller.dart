// //from https://www.youtube.com/watch?v=x2CoecrzBCA

import './feedback_form.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class FormController {
  final void Function(String) callback;

  static const String URL =
      "https://script.google.com/macros/s/AKfycbwOBUspIWotmpGtSmQKLgDfY4fJEXiZFHhj7v6WBLeZ-Aj7fqiKf_XwcUGwREWO3-Lt/exec";

  static const STATUS_SUCCESS = "SUCCESS";

  FormController(this.callback);

  void submitForm(FeedbackForm feedbackForm) async {
    try {
      await http.get(Uri.parse(URL + feedbackForm.toParams())).then((response) {
        callback(convert.jsonDecode(response.body)['status']);
      });
    } catch (e) {
      print(e);
    }
  }
}
