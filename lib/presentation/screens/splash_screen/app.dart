import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/blocs/splash_bloc/splash_bloc.dart';
import '../../../business_logic/blocs/splash_bloc/splash_event.dart';
import '../../../business_logic/blocs/splash_bloc/splash_state.dart';
import '../../../config/constants.dart';

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
            /*if (state is LoggedInUser) {
              Navigator.pushReplacementNamed(context, Constants.loginScreen);
            } else */
            if (state is LaunchState) {
              Navigator.pushReplacementNamed(context, Constants.homeScreen);
            }
          },
          child: Center(child: Image.asset("assets/logo_new.png", width: 200, height: 161, fit: BoxFit.fill)),
        ),
      ),
    );
  }
}
