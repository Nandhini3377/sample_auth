import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media/Screens/Home.dart';
import 'package:social_media/Screens/loginscreen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

class Auth{
 
  FirebaseAuth auth=FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

Future<UserCredential> signWithGoogle() async{
  final GoogleSignInAccount? googleUser=await GoogleSignIn().signIn();

  final GoogleSignInAuthentication googleAuth =await googleUser!.authentication;
  final OAuthCredential credential=GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  return await FirebaseAuth.instance.signInWithCredential(credential);
}

//signout
Future<void> signOutAndSwitchAccount() async {
  await auth.signOut();
  await _googleSignIn.signOut();
  final GoogleSignInAccount? googleUser =  await  _googleSignIn.signIn();
  final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
  final OAuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
  await auth.signInWithCredential(credential);
}


//signup

Future<void> signUpWithEmailAndPassword(String email, String password) async {
  try {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    User user = userCredential.user!;
    
    print('User ${user.uid} signed up successfully!');
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}


//signin
  Future<void> signInWithEmailAndPassword(String email, String password) async {
  try {
    
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    
    User user = userCredential.user!;
    print('User ${user.uid} signed in successfully!');
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('no user');
    } else if (e.code == 'wrong password') {
      print('wrong password');
    }
  }

  }



// Future<void> authenticateUser(String email,String password) async{
//   try{
//     UserCredential usercred=await auth.signInWithEmailAndPassword(email: email, password: password);
//     if(usercred==auth.currentUser){
//       auth.signInWithEmailAndPassword(email: email, password: password);
//     }
//   }
//  on FirebaseAuthException catch(e){
//  if(e.code=="user not found"){
//   print("invalid");
//  }
//  print("error");
//   }
// }

}