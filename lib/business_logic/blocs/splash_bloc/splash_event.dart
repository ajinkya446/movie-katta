// splash_event.dart
import 'package:equatable/equatable.dart';

abstract class SplashEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadSplash extends SplashEvent {}
