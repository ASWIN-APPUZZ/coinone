import 'package:coinone/presentation/login.dart';
import 'package:coinone/presentation/register.dart';
import 'package:get/get.dart';

import '../presentation/detailed_page.dart';
import '../presentation/home_page.dart';




class Routes {
  static const SIGNIN = '/signin';
  static const SIGNUP = '/signup';
  static const HOME = '/home';
  static const DETAIL = '/detail';
}

class AppPages {
  static final pages = [
    GetPage(name: Routes.SIGNIN, page: () => signInPage()),
    GetPage(name: Routes.SIGNUP, page:() => SignupPage()),
    GetPage(name: Routes.HOME, page: () => HomePage()),
    GetPage(name: Routes.DETAIL, page: () => DetailPage()),
  ];
}