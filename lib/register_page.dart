import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loginapp/login_page.dart';
import 'package:loginapp/widgets/CustomTextField.dart';
import 'package:loginapp/widgets/Custombutton.dart';

var usernameController = TextEditingController();
var passController = TextEditingController();
var emailController = TextEditingController();
var repassController = TextEditingController();

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/ball.jpg',
                  height: 50,
                  width: 50,
                ),
                SizedBox(height: 30),
                Card(
                  color: Colors.cyan,
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      CustomTextField(
                        preIcon: Icons.person,
                        hint: 'username',
                        controllerText: usernameController,
                      ),
                      SizedBox(height: 15),
                      CustomTextField(
                        validator: (val) => val!.isEmpty || !val.contains("@")
                            ? "enter a valid eamil"
                            : null,
                        preIcon: Icons.email,
                        hint: 'Email',
                        controllerText: emailController,
                      ),
                      SizedBox(height: 15),
                      CustomTextField(
                        preIcon: Icons.lock,
                        hint: 'password',
                        controllerText: passController,
                      ),
                      SizedBox(height: 15),
                      CustomTextField(
                        preIcon: Icons.lock,
                        hint: 'Repassword',
                        controllerText: repassController,
                      ),
                      SizedBox(height: 20),
                      CustomButton(
                          text: 'Sign Up',
                          icon: Icons.app_registration,
                          onClicked: () {
                            signUp();
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
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  child: Text(
                    "already have account Sign In",
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
    );
  }

  Future<void> signUp() async {
    if (passController.text.isNotEmpty &&
        usernameController.text.isNotEmpty &&
        repassController.text.isNotEmpty &&
        emailController.text.isNotEmpty) {
      http.Response response = await http.post(
          Uri.parse("http://127.0.0.1:8000/authentication/register/"),
          body: ({
            'username': usernameController.text,
            'email': emailController.text,
            'password': passController.text,
          }));
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("${response.statusCode}")));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("${response.statusCode}")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Blank fields fill in")));
    }
  }
}
