import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  // const useFirebaseEmulator = Sring.fromEnvironment('emu', defaultValue: 'false') == 'true'? true : false ;
  // const isVirtualDevice = String.fromEnvironment('virtualDevice', defaultValue: 'false') == 'true'? true : false;

  const useFirebaseEmulator = true;
  const isVirtualDevice = false;
  String host = isVirtualDevice ? '10.0.0.2' : '192.168.1.101:5003';

  // if (isVirtualDevice)
  if (kDebugMode && useFirebaseEmulator)
    FirebaseFirestore.instance.settings = Settings(
      host: host,
      sslEnabled: false,
      persistenceEnabled: false,
    );
  runApp(
    GetMaterialApp(
      defaultTransition: Transition.rightToLeft,
      title: "Uai Food",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      enableLog: false,
    ),
  );
}
