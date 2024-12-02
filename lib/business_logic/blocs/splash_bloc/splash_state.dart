// splash_state.dart
import 'package:equatable/equatable.dart';

abstract class SplashState extends Equatable {
  @override
  List<Object> get props => [];
}

class SplashInitial extends SplashState {}

class SplashLoading extends SplashState {}

class SplashLoaded extends SplashState {}

class LaunchState extends SplashState {}

class LoggedInUser extends SplashState {}
