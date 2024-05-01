import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myucommerce/view/cubits/auth_cubit/auth_states.dart';

import '../../../model/user_model.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(InitialState());

  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(LoadingState());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure(errorMessage: 'user Not found'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure(errorMessage: 'wrong password'));
      }
    } catch (e) {
      emit(LoginFailure(errorMessage: '$e'));
    }
  }

  Future<void> registerUser(
      {required String username,
      required String id,
      required String email,
      required String password}) async {
    emit(LoadingState());
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((user) async {
        await addUsertofirestore(UserModel(
            name: username, email: email, id: id, userid: user.user!.uid));
      });
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailure(errorMessage: 'weak password'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailure(errorMessage: 'email already in use'));
      }
    } catch (e) {
      emit(RegisterFailure(errorMessage: 'ErrorMessage: $e'));
    }
  }

  CollectionReference users = FirebaseFirestore.instance.collection("users");
  Future addUsertofirestore(UserModel userModel) async {
    await users.doc(userModel.userid).set(userModel.tojson());
  }
}
