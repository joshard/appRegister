import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loginapp/register_page.dart';
import 'package:loginapp/widgets/CustomTextField.dart';
import 'package:loginapp/widgets/Custombutton.dart';
import 'package:loginapp/widgets/background.dart';

var usernameController = TextEditingController();
var passController = TextEditingController();

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/ball.jpg',
                    height: 100,
                    width: 100,
                  ),
                  SizedBox(height: 30),
                  Card(
                    color: Colors.cyan,
                    child: Column(
                      children: [
                        SizedBox(height: 30),
                        CustomTextField(
                          preIcon: Icons.email,
                          hint: 'Email',
                          controllerText: usernameController,
                        ),
                        SizedBox(height: 15),
                        CustomTextField(
                          preIcon: Icons.lock,
                          hint: 'password',
                          controllerText: passController,
                        ),
                        SizedBox(height: 30),
                        CustomButton(
                            text: 'Login',
                            icon: Icons.login,
                            onClicked: () {
                              login();
                            }),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Register()),
                      );
                    },
                    child: Text(
                      "Don't have an account Sign Up",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> login() async {
    if (passController.text.isNotEmpty && usernameController.text.isNotEmpty) {
      http.Response response =
          await http.post(Uri.parse("http://192.168.43.241:8000/api/login/"),
              body: ({
                'username': usernameController.text,
                'password': passController.text,
              }));
      if (response.statusCode == 200) {
        print("gooooo");
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Invalid Credentials.')));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Blank fields fill in")));
    }
  }
}

// function to call login button


