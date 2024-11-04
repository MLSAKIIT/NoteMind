import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hacktoberxmlsa_app/providers/theme_provider.dart';
import 'package:hacktoberxmlsa_app/providers/userProfile.dart';
import 'package:hacktoberxmlsa_app/services/colors.dart';
import 'package:hacktoberxmlsa_app/utils/auth_utils.dart';
import 'package:hacktoberxmlsa_app/views/homePage.dart';
import 'package:hacktoberxmlsa_app/widgets/button.dart';
import 'package:hacktoberxmlsa_app/widgets/textfield.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController rollController = TextEditingController();

  String savedName = '';
  String savedRoll = '';
  String savedEmail = '';
  String savedPassword = '';
  bool _isPasswordVisible = false;

  // Image picker instance
  final ImagePicker _picker = ImagePicker();

  void saveProfileDetails() {
    String password = passwordController.text;
    String? validationMessage = AuthUtils.validatePassword(password);

    if (validationMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(validationMessage)),
      );
    } else {
      setState(() {
        savedName = nameController.text;
        savedRoll = rollController.text;
        savedEmail = emailController.text;
        savedPassword = passwordController.text;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Profile details saved successfully!')),
      );
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      Provider.of<UserProfileProvider>(context, listen: false)
          .updateProfile(pickedFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProfile = Provider.of<UserProfileProvider>(context);

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
            icon: Icon(
              Provider.of<ThemeProvider>(context).isLightTheme
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenWidth * 0.08),
              Container(
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    // Existing profile image container
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: purple,
                          spreadRadius: screenWidth * 0.02,
                          blurRadius: screenWidth * 0.1,
                          offset: Offset(0, 0),
                        ),
                      ]),
                      child: Container(
                        height: screenWidth / 3,
                        width: screenWidth / 3,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            File(userProfile.image),
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnDNmpgYnTP4ELmIob69uKE1O0Rbrotna00g&s',
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    // New IconButton for selecting an image
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton(
                        icon: Icon(Icons.camera_alt, color: Colors.black),
                        color: Colors.black.withOpacity(0.5),
                        onPressed: _pickImage,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              Text(
                "Name",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: screenHeight * 0.004),
              CustomTextField(
                controller: nameController,
                onChanged: (value) {
                  userProfile.updateName(value);
                },
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                "Roll No.",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: screenHeight * 0.004),
              CustomTextField(
                controller: rollController,
                onChanged: (value) {
                  userProfile.updateRoll(value);
                },
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                "Email",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: screenHeight * 0.004),
              CustomTextField(
                controller: emailController,
                onChanged: (value) {
                  userProfile.updateEmail(value);
                },
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                "Password",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: screenHeight * 0.004),
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
                      icon: Icon(_isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.04),
              CustomButton(
                onPressed: saveProfileDetails,
                text: "Save",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
