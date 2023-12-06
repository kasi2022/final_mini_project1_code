import 'package:flutter/material.dart';
import 'package:keerthi_ram_flutter_app/Provider/service_provider.dart';
import 'package:keerthi_ram_flutter_app/views/homescreen.dart';
import 'package:keerthi_ram_flutter_app/views/user_sigin.dart';
import 'package:provider/provider.dart';

class GestuserScreen extends StatefulWidget {
  const GestuserScreen({super.key});

  @override
  State<GestuserScreen> createState() => _GestuserScreenState();
}

class _GestuserScreenState extends State<GestuserScreen> {
  final phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<ServiceProvider>(builder: (context, provider, child) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(
                    prefix: Text("+ 91 "), hintText: 'Enter the phone number'),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  final int getuser = int.parse(phoneController.text.trim());

                  provider.Otp(getuser);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserRegisterScreen()),
                  );
                },
                child: Text("Continue"),
              ),
              Text(provider.OTP)
            ],
          ),
        ),
      );
    }));
  }
}
