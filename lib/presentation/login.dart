// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../core/constants.dart';
// import '../controllers/login.controller.dart';
// import '../widgets/carousel_slider_widget.dart';
// import '../widgets/login_form_widget.dart';
// import '../widgets/logo_image_widget.dart';

// final formkey = GlobalKey<FormState>();
// class LoginScreen extends GetView<LoginController> {
//  const LoginScreen({super.key});
//   // final ApiService apiService = Get.find<ApiService>();
//    @override
//   Widget build(BuildContext context) {
//   //   // Async function to get token before returning the Scaffold
//   //   Future<void> initializeToken() async {
//   //     await apiService.getToken();
//   //   }

//     // Call the initializeToken function before returning the Scaffold
//     //initializeToken();
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.only(left: 20, right: 20),
//           child: SingleChildScrollView(
//             child: SizedBox(
//               height: MediaQuery.of(context).size.height+30,
//               child: Column(
//                 children: [
//                   const LogoImageWidget(),
//                   const CarouselSliderWidget(
//                       imageAssetPaths: CarouselImages.loginImages),
//                   LoginFormWidget(controller: controller, formkey: formkey),
//                   // const SizedBox(height: 10)
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
