import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../login_screen/login_screen.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Image.asset("assets/person.png", width: double.maxFinite, height: double.maxFinite, fit: BoxFit.fill),
          Positioned(
              bottom: 1,
              left: 1,
              child: Container(
                color: const Color(0x668D8D8D),
                width: MediaQuery.of(context).size.width - 5,
                height: MediaQuery.of(context).size.height - 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("More secure  way  to send\nmessages with email",
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 27),
                        )),
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx) => const LoginScreen()));
                      },
                      child: Container(
                        height: 55,
                        alignment: Alignment.center,
                        width: 341,
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: const Color(0xff0A0A0A)),
                        child: Text("Start messaging",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 13),
                            )),
                      ),
                    )
                  ],
                ),
              ))
        ],
      )),
    );
  }
}
