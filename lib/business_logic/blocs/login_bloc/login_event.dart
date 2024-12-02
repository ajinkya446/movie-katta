part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SendOTP extends LoginEvent {
  final String emailAddress;

  SendOTP({required this.emailAddress});

  @override
  List<Object> get props => [emailAddress];
}
