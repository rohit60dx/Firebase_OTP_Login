import 'package:get/get.dart';
import 'package:practice/API/model/model.dart';

class getDataController extends GetxController {
  final RxList<model> dataList = <model>[].obs;
  final RxBool isLoading = false.obs;
  final Rx<model> DataModel = model().obs;
}
