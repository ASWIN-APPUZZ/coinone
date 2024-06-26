import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../models/sub_category.dart';

class DetailController extends GetxController {
  var isLoading = true.obs;
  var subCategories = <TemplateSubCategory>[].obs;

  void fetchSubCategories(String categoryId) async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse('https://coinoneglobal.in/teresa_trial/webtemplate.asmx/FnGetTemplateSubCategoryList?PrmCmpId=1&PrmBrId=2&PrmCategoryId=$categoryId'));
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        subCategories.value = (jsonData as List).map((i) => TemplateSubCategory.fromJson(i)).toList();
      }
    } catch (e, stack) {
      log('error $e ----- ,stack $stack');
    } finally {
      isLoading(false);
    }
  }
}