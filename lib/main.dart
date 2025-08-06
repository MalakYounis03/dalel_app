import 'package:dalel_app/app/dalel_app.dart';
import 'package:dalel_app/core/dataBase/cache/cache_helper.dart';
import 'package:dalel_app/core/functions/check_state_changes.dart';
import 'package:dalel_app/core/service/service_licator.dart';
import 'package:dalel_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  checkStateChanges();
  setUpServiceLocator();
  await getIt<CacheHelper>().init();
  runApp(const MyApp());
}
