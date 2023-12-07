import 'package:flutter/material.dart';
import 'package:mini_app2/provider/provider_screvice.dart';
import 'package:mini_app2/views/chit_bill_history.dart';
import 'package:mini_app2/views/loan_bill_history.dart';
import 'package:mini_app2/widgets/plan_card.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  String data1 = "hellow";
  String data2 = "hellow";

  // Format the date to display day, month, and year

  @override
  Widget build(BuildContext context) {
    return Consumer<ApiProvider>(builder: (context, provider, child) {
      Map<String, dynamic> userData = provider.userData.cast<String, dynamic>();
      final quants = userData['top_msg_box'];
      final username = userData['customer_name'];
      final userImage = userData['photo'];
      final loanData = userData['loan']['daily']['12925'];
      final LID = loanData['loan_id'];

      return Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                '$username',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            backgroundColor: Color(0xFFCD1818),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "$userImage",
                  ),
                  radius: 20, // Adjust the radius as needed
                ),
              ), //CircleAvatar
            ],
          ),

          //
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Text('Hi Praveen ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                ),
                ListTile(
                  title: Text('Item 1'),
                  onTap: () {
                    // Handle item 1 tap
                  },
                ),
                ListTile(
                  title: Text('Item 2'),
                  onTap: () {
                    // Handle item 2 tap
                  },
                ),
                // Add more ListTile widgets for additional items
              ],
            ),
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    height: 200,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            '$quants',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Color(0xFFCD1818),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  data2.isNotEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 10, left: 10),
                              child: Text(
                                "chit Details",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                // Navigate to HomeScreen when the card is pressed
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Chitbillhistory()),
                                );
                              },
                              child: Card(
                                  elevation: 10,
                                  child: Container(
                                      height: 80,
                                      child: const Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(20),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "CID ",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ))),
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                  const SizedBox(
                    height: 10,
                  ),
                  data1.isNotEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Loan Details",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                // Navigate to HomeScreen when the card is pressed
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoanBillHistory()),
                                );
                              },
                              child: Card(
                                  elevation: 10,
                                  child: Container(
                                      height: 80,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(20),
                                            child: Row(
                                              children: [
                                                Text(
                                                  "LID ${LID}",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ))),
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          ));
    });
  }
}
