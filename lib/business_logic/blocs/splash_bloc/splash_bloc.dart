import 'package:eMeet/business_logic/blocs/splash_bloc/splash_event.dart';
import 'package:eMeet/business_logic/blocs/splash_bloc/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../presentation/main.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<LoadSplash>(_onLoadSplash);
  }

  Future<void> _onLoadSplash(LoadSplash event, Emitter<SplashState> emit) async {
    emit(SplashLoading());
    await Future.delayed(const Duration(seconds: 3));
    bool? isSplashLoaded = prefs!.getBool('isSplashLoaded');
    // if (isSplashLoaded ?? false) {
    //   emit(LoggedInUser());
    // } else {
    //   await prefs!.setBool('isSplashLoaded', true);
    emit(LaunchState());
    // }
  }
}
