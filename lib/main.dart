import 'package:flutter/material.dart';
import 'package:mini_app2/provider/provider_screvice.dart';
import 'package:mini_app2/views/api.dart';
import 'package:mini_app2/views/landing_screen.dart';
import 'package:mini_app2/views/chit_bill_history.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ApiProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ApiProvider>(context, listen: false)
        .userDetails('9176039882', '1234');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 247, 240, 240),
      ),
      home: Scaffold(body: LandingScreen()),
    );
  }
}
