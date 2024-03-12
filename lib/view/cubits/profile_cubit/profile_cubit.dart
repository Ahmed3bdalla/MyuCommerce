import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myucommerce/view/cubits/profile_cubit/profile_states.dart';

import '../../../model/user_model.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(InitialState());

  CollectionReference userRef = FirebaseFirestore.instance.collection('users');
  late UserModel userModel;
  void getUserData() async {
    emit(LoadingState());
    try {
      await userRef
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then((user) {
        userModel = UserModel.fromjson(user.data() as Map<String, dynamic>);
      });
      emit(SuccessState());
    } catch (e) {
      emit(FailureState(errorMessage: '$e'));
    }
  }
}
