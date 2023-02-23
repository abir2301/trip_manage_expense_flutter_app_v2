import 'package:app/assistant/widgets/waves.dart';
import 'package:app/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../assistant/global.dart';
import '../../assistant/widgets/rounded_button.dart';
import '../components/buttons/actionButton.dart';
import '../components/inputField.dart';
import '../components/screenTitle.dart';

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
        backgroundColor: kBackgroundColor,
        body: SafeArea(
            child: Center(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ScreenTitle(
                  title: "Registration",
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              InputField(
                labelText: "Full name  ",
                controller: nameController,
                placeholderText: "user ben user ",
                icon: Icons.person,
                validator: () {},
                inputType: TextInputType.text,
              ),
              const SizedBox(
                height: 20,
              ),
              InputField(
                labelText: "Email Address ",
                controller: emailController,
                placeholderText: "exemple@exemple.com",
                icon: Icons.mail,
                validator: () {},
                inputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 20,
              ),
              InputField(
                labelText: "Password  ",
                controller: passwordController,
                placeholderText: "*******",
                icon: Icons.lock,
                obsecureText: true,
                sufixIcon: Icons.visibility_off,
                validator: () {},
                inputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 25,
              ),
              ActionButton(text: "Rgister", fn: () {}),
              const SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'Already have an account !',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          color: Color(0xff474747), fontSize: 15)),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(width: 5),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ));
                  },
                  child: Text(
                    'Login',
                    style: kInkWellText,
                  ),
                ),
              ]),
            ],
          ),
        )));
  }
}
