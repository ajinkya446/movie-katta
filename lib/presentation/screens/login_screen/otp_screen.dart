import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toastification/toastification.dart';

import '../../../config/arguments/arguments.dart';
import '../registration_screen/registration_screen.dart';

class OTPScreen extends StatefulWidget {
  final OTPScreenArguments arguments;

  const OTPScreen({super.key, required this.arguments});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/eMeet.png", width: 60, height: 60),
            Text("eMeet",
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
                )),
          ],
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Enter Verification code",
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 27),
                  )),
              const SizedBox(height: 12),
              Text("We sent a 4-digit link to ${widget.arguments.emailAddress}.\nPlease enter it below to continue.",
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(color: Color(0xffE5E5E5), fontWeight: FontWeight.w400, fontSize: 15),
                  )),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 12),
                child: OtpTextField(
                  fieldWidth: 60,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  numberOfFields: 4,
                  borderColor: const Color(0xFF512DA8),
                  showFieldAsBox: true,
                  onCodeChanged: (String code) {},
                  onSubmit: (String verificationCode) {
                    if (verificationCode == "5555") {
                      toastification.show(
                        type: ToastificationType.success,
                        style: ToastificationStyle.fillColored,
                        context: context,
                        title: const Text('User login successfully...'),
                        autoCloseDuration: const Duration(seconds: 5),
                      );
                      setState(() {});
                      Navigator.push(context, MaterialPageRoute(builder: (ctx) => const RegistrationScreen()));
                    } else {
                      toastification.show(
                        type: ToastificationType.error,
                        style: ToastificationStyle.fillColored,
                        context: context,
                        title: const Text('Please enter valid OTP'),
                        autoCloseDuration: const Duration(seconds: 5),
                      );
                      setState(() {});
                    }
                  }, // end onSubmit
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
