import 'package:bloc/bloc.dart';
import 'package:eMeet/bloc/splash_event.dart';
import 'package:eMeet/bloc/splash_state.dart';

import '../main.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<LoadSplash>(_onLoadSplash);
  }

  Future<void> _onLoadSplash(LoadSplash event, Emitter<SplashState> emit) async {
    emit(SplashLoading());
    await Future.delayed(const Duration(seconds: 3));
    bool? isSplashLoaded = prefs!.getBool('isSplashLoaded');
    if (isSplashLoaded ?? false) {
      emit(LoggedInUser());
    } else {
      await prefs!.setBool('isSplashLoaded', true);
      emit(LaunchState());
    }
  }
}
