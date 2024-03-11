import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media/Provider/Auth_provider.dart';
import 'package:social_media/Screens/Home.dart';
import 'package:social_media/constant.dart';


class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold (
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
               
               Colors.pink.shade400,Colors.pink.shade300,Colors.pink.shade200
              ]),),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
                Center(
                  child: Text(
                    'REGISTER NOW',
                    style: GoogleFonts.alegreya(fontSize: 25),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
            
            //emailcontroller
                CreateEmail(
                  emailController: _emailController),
                SizedBox(
                  height: 30,
                ),
                CreatePassword(passwordController: _passwordController),
            
                vertical25,
            
            //Login Button
                CreateAccountButton(
                    email: _emailController.text,
                    password: _passwordController.text),
          ],),
        ),
      ),
    );
  }
}


class CreateEmail extends StatelessWidget {
  const CreateEmail({Key? key,required this.emailController}) : super(key: key);
final TextEditingController emailController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(

      width:220,
      child: TextField(
        
        controller: emailController,
        decoration: InputDecoration(
          
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1,color:Colors.black),
          borderRadius: BorderRadius.circular(40.0)),hintText: 'Email'),
      ),
    );
  }
}

class CreatePassword extends StatelessWidget {
  const CreatePassword ({Key? key,required this.passwordController}) : super(key: key);
final TextEditingController passwordController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(

      width: 220,
      child: TextField(
        controller: passwordController,
        obscureText: true,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1,color:Colors.black),
          borderRadius: BorderRadius.circular(40.0)),hintText: 'password'),
      ),
    );
  }
}

class CreateAccountButton extends StatelessWidget {
  CreateAccountButton ({Key? key, required this.email, required this.password})
      : super(key: key);
  final String email, password;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(

        
        shape:RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(5) ,),
        backgroundColor: Color.fromARGB(255, 207, 17, 159),
      ),
      onPressed: () async {
        Auth()
        .signUpWithEmailAndPassword(email, password,);
        
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
        
          
              
      },
      child: Text('Create Account'),
    );
  }
}



