import 'package:commerce_flutter_app/common/widgets/custom_button.dart';
import 'package:commerce_flutter_app/common/widgets/custom_textfield.dart';
import 'package:commerce_flutter_app/constants/global_variables.dart';
import 'package:commerce_flutter_app/features/auth/screens/sign_up_screen.dart';
import 'package:commerce_flutter_app/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';

enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signin; // Đã thay đổi từ Auth.signup sang Auth.signin
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
    );
  }

  void signInUser() {
    authService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.blue.shade900,
              Colors.blue.shade800,
              Colors.blue.shade400,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 80),
              // Logo Section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: Image.asset(
                    'assets/logo.png',
                    height: 100,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AnimatedOpacity(
                      duration: Duration(milliseconds: 1000),
                      opacity: 1.0,
                      child: Text(
                        _auth == Auth.signup
                            ? "Đăng Kí"
                            : "Đăng Nhập", // Đoạn này không thay đổi
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const AnimatedOpacity(
                      duration: Duration(milliseconds: 1300),
                      opacity: 1.0,
                      child: Text(
                        "Chào mừng trở lại",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      if (_auth == Auth.signup)
                        Form(
                          key: _signUpFormKey,
                          child: Column(
                            children: [
                              CustomTextField(
                                controller: _nameController,
                                hintText: 'Tên',
                              ),
                              const SizedBox(height: 10),
                              CustomTextField(
                                controller: _emailController,
                                hintText: 'Email',
                              ),
                              const SizedBox(height: 10),
                              CustomTextField(
                                controller: _passwordController,
                                hintText: 'Mật khẩu',
                              ),
                              const SizedBox(height: 10),
                              CustomButton(
                                text: 'Đăng Kí',
                                onTap: () {
                                  if (_signInFormKey.currentState!.validate()) {
                                    signUpUser();
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      if (_auth == Auth.signin)
                        Form(
                          key: _signInFormKey,
                          child: Column(
                            children: [
                              CustomTextField(
                                controller: _emailController,
                                hintText: 'Email',
                              ),
                              const SizedBox(height: 10),
                              CustomTextField(
                                controller: _passwordController,
                                hintText: 'Mật khẩu',
                              ),
                              const SizedBox(height: 10),
                              CustomButton(
                                text: 'Đăng Nhập',
                                onTap: () {
                                  if (_signInFormKey.currentState!.validate()) {
                                    signInUser();
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      const SizedBox(height: 20),
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 1600),
                        opacity: 1.0,
                        child: GestureDetector(
                          onTap: () {
                            // Navigate to the Sign Up page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()),
                            );
                          },
                          child: const Text(
                            "Chưa có tài khoản? Đăng ký ngay",
                            style: TextStyle(
                              color: Colors.orange,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
