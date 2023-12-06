import 'package:flutter/material.dart';
import 'package:keerthi_ram_flutter_app/Provider/service_provider.dart';
import 'package:keerthi_ram_flutter_app/views/user_dashbord_screen.dart';
import 'package:provider/provider.dart';

class UserRegisterScreen extends StatefulWidget {
  const UserRegisterScreen({super.key});

  @override
  State<UserRegisterScreen> createState() => _UserRegisterScreenState();
}

class _UserRegisterScreenState extends State<UserRegisterScreen> {
  final usernameContoller = TextEditingController();
  final userpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: usernameContoller,
                decoration:
                    const InputDecoration(hintText: 'Enter the user Name'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: userpassword,
                decoration:
                    const InputDecoration(hintText: 'Enter the usePassword  '),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Provider.of<ServiceProvider>(context, listen: false)
                        .userDetails(
                      usernameContoller.text,
                      userpassword.text,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserDashbordScreen()),
                    );
                  },
                  child: Text("Sigin"))
            ],
          ),
        ),
      ),
    );
  }
}
