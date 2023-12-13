import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constans/connstans.dart';
import '../../../dictionnaire/FR.dart';
import '../lancher.dart';

class SeplashSeceen extends StatefulWidget {
  const SeplashSeceen({super.key});

  @override
  State<SeplashSeceen> createState() => _SeplashSeceenState();
}

class _SeplashSeceenState extends State<SeplashSeceen> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const LancherApp(),
          ),
        );
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isIos = Theme.of(context).platform == TargetPlatform.iOS;
    Francais langeFr = Francais();

    return isIos
        ? CupertinoPageScaffold(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blueAccent.shade400,
                    Colors.deepPurple.shade600,
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Bienvenu",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * .04,
                  ),
                  const Icon(
                    Icons.home_filled,
                    size: 40,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          )
        : Scaffold(
            body: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xffb997e3),
                        Color(0xffe8dcf6),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    langeFr.seplashWelcom,
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        color: Colors.black),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Image.asset("assets/islamic.png"),
                )
              ],
            ),
          );
  }
}
