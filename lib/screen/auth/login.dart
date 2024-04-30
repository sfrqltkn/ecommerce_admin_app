import 'package:ecommerce_admin_app/widgets/app_name_text.dart';
import 'package:ecommerce_admin_app/widgets/title_text.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: const Scaffold(
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 60),
                AppNameTextWidget(fontSize: 30),
                SizedBox(height: 60),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TitleTextWidget(label: "Welcome Back"),
                ),
                SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
