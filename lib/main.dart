import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_auth/Screens/signupp_Screen.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAVX33gOv_ZRei_QTNpjEE0ZtxbO3LPMrs",
          authDomain: "saud-42c7b.firebaseapp.com",
          projectId: "saud-42c7b",
          storageBucket: "saud-42c7b.appspot.com",
          messagingSenderId: "30150184875",
          appId: "1:30150184875:web:15387708db81f27c854cee"));
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Signuppscreen(),
    );
  }
}
