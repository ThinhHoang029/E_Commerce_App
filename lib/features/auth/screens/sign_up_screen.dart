import 'package:flutter/material.dart';
import 'package:commerce_flutter_app/common/widgets/custom_button.dart';
import 'package:commerce_flutter_app/common/widgets/custom_textfield.dart';
import 'package:commerce_flutter_app/constants/global_variables.dart';
import 'package:commerce_flutter_app/features/auth/services/auth_service.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _signUpFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Đăng Ký"),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade900,
              Colors.blue.shade800,
              Colors.blue.shade400,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Form(
              key: _signUpFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 80),
                  Center(
                    child: Text(
                      "Tạo Tài Khoản",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  CustomTextField(
                    controller: _nameController,
                    hintText: "Họ và Tên",
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    controller: _emailController,
                    hintText: "Email hoặc Số điện thoại",
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    controller: _passwordController,
                    hintText: "Mật khẩu",
                  ),
                  SizedBox(height: 40),
                  _buildSignUpButton(),
                  SizedBox(height: 20),
                  _buildLoginRedirect(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpButton() {
    return Center(
      child: CustomButton(
        text: 'Đăng Ký',
        onTap: () {
          if (_signUpFormKey.currentState!.validate()) {
            signUpUser();
          }
        },
      ),
    );
  }

  Widget _buildLoginRedirect() {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Text(
          "Đã có tài khoản? Đăng nhập",
          style: TextStyle(
            color: Colors.white,
            decoration: TextDecoration.underline,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
