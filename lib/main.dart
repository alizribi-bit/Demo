import 'package:demo/Providers/userProvider.dart';
import 'package:demo/constans/connstans.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/app/seplashSecreen/seplash_secreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        //title: 'Flutter Demo',
        theme: ThemeData(
            primaryColor: Constants.kPrimary,
            primarySwatch: Constants.kSwatchColor,
            scaffoldBackgroundColor: Colors.white,
            fontFamily: 'Poppins'),
        home: SeplashSeceen(),
      ),
    );
  }
}
