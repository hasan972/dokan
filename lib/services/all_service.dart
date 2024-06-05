import 'package:dokan/widget/my_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
class AllService {
    void toastMessage(String msg, double fontSize) {
    Fluttertoast.showToast(
      backgroundColor: MyColors().mainColor,
      textColor: MyColors().white,
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      fontSize: fontSize,
    );
  }
}