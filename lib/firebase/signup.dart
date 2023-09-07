import 'package:firebase_auth/firebase_auth.dart';

// Future<void> signUpWithEmailAndPassword(String name, String lastname,
//     String email, String password, BuildContext context) async {
//   try {
//     _auth.createUserWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//   } on FirebaseAuthException catch (e) {
//     await showDialog(
//         context: context,
//         builder: (ctx) => AlertDialog(
//                 title: Text('Error Occured'),
//                 content: Text(e.toString()),
//                 actions: [
//                   TextButton(
//                       onPressed: () {
//                         Navigator.of(ctx).pop();
//                       },
//                       child: Text("OK"))
//                 ]));
//   } catch (e) {
//     if (e == 'email-already-in-use') {
//       print('Email already in use.');
//     } else {
//       print('Error: $e');
//     }
//   }
// }

Future<String?> signUp({
  required String email,
  required String password,
}) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return "Signed up!";
  } on FirebaseAuthException catch (e) {
    return e.message;
  }
}
