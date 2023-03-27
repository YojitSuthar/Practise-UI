import 'package:database_auth/screens/project_resources/import_resources.dart';
import 'package:database_auth/screens/project_resources/project_resources.dart';

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
  GetPage(name: "/HomePage", page: () => HomeScreen()),
];
