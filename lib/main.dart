import 'dart:async';
import 'package:cockpitintelligence/ui/accounts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyCJDS55ybacIZIoKWBR7rwoAU-GQDSzL_0',
      appId: '1:82829353401:web:febffe2239b3854f011668',
      messagingSenderId: '82829353401',
      projectId: 'excelsync-8d4a2',
      authDomain: 'excelsync-8d4a2.firebaseapp.com',
      databaseURL: 'https://excelsync-8d4a2-default-rtdb.firebaseio.com',
      storageBucket: 'excelsync-8d4a2.appspot.com',
      measurementId: 'G-DDM14HCYNM',
    ),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp_2());
}

class MyApp_2 extends StatelessWidget {
  const MyApp_2({super.key});

  // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (p0, p1, p2) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: FutureBuilder(
            future: Firebase.initializeApp(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasError) {
                if (kDebugMode) {
                  print("You have an error: ${snapshot.error.toString()}");
                }
                return const Text("Something went wrong!");
              } else {
                return const CheckUserLoggedInOrNot();
              }
            },
          ),
        );
      },
    );
  }
}
