import 'package:ecommerce/provider/theme_mode.dart';
import 'package:ecommerce/provider/toggle_provider.dart';
import 'package:ecommerce/screens/filtering_screen/provider/range_slider.dart';
import 'package:flutter/material.dart';
import 'main_resources.dart';
import 'provider/absorbing.dart';

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
              ChangeNotifierProvider(create: (context) => Absorbing()),
              ChangeNotifierProvider(create: (context) => ThemeChange()),
              ChangeNotifierProvider(create: (context) => RangeSlide()),
              ChangeNotifierProvider(create: (context) => Toggle()),
            ],
            child: Consumer<ThemeChange>(
              builder: (context, value, child) {
                return GetMaterialApp(
                    theme: ThemeData(
                      fontFamily: "Mukta",
                    ),
                    darkTheme: ThemeData(
                      brightness: Brightness.dark,
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
