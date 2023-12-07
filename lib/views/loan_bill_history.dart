import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoanBillHistory extends StatefulWidget {
  const LoanBillHistory({Key? key}) : super(key: key);

  @override
  _LoanBillHistoryState createState() => _LoanBillHistoryState();
}

class _LoanBillHistoryState extends State<LoanBillHistory> {
  late Future<Map<String, dynamic>> _userDataFuture;

  @override
  void initState() {
    super.initState();
    _userDataFuture = fetchUserData();
  }

  Future<Map<String, dynamic>> fetchUserData() async {
    final apiUrl = 'https://keerthiram.in/chitnew/api_customer.php';

    final response = await http.get(
      Uri.parse('$apiUrl?username=9176039882&password=1234'),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load user data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Dashboard'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _userDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No data available'));
          } else {
            final userData = snapshot.data!;
            final loanData = userData['loan']['daily']['12925'];
            final loanid = loanData['loan_id'];
            final username = loanData['customer_name'];
            final userphone = loanData['phone'];
            final billList = loanData['bill_list'];
            const Card(
              child: ListTile(
                title: Text('Bill ID: '),
                subtitle: Text('Total Amount:  | Date: '),
              ),
            );

            return Column(
              children: [
                Text('Loan ID: $loanid'),
                Text('User Phone: $userphone'),
                Text('Username: $username'),
                Expanded(
                  child: ListView.builder(
                    itemCount: billList.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> bill = billList[index];
                      var billid = bill['bill_id'];
                      var billamount = bill['total_amount'];
                      var billdate = bill['date'];

                      return Card(
                        child: ListTile(
                          title: Text('Bill ID: $billid'),
                          subtitle: Text(
                              'Total Amount: $billamount | Date: $billdate'),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
