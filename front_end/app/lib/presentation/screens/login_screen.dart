import 'package:app/presentation/screens/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../assistant/global.dart';
import '../../assistant/widgets/rounded_button.dart';
import '../../assistant/widgets/waves.dart';
import '../components/buttons/actionButton.dart';
import '../components/inputField.dart';
import '../components/login_options.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController =
      TextEditingController(text: "Username@gmail.com");
  final TextEditingController passwordController =
      TextEditingController(text: "abcdef123456");

  final TextEditingController nameController = TextEditingController();
  void navigate() {
    // Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => HomePage(),
    //     ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: SafeArea(
            child: Center(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.5,
                  width: MediaQuery.of(context).size.width * 0.5,
                  // ignore: sort_child_properties_last
                  child: Icon(
                    (Icons.connecting_airports),
                    size: MediaQuery.of(context).size.width * 0.4,
                    color: Colors.white,
                  ),
                  decoration: const BoxDecoration(
                    // borderRadius: BorderRadius.circular(180),
                    color: kPrimaryColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 1,
                        offset: Offset(0.5, 0.5),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
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
              ActionButton(fn: navigate, text: "Login"),
              const SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  " don't have an account ?",
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
                          builder: (context) => const RegisterScreen(),
                        ));
                  },
                  child: Text(
                    'Sign in',
                    style: kInkWellText,
                  ),
                ),
              ]),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LoginOptions(
                    size: 22,
                    img1: "assets/google.png",
                    img2: "assets/facebook.png",
                  )),
            ],
          ),
        )));
  }
}
