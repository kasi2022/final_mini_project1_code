import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Your main content goes here.'),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 22.0),
        backgroundColor: Colors.red,
        closeManually: false,
        children: [
          SpeedDialChild(
            child: Image.asset(
              'assets/icons/whatsapp.png',
            ),
            onTap: () {
              print('WhatsApp tapped');
            },
            label: 'WhatsApp',
            labelStyle: TextStyle(fontSize: 16.0),
          ),
          SpeedDialChild(
            child: Icon(Icons.call),
            onTap: () {
              print('Call tapped');
            },
            label: 'Call',
            labelStyle: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
