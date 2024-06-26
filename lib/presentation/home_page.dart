// import 'package:coinone/core/themes/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../api/base_url.dart';
// import '../domain/controller/home_controller.dart';
// import '../routes/route.dart';

// class HomePage extends GetView<HomeController> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(AppConstants().home),
//       ),
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (controller.categories.isEmpty) {
//           return Center(child: Text(AppConstants().nocate));
//         } else {
//           return GridView.builder(
//             gridDelegate:
//                 SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//             itemCount: controller.categories.length,
//             itemBuilder: (context, index) {
//               final category = controller.categories[index];
//               return GestureDetector(
//                 onTap: () {
//                   Get.toNamed(Routes.DETAIL, arguments: category.id);
//                 },
//                 child: Card(
//                   child: SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         Image.network('$baseURL/${category.imgUrlPath}'),
//                         Text(category.name),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           );
//         }
//       }),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../api/base_url.dart';
import '../core/themes/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;

  signout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppConstants().home),
        ),
        body: Column(
          children: [
            // Image.network('$baseURL/${category.imgUrlPath}'),
            Text('${user!.email}')
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: (()=>signout), child: const Icon(Icons.exit_to_app),),
        
        );
  }
}
