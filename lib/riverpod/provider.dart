// // import 'package:flutter_application_auth/riverpod/stateProvider.dart';
// // import 'package:riverpod/riverpod.dart';

// final signuppProvider = StateNotifierProvider<PostState,>((ref) => {
//   return PostState();
// });
// final signupProvider

import 'package:flutter_application_auth/riverpod/stateProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final registerUserNotifierProvider =
    StateNotifierProvider<RegisterUserStateNotifer, PostState>((ref) {
  return RegisterUserStateNotifer(PostInitialState());
});
