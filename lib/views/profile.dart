import 'package:flutter/material.dart';
import 'package:hacktoberxmlsa_app/widgets/button.dart';
import 'package:hacktoberxmlsa_app/widgets/textfield.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController= TextEditingController();
  final TextEditingController rollController= TextEditingController();

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenWidth*0.08,),
              Container(
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF4E1588),
                            spreadRadius: screenWidth*0.02,
                            blurRadius: screenWidth*0.1,
                            offset: Offset(0, 0),
                          ),
                        ]
                      ), 
                      child: Container(
                        height: screenWidth/3,
                        width: screenWidth/3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnDNmpgYnTP4ELmIob69uKE1O0Rbrotna00g&s',
                            fit: BoxFit.cover,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight*0.05,),
              Text(
                "Name",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(height: screenHeight*0.004,),
              CustomTextField(
                controller: nameController,
              ),
              SizedBox(height: screenHeight*0.02,),
              Text(
                "Roll No.",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(height: screenHeight*0.004,),
              CustomTextField(
                controller: rollController,
              ),
              SizedBox(height: screenHeight*0.02,),
              Text(
                "Email",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(height: screenHeight*0.004,),
              CustomTextField(
                controller: emailController,
              ),
              SizedBox(height: screenHeight*0.02,),
              Text(
                "Password",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(height: screenHeight*0.004,),
              CustomTextField(
                controller: passwordController,
              ),
              SizedBox(height: screenHeight*0.04,),
              CustomButton(onPressed: () {}, text: "Save"),
            ],
          ),
        ),
      ),
    );
  }
}