import 'package:ecommerce/screens/home_screen/home_screen.dart';
import 'package:ecommerce/resources/import_resources.dart';
import '../screens/filtering_screen/filter_screen.dart';
import '../screens/forget_password/forget_password.dart';
import '../screens/login_screen/login_screen.dart';
import '../screens/onboarding_screen/onbording_screen.dart';
import '../screens/signup_screen/signup_screen.dart';
import '../screens/splash_screen/splash_screen.dart';
import '../screens/user_profile_screen/user_profile.dart';

final List<GetPage<dynamic>> routes = [
  GetPage(name: "/SplashScreen", page: () => const SplashScreen()),
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
      page: () => MainScreen(),
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
