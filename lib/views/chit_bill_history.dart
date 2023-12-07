import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Chitbillhistory extends StatefulWidget {
  const Chitbillhistory({super.key});

  @override
  State<Chitbillhistory> createState() => _ChitbillhistoryState();
}

class _ChitbillhistoryState extends State<Chitbillhistory> {
  int intex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Bill Payment",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: ToggleSwitch(
                activeBgColor: [Colors.green],
                activeFgColor: Colors.white,
                initialLabelIndex: intex,
                totalSwitches: 2,
                labels: ['Bill', "Pending"],
                onToggle: (index) {
                  setState(() {
                    intex + 1;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                color: Colors.pink,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ));
  }
}
