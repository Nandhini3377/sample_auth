import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:social_media/Provider/Auth_provider.dart';
import 'package:social_media/Screens/Signupscreen.dart';
import 'package:social_media/constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Home.dart';

import 'package:firebase_core/firebase_core.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Colors.pink.shade400,
                Colors.pink.shade300,
                Colors.pink.shade200
              ])),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                vertical15,

                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 9),
                    child: Text(
                      'Welcome Back!',
                      style: GoogleFonts.alegreya(
                        fontSize: 33,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      'Please login to continue!',
                      style: GoogleFonts.alegreya(
                          fontSize: 17, color: Colors.white),
                    ),
                  ),
                ),
                vertical5,

                Lottie.network(
                    // 'assests/sl.json',
                    'https://assets6.lottiefiles.com/private_files/lf30_m6j5igxb.json',
                    width: 180,
                    height: 180),

                //emailcontroller
                LoginWithEmail(emailController: _emailController),

                SizedBox(
                  height: 22,
                ),
                LoginWithPassword(passwordController: _passwordController),
                vertical10,

                //Login Button
                LoginButton(
                    email: _emailController.text,
                    password: _passwordController.text),
                vertical10,
                //signup button
                Padding(
                  padding: EdgeInsets.only(left: 70),
                  child: Row(
                    children: [
                      Text(
                        'Dont have an account ?',
                      ),
                      SizedBox(width: 20),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SignUpScreen()));
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  ),
                ),

                vertical10,

                Text(
                  "OR",
                  style: TextStyle(color: Colors.white),
                ),
                vertical10,

                //GOOGLE SIGN IN BUTTON
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 207, 17, 159),
                    ),
                    onPressed: () async {
                      await Auth()
                          .signWithGoogle()
                          .then((UserCredential value) async {
                        final name = value.user!.displayName;
                        final email = value.user!.email;
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => Home()));
                        print(email);
                      });
                    },
                    child: Text('SignIn WIth Google',
                        style: TextStyle(color: Colors.white)))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Login with emailid

class LoginWithEmail extends StatelessWidget {
  const LoginWithEmail({Key? key, required this.emailController})
      : super(key: key);
  final TextEditingController emailController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: MediaQuery.of(context).size.width / 2,
      width: 220,
      child: TextFormField(
        validator: (value) {
          if (value != null) {
            return 'Please enter the email';
          }
          return null;
        },
        enabled: true,
        controller: emailController,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(40.0)),
          hintText: 'Email',
          prefixIconColor: Colors.black,
          labelStyle: TextStyle(fontSize: 14),
          //focusColor: Colors.lightBlueAccent,
          prefixIcon: Icon(Icons.email_rounded),
        ),
      ),
    );
  }
}

//login with password
class LoginWithPassword extends StatelessWidget {
  const LoginWithPassword({Key? key, required this.passwordController})
      : super(key: key);
  final TextEditingController passwordController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: MediaQuery.of(context).size.width / 2,
      width: 220,
      child: TextField(
        controller: passwordController,
        obscureText: true,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.black),
              borderRadius: BorderRadius.circular(40.0)),
          hintText: 'Password',
          prefixIconColor: Colors.black,
          prefixIcon: Icon(Icons.lock_outline),
        ),
      ),
    );
  }
}

//login Button

class LoginButton extends StatelessWidget {
  LoginButton({Key? key, required this.email, required this.password})
      : super(key: key);
  final String email, password;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        backgroundColor: Color.fromARGB(255, 207, 17, 159),
      ),
      onPressed: () async {
        Auth()
            .auth
            .signInWithEmailAndPassword(email: email, password: password);

        // try {
        // .auth.signInWithEmailAndPassword;
        //     email: email, password: password);
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
        // } catch (e) {
        //   ScaffoldMessenger.of(context)
        //       .showSnackBar(SnackBar(content: Text(e.toString())));
        // }
      },
      child: Text('Login Now'),
    );
  }
}
