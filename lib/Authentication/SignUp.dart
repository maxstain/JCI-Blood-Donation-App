// ignore_for_file: file_names
import 'package:blood_donation_app/Authentication/SignIn.dart';
import 'package:blood_donation_app/Services/Authentication_services.dart';
import 'package:blood_donation_app/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController bloodTypeController = TextEditingController();

  final List<DropdownMenuItem<String>> items = [
    const DropdownMenuItem(
      child: Text("A+"),
      value: "A+",
    ),
    const DropdownMenuItem(
      child: Text("A-"),
      value: "A-",
    ),
    const DropdownMenuItem(
      child: Text("B+"),
      value: "B+",
    ),
    const DropdownMenuItem(
      child: Text("B-"),
      value: "B-",
    ),
    const DropdownMenuItem(
      child: Text("O+"),
      value: "O+",
    ),
    const DropdownMenuItem(
      child: Text("O-"),
      value: "O-",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    String? dropDownValue = "";
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 30.0,
              ),
              child: const Text(
                "التسجيل",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                  color: Colors.red,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(width: 1.0),
              ),
              child: TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  labelText: "Email",
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              decoration: BoxDecoration(
                border: Border.all(width: 1.0),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.vpn_key),
                  labelText: "Password",
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              decoration: BoxDecoration(
                border: Border.all(width: 1.0),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Blood Type"),
                  DropdownButton(
                    value: dropDownValue,
                    hint: const Text("Blood Type"),
                    items: items,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropDownValue = newValue;
                        print(dropDownValue);
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 24.0,
                  ),
                ),
                child: const Text(
                  "تسجيل",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  print(dropDownValue);
                  context
                      .read<AuthenticationService>()
                      .signUp(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                        dropDownValue!,
                      )
                      .then(
                        (value) => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => const AuthenticationWrapper(),
                          ),
                        ),
                      );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Have an Account ? "),
                TextButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SignInPage(),
                    ),
                  ),
                  child: const Text("Sign In"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
