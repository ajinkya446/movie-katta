import 'package:eMeet/business_logic/blocs/splash_bloc/splash_bloc.dart';
import 'package:eMeet/config/routes/routes.dart';
import 'package:eMeet/presentation/screens/splash_screen/app.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toastification/toastification.dart';

SharedPreferences? prefs;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  prefs = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashBloc>(create: (BuildContext context) => SplashBloc()),
      ],
      child: ToastificationWrapper(
          child: MaterialApp(
        key: navigatorKey,
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.dark,
        navigatorObservers: [FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance)],
        theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), useMaterial3: true),
        // initialRoute: "/",
        onGenerateRoute: Routes.generateRoute,
        home: const SplashScreen(),
      )),
    );
  }
}
