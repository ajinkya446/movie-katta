import 'package:eMeet/config/arguments/arguments.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toastification/toastification.dart';

import '../../../business_logic/blocs/login_bloc/login_bloc.dart';
import '../../../config/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController loginController = TextEditingController();
  String? otp;
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  @override
  void initState() {
    super.initState();
    logAppOpenEvent();
  }

  // Log a custom "app_open" event
  Future<void> logAppOpenEvent() async {
    await _analytics.logEvent(name: 'app_open', parameters: null);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          centerTitle: true,
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
        body: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            // TODO: implement listener
            print(state);
            if (state is LoginOTPVerified) {
              print("true");
              Navigator.pushNamed(context, Constants.otpScreen, arguments: OTPScreenArguments(emailAddress: loginController.text));
            } else if (state is LoginError) {
              toastification.show(
                type: ToastificationType.error,
                style: ToastificationStyle.fillColored,
                context: context,
                title: const Text('Something went wrong'),
                showIcon: false,
                showProgressBar: false,
                autoCloseDuration: const Duration(seconds: 2),
              );
            }
          },
          builder: (context, state) {
            return state is LoginInProgress
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
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
                                showIcon: false,
                                showProgressBar: false,
                                autoCloseDuration: const Duration(seconds: 2),
                              );
                              setState(() {});
                            } else {
                              String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                              final RegExp regExp = RegExp(emailPattern);
                              if (!regExp.hasMatch(loginController.text)) {
                                toastification.show(
                                  type: ToastificationType.error,
                                  style: ToastificationStyle.fillColored,
                                  showIcon: false,
                                  showProgressBar: false,
                                  context: context,
                                  title: const Text('Please enter valid email address'),
                                  autoCloseDuration: const Duration(seconds: 2),
                                );
                                setState(() {});
                              } else {
                                context.read<LoginBloc>().add(SendOTP(emailAddress: loginController.text));
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
                        ))
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
