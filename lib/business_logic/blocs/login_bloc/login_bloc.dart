import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  LoginBloc() : super(LoginInitial(emailAddress: '')) {
    // Event handler for SendOTP event
    on<SendOTP>((event, emit) async {
      try {
        // Set the state to show that OTP sending is in progress
        emit(LoginInProgress());

        // Send email verification link using Firebase Authentication
        // await _auth.sendPasswordResetEmail(email: event.emailAddress);
        emit(LoginOTPVerified());
        // Emit state that OTP has been sent successfully (email verification link)
      } catch (e) {
        // If an error occurs, emit the error state
        emit(LoginError(message: e.toString()));
      }
    });
  }
}
