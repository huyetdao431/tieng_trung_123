import 'package:flutter/material.dart';

import '../core/colors.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key, required this.height});
  final double height;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController email = TextEditingController(text: '');
  TextEditingController password = TextEditingController(text: '');
  bool isRemember = false;
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height / 1.4,
      padding: const EdgeInsets.fromLTRB(16, 80, 16, 20),
      // color: Colors.green,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Đăng nhập", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
              const SizedBox(height: 4),
              const Text('Nhập email và mật khẩu để đăng nhập', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                // height: 46,
                child: TextField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.neutral_200, width: 2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: 'Email',
                    hintStyle: TextStyle(color: AppColors.neutral_300),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                // height: 46,
                child: TextField(
                  controller: password,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.neutral_200, width: 2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: 'Mật khẩu',
                    hintStyle: TextStyle(color: AppColors.neutral_300),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                      icon: Icon(isObscure ? Icons.remove_red_eye_outlined : Icons.remove_red_eye, color: Colors.black26),
                    ),
                  ),
                  obscureText: isObscure,
                ),
              ),
              // const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        side: BorderSide(color: AppColors.neutral_200, width: 2),
                        value: isRemember,
                        onChanged: (value) {
                          setState(() {
                            isRemember = !isRemember;
                          });
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isRemember = !isRemember;
                          });
                        },
                        child: Text(
                          'Nhớ tài khoản',
                          style: TextStyle(color: AppColors.neutral_300, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      print('go to forget password screen');
                    },
                    child: Text('Quên mật khẩu', style: TextStyle(color: AppColors.primary_500)),
                  ),
                ],
              ),
              SizedBox(height: widget.height / 5),
              InkWell(
                onTap: () {
                  print('login');
                },
                child: Container(
                  height: 64,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(32), color: Colors.green),
                  child: Text(
                    'Đăng nhập',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Chưa có tài khoản?'),
                  // const SizedBox(width: 4),
                  TextButton(
                    onPressed: () {
                      print('Go to register screen');
                    },
                    child: Text('Đăng ký'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
