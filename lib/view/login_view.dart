import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lingo_panda_assignment/theme/theme_ext.dart';
import 'package:lingo_panda_assignment/view/signup_view.dart';

import '../controller/auth_controller.dart';
import 'home_view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginFormKey = GlobalKey<FormState>();
  final AuthController _authController = AuthController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool abstructText = true;

  void login() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    final user = await _authController.login(email, password);
    if (user != null) {
      print("User logged in successfully");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Row(
            children: [
              Icon(Icons.error, color: Colors.white),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Login failed! Please check your credentials.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          action: SnackBarAction(
            label: 'Retry',
            textColor: Colors.yellow,
            onPressed: () {
              _passwordController.clear();
              _emailController.clear();
            },
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: appColors.lightGrey,
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "MyNews",
                style: GoogleFonts.poppins(
                  color: appColors.primary,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: Form(
                  key: loginFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: _emailController,
                        cursorColor: appColors.primary,
                        cursorHeight: 18,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          labelText: "Email",
                          labelStyle: TextStyle(
                            color: appColors.richBlack,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter email';
                          } else if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                            return 'Please enter valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        cursorColor: appColors.primary,
                        cursorHeight: 18,
                        obscureText: abstructText,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              abstructText
                                  ? Icons.remove_red_eye_outlined
                                  : Icons.remove_red_eye,
                            ),
                            onPressed: () {
                              setState(() {
                                abstructText = !abstructText;
                              });
                            },
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          labelText: "Password",
                          labelStyle: TextStyle(
                            color: appColors.richBlack,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: SizedBox(
                  width: width * 0.65,
                  height: height * 0.06,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // primary: appColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      if (loginFormKey.currentState!.validate()) {
                        login();
                      }
                    },
                    child: Text(
                      "Login",
                      style: GoogleFonts.poppins(
                        color: appColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "New here?",
                    style: GoogleFonts.poppins(
                      color: appColors.richBlack,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupScreen(),
                        ),
                      );
                    },
                    child: const Text("Sign up"),
                  ),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
