part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {
  final String emailAddress;

  LoginInitial({required this.emailAddress});

  @override
  List<Object> get props => [emailAddress];
}

class LoginInProgress extends LoginState {}

class LoginOTPVerified extends LoginState {}

class LoginError extends LoginState {
  final String message;

  LoginError({required this.message});

  @override
  List<Object> get props => [message];
}
