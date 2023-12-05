import 'package:demo/features/app/auth/login.dart';
import 'package:flutter/material.dart';

class LancherApp extends StatefulWidget {
  const LancherApp({super.key});

  @override
  State<LancherApp> createState() => _LancherAppState();
}

class _LancherAppState extends State<LancherApp> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //login pour le moment
      body: LogIn(),
    );
  }
}
