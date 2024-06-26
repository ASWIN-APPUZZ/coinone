import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api/base_url.dart';
import '../core/themes/constants.dart';
import '../domain/controller/detailed_controller.dart';
import '../models/sub_category.dart';

class DetailPage extends GetView<DetailController> {
  // final DetailController detailController = Get.put(DetailController());

  @override
  Widget build(BuildContext context) {
    final String categoryId = Get.arguments;

    controller.fetchSubCategories(categoryId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.subCategories.isEmpty) {
          return Center(child: Text(AppConstants().subcate + AppConstants().notfound));
        } else {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: controller.subCategories.length,
            itemBuilder: (context, index) {
              final TemplateSubCategory subCategory = controller.subCategories[index];
              return Card(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.network('$baseURL/${subCategory.imgUrlPath}'),
                      Text(subCategory.name),
                    ],
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}