import 'package:dawaay/constans/dawaay_baindings.dart';
import 'package:dawaay/constans/dawaay_router.dart';
import 'package:dawaay/constans/dawaay_strings.dart';
import 'package:dawaay/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  /// Ensure that Flutter framework is initialized.
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize the Firebase services.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  /// Fix text in release mode.
  ScreenUtil.ensureScreenSize();

  /// Start the execution by running MyApp widget.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dawaay',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialBinding: DawaayBindings(),
        initialRoute: FirebaseAuth.instance.currentUser != null
            ? AppStrings.homeRoute
            : AppStrings.logInRoute,
        getPages: DawaayRouter.dawaayPages,
      ),
    );
  }
}
