import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
            body: Container(
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
          );
  }
}
