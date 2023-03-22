import 'package:database_auth/screens/project_resources/import_resources.dart';
import 'package:database_auth/screens/project_resources/project_resources.dart';

final List<GetPage<dynamic>> routes = [
  GetPage(name: "/SplashScreen", page: () => const SplashScreen()),
  GetPage(name: "/GetStartPage", page: () => const GetStartPage()),
  GetPage(name: "/GetStartPage", page: () =>  LoginScreen()),
  GetPage(name: "/GetStartPage", page: () =>  SignUpScreen()),
];
