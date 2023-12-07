import 'package:flutter/material.dart';
import 'package:mini_app2/views/bottom_navigation.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:sms_consent_for_otp_autofill/sms_consent_for_otp_autofill.dart';

class OTPVerification extends StatefulWidget {
  const OTPVerification({super.key});

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  late SmsConsentForOtpAutofill smsConsentForOtpAutoFill;
  OtpFieldController otpbox = OtpFieldController();
  String? phoneNumber;

  @override
  void initState() {
    super.initState();
    smsConsentForOtpAutoFill =
        SmsConsentForOtpAutofill(phoneNumberListener: (number) {
      phoneNumber = number;
      print("number...................${number}");
    }, smsListener: (otpcode) {
      print("otp...................${otpcode}");
      setState(() {
        this.startListen = false;
      });
      setState(() {
        //prase code from the OTP sms
        otpbox.set(otpcode.split(""));
      });
    });
  }

  @override
  void dispose() {
    smsConsentForOtpAutoFill.dispose();
    super.dispose();
  }

  bool startListen = false;
  var number = 1234;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "OTP Verification",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Enter the verification code we ",
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  "sms number${number}*****${number}",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          OTPTextField(
            controller: otpbox,
            length: 4,
            width: double.infinity,
            fieldWidth: 50,
            style: const TextStyle(fontSize: 17),
            textFieldAlignment: MainAxisAlignment.spaceAround,
            fieldStyle: FieldStyle.box,
            onCompleted: (pin) {
              print("Entered OTP Code: $pin");
            },
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Didint receive code ?",
                style: TextStyle(fontSize: 20),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Kasirajan()),
                    );
                  },
                  child: const Text(
                    "Resent",
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
