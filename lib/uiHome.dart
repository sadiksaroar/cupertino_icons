import 'package:firbase_file/authService.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await _authService.signInWithEmail(
                    "test@example.com", "password");
              },
              child: Text("Sign In"),
            ),
            ElevatedButton(
              onPressed: () async {
                await _authService.signOut();
              },
              child: Text("Sign Out"),
            ),
          ],
        ),
      ),
    );
  }
}
