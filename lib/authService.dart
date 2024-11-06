import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signInWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = userCredential.user;

      if (user != null) {
        await _logUserConnection(user.uid, "sign_in");
      }
    } catch (e) {
      print("Error signing in: $e");
    }
  }

  Future<void> signOut() async {
    User? user = _auth.currentUser;
    if (user != null) {
      await _logUserConnection(user.uid, "sign_out");
    }
    await _auth.signOut();
  }

  Future<void> _logUserConnection(String uid, String status) async {
    await _firestore.collection('user_connections').add({
      'uid': uid,
      'status': status,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}
