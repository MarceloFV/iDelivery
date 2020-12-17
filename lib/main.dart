import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  bool useEmulator = true;


  if (kDebugMode && useEmulator) {
    FirebaseFirestore.instance.settings = Settings(
      host: '192.168.1.106:5003', //TODO: Testar localhost
      sslEnabled: false,
      persistenceEnabled: false,
    );
    runApp(
      GetMaterialApp(
        defaultTransition: Transition.rightToLeft,
        title: "Application",
        debugShowCheckedModeBanner: false,
        initialRoute: AppPages.DEBUG,
        getPages: AppPages.routes,
        enableLog: false,
      ),
    );
  } else {
    runApp(
      GetMaterialApp(
        defaultTransition: Transition.rightToLeft,
        title: "Application",
        debugShowCheckedModeBanner: false,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        enableLog: false,
      ),
    );
  }
}
