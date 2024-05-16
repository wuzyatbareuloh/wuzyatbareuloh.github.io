
//from https://www.youtube.com/watch?v=x2CoecrzBCA

class FeedbackForm {
  String _email;
  String _signedUpWhen;

  FeedbackForm(this._email, this._signedUpWhen);

  String toParams() => "?email=$_email&signedUpWhen=$_signedUpWhen";
}
