import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1_se7ety/features/Auth/presentation/view-model/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart%20';

class AuthCubit_ extends Cubit<Auth_states> {
  AuthCubit_() : super(AuthInit_State());
  login(String email, String password) async {
    emit(LoginLoadingState());
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        User user = credential.user!;
      }
      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginErrorState(Error: 'الحساب غير موجود'));
      } else if (e.code == 'wrong-password') {
        emit(LoginErrorState(Error: 'كلمة السر خطا'));
      } else {
        emit(LoginErrorState(Error: 'حدث مشكله في التسجيل'));
      }
    }
  }

  registerPatient(String email, String name, String password) async {
    emit(RegisterLoagingState());
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = credential.user!;
      user.updateDisplayName(name);

      // Firestore
      FirebaseFirestore.instance.collection('patients').doc(user.uid).set({
        'name': name,
        'image': null,
        'age': null,
        'email': email,
        'phone': null,
        'bio': null,
        'city': null,
      }, SetOptions(merge: true));

      emit(RegisterSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterErrorState(Error: 'كلمه المرور ضعيفه'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterErrorState(Error: 'هذا الحساب موجود بالفعل'));
      }
    } catch (e) {
      emit(RegisterErrorState(Error: 'حدث مشكلة في تسجيل الحساب'));
    }
  }

  registerDoctor(String name, String email, String password) async {
    emit(RegisterLoagingState());
    try {
      final Credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      User user = Credential.user!;
      user.updateDisplayName(name);

      //Firestor
      FirebaseFirestore.instance.collection('Doctors').doc(user.uid).set({
        'name': name,
        'image': null,
        'specialization': null,
        'rating': null,
        'email': user.email,
        'phone1': null,
        'phone2': null,
        'bio': null,
        'openHour': null,
        'closeHour': null,
        'address': null,
      }, SetOptions(merge: true));
      emit(RegisterSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterErrorState(Error: 'كلمة السر ضعيفه'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterErrorState(Error: 'الحساب موجود بالفعل'));
      }
    } catch (e) {
      emit(RegisterErrorState(Error: 'حدثت مشكله في التسجيل'));
    }
  }

  updateDoctorData(
      {required String uid,
      required String specialization,
      required String image,
      required String email,
      required String phone1,
      String? phone2,
      required String bio,
      required String starTime,
      required String endTime,
      required String address, required String startTime}) async {
    emit(UpdateLoadingState());
    try {
      FirebaseFirestore.instance.collection('Doctors').doc(uid).set({
        'image': image,
        'specialization': specialization,
        'rating': 3000,
        'phone1': phone1,
        'phone2': phone2,
        'bio': bio,
        'openHour': starTime,
        'CloseHour': endTime,
        'address': address
      }, SetOptions(merge: true));
    } catch (e) {
      emit(UpdateErrorState(Error: e.toString()));
    }
  }
}
