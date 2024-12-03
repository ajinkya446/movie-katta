import 'package:eMeet/config/constants.dart';
// import 'package:eMeet/presentation/screens/chat_screen/chat_screen.dart';
import 'package:eMeet/presentation/screens/home_screen.dart';
// import 'package:eMeet/presentation/screens/launch_screen/launch_screen.dart';
// import 'package:eMeet/presentation/screens/login_screen/otp_screen.dart';
// import 'package:eMeet/presentation/screens/profile_screen/profile_screen.dart';
// import 'package:eMeet/presentation/screens/registration_screen/registration_screen.dart';
import 'package:flutter/material.dart';

// import '../../presentation/screens/login_screen/login_screen.dart';
import '../../presentation/screens/splash_screen/app.dart';
import '../arguments/arguments.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case Constants.loginScreen:
      //   return MaterialPageRoute(builder: (ctx) => const LoginScreen());
      case "/":
        return MaterialPageRoute(builder: (ctx) => const SplashScreen());
      // case Constants.otpScreen:
      //   final arguments = settings.arguments as OTPScreenArguments;
      //   return MaterialPageRoute(builder: (ctx) => OTPScreen(arguments: arguments));
      // case Constants.launchScreen:
      //   return MaterialPageRoute(builder: (ctx) => const LaunchScreen());
      case Constants.homeScreen:
        return MaterialPageRoute(builder: (ctx) => const HomeScreen());
      // case Constants.registrationScreen:
      //   return MaterialPageRoute(builder: (ctx) => const RegistrationScreen());
      // case Constants.profileScreen:
      //   return MaterialPageRoute(builder: (ctx) => const ProfileScreen());
      // case Constants.chatScreen:
      //   return MaterialPageRoute(builder: (ctx) => const ChatScreen(userName: ''));
      default:
        return MaterialPageRoute(builder: (ctx) {
          return const Scaffold(body: Text("No Screen found"));
        });
    }
  }
}
