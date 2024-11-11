import 'package:eMeet/bloc/splash_bloc.dart';
import 'package:eMeet/bloc/splash_event.dart';
import 'package:eMeet/bloc/splash_state.dart';
import 'package:eMeet/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../launch_screen/launch_screen.dart';
import '../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashBloc()..add(LoadSplash()),
      child: Scaffold(
        body: BlocListener<SplashBloc, SplashState>(
          listener: (context, state) {
            if (state is LoggedInUser) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx) => const LoginScreen()));
            } else if (state is LaunchState) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx) => const LaunchScreen()));
            }
          },
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/eMeet.png", width: 200, height: 161, fit: BoxFit.fill),
              const SizedBox(height: 12),
              Text(
                "eMeet",
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 20),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
