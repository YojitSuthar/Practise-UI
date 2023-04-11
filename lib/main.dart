import 'package:ecommerce/screens/filtering_screen/provider/range_slider.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/provider/provider_resources.dart';
import 'screens/home_screen/provider/bottum_navigation/bottum_navigation.dart';
import 'screens/login_screen/provider/singin_validation.dart';
import 'screens/productdetail_screen/provider/page_index.dart';
import '../../resources/resources.dart';
import '../../resources/import_resources.dart';
import 'screens/signup_screen/provider/signup_validation.dart';
import 'package:ecommerce/screens/screens.dart';


class Myapp extends StatelessWidget {
  Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (context) => SignInValidation()),
              ChangeNotifierProvider(create: (context) => SignUpValidation()),
              ChangeNotifierProvider(create: (context) => ChangeColor()),
              ChangeNotifierProvider(create: (context) => BottumNavigation()),
              ChangeNotifierProvider(create: (context) => ThemeChange()),
              ChangeNotifierProvider(create: (context) => RangeSlide()),
              ChangeNotifierProvider(create: (context) => Toggle()),
              ChangeNotifierProvider(create: (context) => PageIndex()),
              ChangeNotifierProvider(create: (context) => ProductData())
            ],
            child: Consumer<ThemeChange>(
              builder: (context, value, child) {
                return GetMaterialApp(
                    theme: ThemeData(
                      scaffoldBackgroundColor: ColorManager.whiteColor,
                      fontFamily: "Mukta",
                    ),
                    darkTheme: ThemeData(
                      scaffoldBackgroundColor: ColorManager.blackColor,
                      brightness: Brightness.dark,
                      fontFamily: "Mukta",
                    ),
                    themeMode:
                        value.isDarkMode ? ThemeMode.dark : ThemeMode.light,
                    debugShowCheckedModeBanner: false,
                    home: const SplashScreen(),
                    getPages: routes);
              },
            ));
      },
    );
  }
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Myapp());
}
