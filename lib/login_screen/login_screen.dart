import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:office_meet/login_screen/otp_screen.dart';
import 'package:toastification/toastification.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController loginController = TextEditingController();
  String? _otp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/Logo.png", width: 30, height: 30),
            const SizedBox(width: 12),
            Text("eMeet",
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
                )),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/design.png", fit: BoxFit.fill, width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height / 2),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: Text("eMeet is free forever. No\nads and subscription fees",
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 27),
                    )),
              ),
              const SizedBox(height: 12),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    controller: loginController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: "Email Address",
                        hintStyle: GoogleFonts.roboto(
                          textStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 12),
                        )),
                  )),
              const SizedBox(height: 12),
              Center(
                child: GestureDetector(
                  onTap: () {
                    if (loginController.text.isEmpty) {
                      toastification.show(
                        type: ToastificationType.error,
                        style: ToastificationStyle.fillColored,
                        context: context,
                        title: const Text('Please enter email address'),
                        autoCloseDuration: const Duration(seconds: 5),
                      );
                      setState(() {});
                    } else {
                      String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                      final RegExp regExp = RegExp(emailPattern);
                      if (!regExp.hasMatch(loginController.text)) {
                        toastification.show(
                          type: ToastificationType.error,
                          style: ToastificationStyle.fillColored,
                          context: context,
                          title: const Text('Please enter valid email address'),
                          autoCloseDuration: const Duration(seconds: 5),
                        );
                        setState(() {});
                      } else {
                        Navigator.push(context, MaterialPageRoute(builder: (ctx) => OTPScreen(email: loginController.text)));
                      }
                    }
                  },
                  child: Container(
                    height: 55,
                    alignment: Alignment.center,
                    width: double.maxFinite,
                    margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: const Color(0xffFCFCFC)),
                    child: Text("Send login code",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 13),
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
