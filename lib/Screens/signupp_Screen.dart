// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_application_auth/riverpod/provider.dart';
import 'package:flutter_application_auth/riverpod/stateProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Signuppscreen extends ConsumerStatefulWidget {
  const Signuppscreen({super.key});

  @override
  ConsumerState<Signuppscreen> createState() => _SignuppscreenState();
}

class _SignuppscreenState extends ConsumerState<Signuppscreen> {
  @override
  Widget build(BuildContext context) {
    final PostState = ref.watch(registerUserNotifierProvider);
    return Scaffold(
      body: Builder(
        builder: (context) {
          if (PostState is PostInitialState) {
            return const RegisterUserPage();
          } else if (PostState is PostLoadingState) {
            return const LoadingStateWidget();
          } else if (PostState is PostLoadedState) {
            return Text("Loaded State");
          } else {
            return ErrorStateWidget(
                errorMessage: (PostState as PostErrorState).message);
          }
          // else {
          //   return Text("oops");
          // }
        },
      ),
    );
  }
}

class LoadingStateWidget extends ConsumerWidget {
  const LoadingStateWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.amber,
      ),
    );
  }
}

class RegisterUserPage extends ConsumerWidget {
  const RegisterUserPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController lastnameController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    void _submit() {
      final isValid = formKey.currentState!.validate();
      if (!isValid) {
        return;
      }
      formKey.currentState?.save();
    }

    return SafeArea(
      child: Form(
        key: formKey,
        child: Center(
          child: Column(
            children: [
              const Text(
                'Signupp',
                style: TextStyle(color: Colors.black26, fontSize: 40),
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                style: const TextStyle(
                  fontSize: 22,
                ),
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Name",
                  fillColor: Colors.greenAccent,

                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                  // enabledBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(
                  //     width: 5,
                  //     color: Colors.greenAccent,
                  //   ),
                  //   borderRadius: BorderRadius.circular(50.0),
                  // ),
                ),
              ),
              Container(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                style: const TextStyle(
                  fontSize: 22,
                ),
                controller: lastnameController,
                decoration: InputDecoration(
                  labelText: "Last Name",
                  fillColor: Colors.greenAccent,

                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                  // enabledBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(
                  //     width: 5,
                  //     color: Colors.greenAccent,
                  //   ),
                  //   borderRadius: BorderRadius.circular(50.0),
                  // ),
                ),
              ),
              Container(
                height: 10,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                    return 'Enter a valid email!';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(
                  fontSize: 22,
                ),
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Enter Email",
                  fillColor: Colors.greenAccent,

                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                  // enabledBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(
                  //     width: 5,
                  //     color: Colors.greenAccent,
                  //   ),
                  //   borderRadius: BorderRadius.circular(50.0),
                  // ),
                ),
              ),
              Container(
                height: 10,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter a valid password!';
                  }
                  return null;
                },
                keyboardType: TextInputType.visiblePassword,
                style: const TextStyle(
                  fontSize: 22,
                ),
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: "Enter Password",
                  fillColor: Colors.greenAccent,

                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                  // enabledBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(
                  //     width: 5,
                  //     color: Colors.greenAccent,
                  //   ),
                  //   borderRadius: BorderRadius.circular(50.0),
                  // ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    _submit();
                    if (!(emailController.value.text.isEmpty ||
                        passwordController.value.text.isEmpty)) {
                      String emailAddress = emailController.value.text.trim();
                      String confirmPassword =
                          passwordController.value.text.trim();
                      ref
                          .read(registerUserNotifierProvider.notifier)
                          .registerUser(emailAddress, confirmPassword);

                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Paapi chooloo")));
                    }
                  },
                  child: const Text('Signupp'))
            ],
          ),
        ),
      ),
    );
  }
}

class ErrorStateWidget extends ConsumerWidget {
  const ErrorStateWidget({super.key, required this.errorMessage});

  final String errorMessage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Container(
        color: Colors.red,
        child: Text(errorMessage),
      ),
    );
  }
}
