import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:keerthi_ram_flutter_app/Provider/service_provider.dart';
import 'package:provider/provider.dart';

class UserDashbordScreen extends StatefulWidget {
  const UserDashbordScreen({super.key});

  @override
  State<UserDashbordScreen> createState() => _UserDashbordScreenState();
}

class _UserDashbordScreenState extends State<UserDashbordScreen> {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<ServiceProvider>(context).userData;
    final code = userData['top_msg_box'];
    
    // Explicitly cast the values to String

    // print(totallons['top_msg_box'].toString());

    return Scaffold(
      body: Column(
        children: [
          Text('${code}'),
        ],
      ),
    );
  }
}
