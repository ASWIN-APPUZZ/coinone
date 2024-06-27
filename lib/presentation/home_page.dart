import 'package:coinone/domain/controller/home_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api/base_url.dart';
import '../api/firebase_options.dart';
import '../core/themes/constants.dart';
import '../routes/route.dart';

class HomePage extends StatelessWidget {
  final AuthService _authService = AuthService();
  HomeController controller = Get.put(HomeController());
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstants().home),
        actions: [IconButton(onPressed: (() => _authService.signOut), icon:  Icon(Icons.exit_to_app))],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.categories.isEmpty) {
          return Center(child: Text(AppConstants().nocate));
        } else {
          return GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: controller.categories.length,
            itemBuilder: (context, index) {
              final category = controller.categories[index];
              return GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.DETAIL, arguments: category.id);
                },
                child: Card(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Image.network('$baseURL/${category.imgUrlPath}'),
                        Text(category.name),
                      ],
                    ),
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
