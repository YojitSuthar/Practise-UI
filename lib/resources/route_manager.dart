import '../../resources/import_resources.dart';
import 'package:ecommerce/screens/screens.dart';

final List<GetPage<dynamic>> routes = [
  GetPage(name: "/SplashScreen", page: () => const SplashScreen()),
  GetPage(name: "/ProductDetailsView", page: () =>  ProductDetailsView()),
  GetPage(
      name: "/GetStartPage",
      page: () => const OnBordingScreen(),
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
  GetPage(
      name: "/HomePage",
      page: () => const MainScreen(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 450)),
  GetPage(name: "/UserProfile", page: () => UserProfile()),
  GetPage(
      name: "/ForgetPassword",
      page: () =>  Forget(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 450)),
  GetPage(
      name: "/FilterScreen",
      page: () => const FilterScreen(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 250)),
];
