import 'package:flutter/material.dart';

class RefereshScreen extends StatefulWidget {
  const RefereshScreen({super.key});

  @override
  State<RefereshScreen> createState() => _RefereshScreenState();
}

class _RefereshScreenState extends State<RefereshScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("referesh"),
      ),
    );
  }
}
