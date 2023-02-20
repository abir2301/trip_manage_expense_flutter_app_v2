import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

import '../../assistant/global.dart';
import '../../assistant/widgets/rounded_button.dart';
import '../../assistant/widgets/waves.dart';
import '../components/buttons/actionButton.dart';
import '../components/inputField.dart';

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
        body: SafeArea(
            child: Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              // height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.3,
              // ignore: sort_child_properties_last
              child: Icon(
                (Icons.connecting_airports),
                size: 100,
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
          InputField("Email Address", emailController, "Email",
              Icons.email_outlined, false),
          const SizedBox(
            height: 20,
          ),
          InputField("Password", passwordController, "",
              Icons.lock_outline_rounded, true),
          const SizedBox(
            height: 20,
          ),
          ActionButton(navigate, "Login"),
          SizedBox(
            height: 20,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     IconButton(onPressed: () {}, icon: const Icon(Icons.abc))
          //   ],
          // ),
          SizedBox(),
          Row(),
        ],
      ),
    )));
  }
}
