// ignore_for_file: avoid_print

import 'package:demo/features/Firebase_Auth_Services/FirebaseAuthServeces_Email.dart';
import 'package:demo/features/app/auth/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../lancher.dart';

class SingUp extends StatefulWidget {
  const SingUp({super.key});

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  TextEditingController _passwordconfirmedcontroller = TextEditingController();
  TextEditingController _usernamecontroller = TextEditingController();

  FirebaseAuthServicesEmailPassword _auth = FirebaseAuthServicesEmailPassword();

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _usernamecontroller.dispose();
    _passwordconfirmedcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isIos = Theme.of(context).platform == TargetPlatform.iOS;

    return isIos
        ? const CupertinoPageScaffold(
            child: Center(),
          )
        : Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .05,
                      ),
                      input(
                        _usernamecontroller,
                        "Nom & Prénom",
                        "Entrer votre nom et prénom",
                        false,
                        const Icon(
                          Icons.person,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .03,
                      ),
                      input(
                        _emailcontroller,
                        "Email",
                        "email@gmail.com",
                        false,
                        const Icon(
                          Icons.email_outlined,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .03,
                      ),
                      input(
                        _passwordcontroller,
                        "Mot de pass",
                        "Entrer un mot de passe",
                        true,
                        const Icon(
                          Icons.email_outlined,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .03,
                      ),
                      input(
                        _passwordconfirmedcontroller,
                        "Mot de passe",
                        "Confirmer le mot de passe",
                        true,
                        const Icon(
                          Icons.lock_outlined,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .05,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _signUp(
                              _emailcontroller.text, _passwordcontroller.text);
                        },
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width * .8,
                          height: 60,
                          child: const Center(
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .04,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.sizeOf(context).width * 0.12),
                        child: Row(
                          children: [
                            const Text(
                              "Vous avez un compte",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.2,
                                  color: Colors.grey),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LogIn()),
                                );
                              },
                              child: const Text(
                                "Log In",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  Widget input(controller, label, hintText, iSpass, icon) {
    return TextField(
      controller: controller,
      obscureText: iSpass,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        label: Text(label),
        hintText: hintText,
        prefixIcon: icon,
      ),
    );
  }

  void _signUp(email, password) async {
    User? user = await _auth.SignUpWithEmailAndPassword(email, password);

    if (user != null) {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LancherApp()),
      );
    } else {
      print("error");
    }
  }
}
