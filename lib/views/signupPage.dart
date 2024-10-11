import 'package:flutter/material.dart';
import 'package:hacktoberxmlsa_app/widgets/button.dart';
import 'package:hacktoberxmlsa_app/widgets/textRegistrationPage.dart';
import 'package:hacktoberxmlsa_app/widgets/textfield.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  
  final TextEditingController nameController= TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.02),
            const Text(
              "NoteMind",
              style: TextStyle(
                fontSize: 35,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: screenHeight * 0.1),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: screenHeight*0.025, 
                horizontal: screenWidth*0.05
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(text: "Name"),
                  SizedBox(height: screenHeight*0.005,),
                  CustomTextField(
                    controller: nameController,
                    //hintText: 'Enter your name',
                  ),
                  SizedBox(height: screenHeight*0.02,),
                  TextWidget(text: "Email"),
                  SizedBox(height: screenHeight*0.005,),
                  CustomTextField(
                    controller: emailController,
                    //hintText: 'Enter your email',
                  ),
                  SizedBox(height: screenHeight*0.02,),
                  TextWidget(text: "Password"),
                  SizedBox(height: screenHeight*0.005,),
                  CustomTextField(
                    controller: passwordController,
                    //hintText: 'password',
                  ),
                  SizedBox(height: screenHeight*0.02,),
                  TextWidget(text: "Confirm Password"),
                  SizedBox(height: screenHeight*0.005,),
                  CustomTextField(
                    controller: confirmPasswordController,
                    //hintText: 'password',
                  ),
                  SizedBox(height: screenHeight*0.02,),
                ],
              ),
            ),
            SizedBox(height: screenHeight*0.02,),
            CustomButton(
              onPressed: () {}, 
              text: "Sign Up",
            ),
          ],
        ),
      ),
    );
  }
}