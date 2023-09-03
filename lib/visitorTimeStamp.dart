//from https://www.youtube.com/watch?v=x2CoecrzBCA

class VisitorTimeStampForm {
  String _visitedWhen;
  //String _fromWhere;

  VisitorTimeStampForm(this._visitedWhen);

  String toParams() => "?visitedWhen=$_visitedWhen";
}
