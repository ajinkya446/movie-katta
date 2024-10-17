import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../launch_screen/launch_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx) => const LaunchScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/eMeet.png", width: 161, height: 161),
          const SizedBox(height: 12),
          Text(
            "eMeet",
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 20),
            ),
          )
        ],
      )),
    );
  }
}
