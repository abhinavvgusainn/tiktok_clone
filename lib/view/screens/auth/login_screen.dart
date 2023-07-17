import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glitcheffect/glitcheffect.dart';
import 'package:tiktok/controller/auth_controller.dart';
import 'package:tiktok/view/screens/auth/signup_screen.dart';
import 'package:tiktok/view/widget/text_input.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController _emailColtroller = TextEditingController();
  TextEditingController _passwordColtroller = TextEditingController();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const GlitchEffect(
              child: Text(
                'TikTok',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 30,
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
              controller: _passwordColtroller,
              myIcon: Icons.lock_outline,
              myLabelText: 'Enter your password',
              toHide: true,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                AuthController.instance.login(
                  _emailColtroller.text,
                  _passwordColtroller.text,
                );
              },
              child: Text('Login'),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('New user? '),
                GestureDetector(
                  onTap: () => Get.to(
                    SignupScreen(),
                  ),
                  child: const Text(
                    'Create Account',
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
    );
  }
}
