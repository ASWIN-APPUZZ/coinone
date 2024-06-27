import 'package:get/get.dart';

import '../../core/themes/colors.dart';

class SnackbarWidget {
  static void showSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: AppColors().colorBlack,
      colorText: AppColors().colorWhite,
      duration: const Duration(seconds: 3),
    );
  }
}