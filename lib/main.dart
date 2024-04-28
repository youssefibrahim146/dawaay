import 'package:dawaay/constans/dawaay_baindings.dart';
import 'package:dawaay/constans/dawaay_router.dart';
import 'package:dawaay/constans/dawaay_strings.dart';
import 'package:dawaay/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dawaay',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: DawaayBindings(),
      initialRoute: DawaayStrings.logInRoute,
      getPages: DawaayRouter.dawaayPages,
    );
  }
}
