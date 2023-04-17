import '../../resources/import_resources.dart';
import 'package:ecommerce/screens/screens.dart';

final List<GetPage<dynamic>> routes = [
  GetPage(name: "/SplashScreen", page: () => const SplashScreen()),
  GetPage(name: "/SearchProduct", page: () => SearchProduct()),
  GetPage(name: "/ProfileWishListScreen", page: () => ProfileWishListScreen()),
  GetPage(name: "/SelectLanguage", page: () => SelectLanguage()),
  GetPage(
      name: "/ProfileShoppingCart", page: () => const ProfileShoppingCart()),
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
      name: "/Categories",
      page: () => Categories(),
      transition: Transition.leftToRight,
      transitionDuration: const Duration(milliseconds: 250)),
  GetPage(
      name: "/CartDelivery",
      page: () => CartDelivery(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 250)),
  GetPage(
      name: "/TrackingProduct",
      page: () => TrackingProduct(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 250)),
  GetPage(
    name: "/AddPaymentScreen",
    page: () => AddPaymentScreen(),
  ),
  GetPage(
      name: "/PaymentScreen",
      page: () => PaymentScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 250)),
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
      page: () => Forget(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 450)),
  GetPage(
      name: "/FilterScreen",
      page: () => const FilterScreen(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 250)),
];
