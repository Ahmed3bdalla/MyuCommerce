import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:myucommerce/helper/model/user_model.dart';
import 'package:rxdart/rxdart.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUp>(signUp);
  }
  String email = '';
  String pass = '';
  String id = '';
  String name = '';

  BehaviorSubject<String> emailError = BehaviorSubject<String>();
  BehaviorSubject<String> passError = BehaviorSubject<String>();
  BehaviorSubject<String> nameError = BehaviorSubject<String>();
  BehaviorSubject<String> idError = BehaviorSubject<String>();

  updateEmail(String email) {
    emailError.value = '';
    this.email = email;
    print(this.email);
  }

  updatePass(String pass) {
    passError.value = '';
    this.pass = pass;
    // print(this.pass);
  }

  updateId(String id) {
    idError.value = '';
    this.id = id;
    // print(this.id);
  }

  updateName(String name) {
    nameError.value = '';
    this.name = name;
    // print(this.name);
  }

  signUp(SignUp event, Emitter<SignUpState> emit) async {
    if (validation()) {
      emit(SignUpLoadingState());
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: email,
          password: pass,
        )
            .then((user) async {
          await addUsertofirestore(UserModel(
              name: name, email: email, id: id, userid: user.user!.uid));
        });

        emit(SignUpSuccessState());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          emit(SignUpFailureState(error: 'weak password'));
        } else if (e.code == 'email-already-in-use') {
          emit(SignUpFailureState(error: 'email already in use'));
        }
      } catch (e) {
        emit(SignUpFailureState(error: 'ErrorMessage: $e'));
      }
    }
  }

  CollectionReference users = FirebaseFirestore.instance.collection("users");
  Future addUsertofirestore(UserModel userModel) async {
    await users.doc(userModel.userid).set(userModel.tojson());
  }

  validation() {
    bool isValid = true;
    if (name.isEmpty) {
      isValid = false;
      nameError.add('Name is required');
    }
    if (id.length < 8) {
      isValid = false;
      idError.add('ID must be at least 8 characters');
    }
    if (email.isEmpty) {
      isValid = false;
      emailError.add('Email is required');
    }
    if (pass.isEmpty) {
      isValid = false;
      passError.add('Password is required');
    }
    return isValid;
  }
}
