import 'package:demo/features/Firebase_Auth_Services/FirebaseAuthServeces_Email.dart';
import 'package:demo/features/Secreens/homeSecreen.dart';
import 'package:demo/features/app/auth/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();

  FirebaseAuthServicesEmailPassword _auth = FirebaseAuthServicesEmailPassword();

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
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
                        _emailcontroller,
                        "Email",
                        "email@gmail.com",
                        false,
                        const Icon(
                          Icons.email_outlined,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .04,
                      ),
                      input(
                        _passwordcontroller,
                        "Mot de passe",
                        "Valide mot de passe",
                        true,
                        const Icon(
                          Icons.lock_outlined,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .06,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _signIn(
                              _emailcontroller.text, _passwordcontroller.text);
                        },
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width * .8,
                          height: 60,
                          child: const Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .03,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.sizeOf(context).width * .05,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Vous n'avez pas du compte",
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
                                      builder: (context) => SingUp()),
                                );
                              },
                              child: const Text(
                                "SignIn",
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

  void _signIn(email, password) async {
    User? user = await _auth.SignInWithEmailAndPasswor(email, password);

    if (user != null) {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    } else {
      print("error");
    }
  }
}
