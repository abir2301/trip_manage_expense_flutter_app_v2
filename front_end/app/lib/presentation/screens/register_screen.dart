import 'package:app/assistant/widgets/waves.dart';
import 'package:app/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';

import '../../assistant/global.dart';
import '../../assistant/widgets/rounded_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.zero,
        child: Stack(children: [
          WaveScreens('wave.svg', MediaQuery.of(context).size.width * 20, 250),
          Padding(
            padding: const EdgeInsets.all(50),
            child: SafeArea(
                child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 100, bottom: 20),
                  child: SizedBox(
                    child: Center(
                      child: Text(
                        'Create Acount  ',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      print(nameController.value);
                    },
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your name!';
                      }
                    },
                    textAlign: TextAlign.center,
                    decoration: kTextFieldInputDecoration.copyWith(
                        hintText: 'Full name ',
                        prefixIcon:
                            const Icon(Icons.person, color: kPrimaryColor)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      print(emailController.value);
                    },
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your email!';
                      }
                    },
                    textAlign: TextAlign.center,
                    decoration: kTextFieldInputDecoration.copyWith(
                        hintText: 'Email ',
                        prefixIcon:
                            const Icon(Icons.email, color: kPrimaryColor)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your password!';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        print(passwordController.text);
                      },
                      obscureText: true,
                      textAlign: TextAlign.center,
                      decoration: kTextFieldInputDecoration.copyWith(
                          hintText: 'Password',
                          prefixIcon: const Icon(Icons.lock_outlined,
                              color: kPrimaryColor))),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                RoundedButton('Register', () {}),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                      );
                    },
                    child: const Text(
                      "Already have an Account? login",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 18,
                          color: kTypicalTextColor,
                          fontFamily: 'Poppins'),
                    )),
              ],
            )),
          ),
        ]),
      ),
    );
  }
}
