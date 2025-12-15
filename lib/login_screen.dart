import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String route = 'LoginScreen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController(text: '');
    bool isRemember = false;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(top: 0, left: 0, right: 0, child: Image.asset("assets/images/img.png")),
          Positioned(
            bottom: 20,
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  children: [
                    const Text("Đăng nhập", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    const Text('Nhập email và mật khẩu để đăng nhập'),
                  ],
                ),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                        hintText: 'Email',
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                        hintText: 'Mật khẩu',
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          width: 200,
                          child: CheckboxListTile(
                            value: isRemember,
                            onChanged: (value) {
                              isRemember = true;
                            },
                            title: Text('Nhớ tài khoản'),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            print('go to forget password screen');
                          },
                          child: const Text('Quên mật khẩu'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
