import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IneternetController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    _connectivity.onConnectivityChanged.listen(netStatus);
    super.onInit();
  }

  netStatus(ConnectivityResult cr) {
    if (cr == ConnectivityResult.none) {
      // Get.rawSnackbar(
      //     title: "No Internet",
      //     message: "Connect to Internet",
      //     icon: Icon(
      //       Icons.wifi_off,
      //       color: Colors.white,
      //     ),
      //     isDismissible: true,
      //     duration: Duration(days: 1),
      //     shouldIconPulse: true);
      Get.rawSnackbar(
          titleText: SizedBox(
            width: double.infinity,
            height: Get.height * (.954),
            child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Icon(
                      Icons.wifi_off,
                      size: 120,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "No Internet Connection",
                    style: TextStyle(fontSize: 25),
                  )
                ]),
          ),
          messageText: Container(),
          backgroundColor: Colors.black,
          isDismissible: false,
          duration: const Duration(days: 1));
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }
}
