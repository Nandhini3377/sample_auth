import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:social_media/Screens/Home.dart';
import 'package:social_media/Screens/loginscreen.dart';
import 'Screens/splashscreen.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

 void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MyApp());
    
    // // ChangeNotifierProvider(create:(_)=>Count(),
    // child: MyApp(),));
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SOCIAL MEDIA',
     routes: <String,WidgetBuilder>{
      '/':(context)=>Splash(),
    '/Home':(context)=>Home(),
     },
      debugShowCheckedModeBanner: false,
    );
  }
}
