import 'package:get/get.dart';
import 'package:practice/firebase/homeScreen/homeScreen.dart';
import 'package:practice/firebase/homeScreen/sreach.dart';
import 'package:practice/firebase/homeScreen/user.dart';

class BottomNavBarController extends GetxController {
  RxInt index = 0.obs;

  var pages = [
    const HomePage(),
    const Sreach(),
    const Settings(),
  ];
}
