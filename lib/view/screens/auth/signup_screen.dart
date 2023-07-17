import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glitcheffect/glitcheffect.dart';
import 'package:tiktok/controller/auth_controller.dart';
import 'package:tiktok/view/screens/auth/login_screen.dart';
import 'package:tiktok/view/widget/text_input.dart';

class SignupScreen extends StatelessWidget {
  TextEditingController _emailColtroller = TextEditingController();
  TextEditingController _setPasswordColtroller = TextEditingController();
  TextEditingController _confirmPasswordColtroller = TextEditingController();
  TextEditingController _usernameController = TextEditingController();

  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(
            top: 100,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const GlitchEffect(
                child: Text(
                  'Welcome to TikTok',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Stack(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.deepPurple,
                    backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSM6V3VHLt-Q3ow3qVKLOT_r4NqnbfSvZU2vrRcIbIjI8ez8Mv8CJuQNjrinn3EWJaMn_o&usqp=CAU',
                    ),
                    radius: 64,
                  ),
                  Positioned(
                    child: GestureDetector(
                      onTap: () {
                        AuthController.instance.pickImage();
                      },
                      child: Icon(
                        Icons.add_a_photo_rounded,
                        size: 35,
                      ),
                    ),
                    bottom: -2,
                    left: 80,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextInputField(
                controller: _usernameController,
                myIcon: Icons.person,
                myLabelText: 'username',
              ),
              SizedBox(
                height: 20,
              ),
              TextInputField(
                controller: _emailColtroller,
                myIcon: Icons.email_outlined,
                myLabelText: 'Enter your email',
              ),
              SizedBox(
                height: 20,
              ),
              TextInputField(
                controller: _setPasswordColtroller,
                myIcon: Icons.lock_outline,
                myLabelText: 'Enter your password',
                toHide: true,
              ),
              SizedBox(
                height: 20,
              ),
              TextInputField(
                controller: _confirmPasswordColtroller,
                myIcon: Icons.lock_outline,
                myLabelText: 'Confirm your password',
                toHide: false,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  AuthController.instance.signUp(
                    _usernameController.text,
                    _emailColtroller.text,
                    _confirmPasswordColtroller.text,
                    AuthController.instance.proimg,
                  );
                },
                child: Text('Create Account'),
              ),
              SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account? '),
                  GestureDetector(
                    onTap: () => Get.to(
                      LoginScreen(),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
