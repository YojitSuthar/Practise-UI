import 'package:database_auth/Screens/project_resources/project_resources.dart';
import 'package:database_auth/provider/validation_provider/singin_validation.dart';
import 'package:flutter/material.dart';
import 'package:database_auth/screens/project_resources/import_resources.dart';
import 'provider/button_color/button_color.dart';
import 'provider/validation_provider/signup_validation.dart';
import 'resources/resources.dart';

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
