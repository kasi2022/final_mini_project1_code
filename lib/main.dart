import 'package:flutter/material.dart';
import 'package:keerthi_ram_flutter_app/Provider/service_provider.dart';
import 'package:keerthi_ram_flutter_app/model/constants.dart';
import 'package:keerthi_ram_flutter_app/views/SplashScreen.dart';
import 'package:keerthi_ram_flutter_app/views/user_dashbord_screen.dart';
import 'package:keerthi_ram_flutter_app/views/user_sigin.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => ServiceProvider())
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Task',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: kPrimaryColor,
            scaffoldBackgroundColor: const Color.fromARGB(255, 247, 240, 240),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                // elevation: 0,
                // primary: kPrimaryColor,
                maximumSize: const Size(double.infinity, 56),
                minimumSize: const Size(double.infinity, 56),
              ),
            ),
            inputDecorationTheme: const InputDecorationTheme(
              filled: true,
              fillColor: Colors.amber,
              iconColor: kPrimaryColor,
              prefixIconColor: kPrimaryColor,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: defaultPadding, vertical: defaultPadding),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide.none,
              ),
            )),
        home:

            //  SplashScreenPage(),
            const UserRegisterScreen()
        // const UserDashbordScreen()
        );
  }
}
