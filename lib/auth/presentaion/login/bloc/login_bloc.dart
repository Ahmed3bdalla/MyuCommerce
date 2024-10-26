import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<Login>(login);
    on<UpdateEmail>(updateEmail);
    on<UpdatePass>(updatePass);
  }
  String email = '';
  String pass = '';

  BehaviorSubject<String> emailError = BehaviorSubject<String>();
  BehaviorSubject<String> passError = BehaviorSubject<String>();

  updateEmail(UpdateEmail event, Emitter<LoginState> emit) {
    emailError.value = '';
    email = event.email;
    print(email);
  }

  updatePass(UpdatePass event, Emitter<LoginState> emit) {
    passError.value = '';
    pass = event.pass;
  }

  login(Login event, Emitter<LoginState> emit) async {
    if (validation(emit)) {
      emit(LoginLoadingState());
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: pass);
        Get.offAllNamed("/home");
        emit(LoginSuccessState());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          emit(LoginFailureState(error: 'user Not found'));
          emailError.value = 'user Not found';
        } else if (e.code == 'wrong-password') {
          emit(LoginFailureState(error: 'wrong password'));
          passError.value = 'wrong password';
        }
      } catch (e) {
        emit(LoginFailureState(error: '$e'));
      }
    }
  }

  validation(Emitter<LoginState> emit) {
    bool isValid = true;
    if (email.isEmpty ||
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(email)) {
      emailError.value = "please enter valid email";
      isValid = false;
    }
    if (pass.isEmpty || pass.length < 8) {
      passError.value = "password not correct";
      isValid = false;
    }
    emit(ValidateState());
    return isValid;
  }
}
