import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    bool isIos = Theme.of(context).platform == TargetPlatform.iOS;

    return isIos
        ? const CupertinoPageScaffold(
            child: Center(),
          )
        : const Scaffold(
            body: Center(
              child: Text(
                "Welcom Home",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    color: Colors.indigoAccent),
              ),
            ),
          );
  }
}
