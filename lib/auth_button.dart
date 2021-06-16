import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthButton extends StatelessWidget {
  final String fullName;
  final String company;
  final int age;

  AuthButton(this.fullName, this.company, this.age);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    // Create a CollectionReference called users that references the firestore collection

    Future<UserCredential> signInWithGoogle() async {
      // Trigger the authentication flow
      final GoogleSignInAccount googleUser = await GoogleSignIn(
              clientId:
                  '965999691956-v8j0obon8eulcuinagiqg5dvkuul1brg.apps.googleusercontent.com')
          .signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }

    return TextButton(
      onPressed: signInWithGoogle,
      child: Text(
        "Auth User",
      ),
    );
  }
}
