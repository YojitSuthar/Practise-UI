import 'package:ecommerce/screens/home_screen/home_screen.dart';
import 'package:ecommerce/resources/import_resources.dart';
import '../screens/get_startPage/get_startScreen.dart';
import '../screens/login_page/login_screen.dart';
import '../screens/signup_page/signup_screen.dart';
import '../screens/splash_Page/splash_screen.dart';

final List<GetPage<dynamic>> routes = [
  GetPage(name: "/SplashScreen", page: () => const SplashScreen()),
  GetPage(
      name: "/GetStartPage",
      page: () => const GetStartPage(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 450)),
  GetPage(
      name: "/LoginPage",
      page: () => LoginScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 450)),
  GetPage(
      name: "/SignUp",
      page: () => SignUpScreen(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 450)),
  GetPage(name: "/HomePage", page: () => MainScreen()),
];
