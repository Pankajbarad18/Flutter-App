import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Column(
          children: [
            Image.asset(
              "assets/Images/loginImage.png",
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              "Welcome to the Login Page",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter UserName",
                      labelText: "UserName",
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print("Login Successful");
                    },
                    child: Text("Login"),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
