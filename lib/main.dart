import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_bindings.dart';
import 'package:flutter_application_1/app_initial.dart';
import 'package:flutter_application_1/routes/app_pages.dart';
import 'package:flutter_application_1/routes/app_routes.dart';
import 'package:flutter_application_1/theme.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDMeSsy19Xcdv-INki43VcP7DOnO7yrrF8",
      authDomain: "emesmo-db24f.firebaseapp.com",
      projectId: "emesmo-db24f",
      storageBucket: "emesmo-db24f.appspot.com",
      messagingSenderId: "13812020635",
      appId: "1:13812020635:web:182e6f27c5769276d89d3e",
    ),
  );
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) return Container();
        if (snapshot.connectionState == ConnectionState.done) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: 'Poppins',
              primaryColor: kPrimaryColor,
            ),
            initialRoute: Routes.SPLASH,
            initialBinding: AppBindings(),
            getPages: AppPages.routes,
          );
        }
        return Container();
      },
    );
  }
}
