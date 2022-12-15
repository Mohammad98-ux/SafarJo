import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'lib_orgnaizer.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Prefs.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Safar',
      onGenerateRoute: MyRouter.generateRoute,
      initialRoute: initRoute,
    );
  }
}