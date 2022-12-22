import 'package:get/get.dart';
import 'package:function_tree/function_tree.dart';

class HomeController extends GetxController {
  var text = "".obs;
  var hasil = "".obs;
  void changeText(String data) {
    try {
      if (data == 'Clear') {
        print(text.substring(0, text.value.length - 1));
        text.value = text.substring(0, text.value.length - 1);
        hasil.value = "";
      } else if (data == 'AllClear') {
        text.value = "";
        hasil.value = "";
      } else {
        text.value = text.value + data;
      }
    } catch (err) {}
  }

  void eksekusi() {
    try {
      print(text);
      hasil.value = "${text.value.interpret()}";
    } catch (err) {}
  }
}
