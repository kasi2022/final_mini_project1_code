import 'package:flutter/material.dart';
import 'package:keerthi_ram_flutter_app/Provider/service_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Consumer<ServiceProvider>(builder: (context, provider, child) {
      return Scaffold(
        body: Column(
          children: [Text(provider.OTP)],
        ),
      );
    });
  }
}
