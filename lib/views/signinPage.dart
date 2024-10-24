import 'package:flutter/material.dart';
import 'package:hacktoberxmlsa_app/utils/auth_utils.dart';
import 'package:hacktoberxmlsa_app/views/homePage.dart';
import 'package:hacktoberxmlsa_app/widgets/button.dart';
import 'package:hacktoberxmlsa_app/widgets/textfield.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  bool _isPasswordVisible = false;

  void handleSignIn() {
    String password = passwordController.text;
    String? validationMessage = AuthUtils.validatePassword(password);
    if (validationMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(validationMessage)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Signed In successfully!')),
      );
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.02),
              const Text(
                "NoteMind",
                style: TextStyle(fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: screenHeight * 0.1),
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.025, horizontal: screenWidth * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "  Name",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.005,
                    ),
                    CustomTextField(
                      controller: nameController,
                      //hintText: 'Enter your name',
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Text(
                      "  Email",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.005,
                    ),
                    CustomTextField(
                      controller: emailController,
                      //hintText: 'Enter your email',
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Text(
                      "  Password",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.005,
                    ),
                    Stack(
                      children: [
                        CustomTextField(
                          controller: passwordController,
                          obscureText: !_isPasswordVisible,
                        ),
                        Positioned(
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: IconButton(
                              icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ))
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              CustomButton(onPressed: handleSignIn, text: "Login"),
            ],
          ),
        ),
      ),
    );
  }
}
