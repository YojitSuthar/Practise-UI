import 'package:flutter/material.dart';
import 'main_resources.dart';
import 'provider/absorbing.dart';

class Myapp extends StatelessWidget {
  const Myapp({super.key});
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
          ],
          child: GetMaterialApp(
              theme: ThemeData(
                fontFamily: "Mukta",
              ),
              debugShowCheckedModeBanner: false,
              home: const SplashScreen(),
              getPages: routes),
        );
      },
    );
  }
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Myapp());
}
