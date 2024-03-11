import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'loginscreen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login())));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            
            gradient: LinearGradient(colors: [Colors.pink.shade400,Colors.pink.shade300,Colors.pink.shade200]
            
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[ 
              // SizedBox(height: 10,),
              // Text('WELCOME TO SOCIALS'),
        
              
              Center(
                  child: Lottie.network(
                       'https://assets10.lottiefiles.com/packages/lf20_vuxwscfi.json',
                      repeat: true,
                      ),
                ),
              
           ]),
        ),),
    );
  }
}
