import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

@immutable
abstract class PostState {}

@immutable
class PostInitialState extends PostState {}

@immutable
class PostLoadingState extends PostState {}

@immutable
class PostLoadedState extends PostState {}

@immutable
class PostErrorState extends PostState {
  final String message;
  PostErrorState({
    required this.message,
  });
}

class RegisterUserStateNotifer extends StateNotifier<PostState> {
  RegisterUserStateNotifer(PostInitialState postInitialState)
      : super(PostInitialState()) {}
  registerUser(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      state = PostInitialState();
      return "Signed up!";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
