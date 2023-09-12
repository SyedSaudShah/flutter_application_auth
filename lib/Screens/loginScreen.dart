// ignore_for_file: prefer_const_constructors

import 'package:flutter_application_auth/Screens/signupp_Screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class LogInScreen extends ConsumerWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: unused_local_variable
    TextEditingController emailController = TextEditingController();
    // ignore: unused_local_variable
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Column(
        children: [
          TextFormField(),
          TextFormField(),
          ElevatedButton(onPressed: () {}, child: Text('LogIn')),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Signuppscreen(),
                    ));
              },
              child: Text('Signupp'))
        ],
      ),
    );
  }
}
