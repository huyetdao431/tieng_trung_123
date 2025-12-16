import 'package:flutter/material.dart';

import '../core/colors.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key, required this.height});

  final double height;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  TextEditingController email = TextEditingController(text: '');
  TextEditingController lastName = TextEditingController(text: '');
  TextEditingController firstName = TextEditingController(text: '');
  TextEditingController phoneNumber = TextEditingController(text: '');
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
              const Text("Đăng ký", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
              const SizedBox(height: 4),
              const Text('Tạo tài khoản để tiếp tục', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: firstName,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.neutral_200, width: 2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.neutral_300, width: 2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  hintText: 'Họ',
                  hintStyle: TextStyle(color: AppColors.neutral_300),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: lastName,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.neutral_200, width: 2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.neutral_300, width: 2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  hintText: 'Tên',
                  hintStyle: TextStyle(color: AppColors.neutral_300),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.neutral_200, width: 2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.neutral_300, width: 2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  hintText: 'Email',
                  hintStyle: TextStyle(color: AppColors.neutral_300),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  DropdownMenu(
                    onSelected: (value) {
                      print(value);
                    },
                    dropdownMenuEntries: <DropdownMenuEntry<Color>>[
                      DropdownMenuEntry(value: Colors.red, label: 'Việt'),
                      DropdownMenuEntry(value: Colors.yellow, label: 'Trung'),
                    ],
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: phoneNumber,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.neutral_200, width: 2),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.neutral_300, width: 2),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        hintText: 'Số điện thoại',
                        hintStyle: TextStyle(color: AppColors.neutral_300),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(13),
                          child: Text(
                            '+84',
                            style: TextStyle(color: AppColors.neutral_500, fontSize: 15, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextField(
                controller: password,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.neutral_200, width: 2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.neutral_300, width: 2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.red_500, width: 2),
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
              const SizedBox(height: 24),
              InkWell(
                onTap: () {
                  print('register');
                },
                child: Container(
                  height: 64,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(32), color: Colors.green),
                  child: Text(
                    'Đăng ký',
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
