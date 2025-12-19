import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tieng_trung_123/auth/forget_password_screen.dart';
import 'package:tieng_trung_123/auth/register_screen.dart';
import 'package:tieng_trung_123/commons/helper.dart';
import 'package:tieng_trung_123/commons/widgets/hint_text.dart';
import 'package:tieng_trung_123/services/providers/auth_provider/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tieng_trung_123/services/repositories/hive_repository.dart';

import '../core/colors.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const String route = 'LoginScreen';

  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  late bool isRemember;
  bool isObscure = true;

  // final Auth auth = AuthImplements();
  // bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailFocusNode.addListener(() {
      setState(() {});
    });
    _passwordFocusNode.addListener(() {
      setState(() {});
    });

    var loginInfo = HiveRepository().getLoginInfo();

    email = TextEditingController(text: loginInfo['email'] as String? ?? '');
    password = TextEditingController(text: loginInfo['password'] as String? ?? '');
    isRemember = loginInfo['isRemember'] as bool? ?? false;

    // email = TextEditingController(text: '');
    // password = TextEditingController(text: '');
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = ref.watch(authNotifierProvider);
    bool isLoading = authProvider.isLoading;

    ref.listen(authNotifierProvider, (previous, next) {
      if (next.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${next.error}', style: TextStyle(color: AppColors.neutral_0)),
            backgroundColor: AppColors.red_500,
          ),
        );
      }
    });

    var screenSize = MediaQuery.sizeOf(context);
    double screenHeight = screenSize.height;
    double screenWidth = screenSize.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: screenHeight * 0.25,
            pinned: false,
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(background: Image.asset("assets/images/img.png", fit: BoxFit.cover)),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: screenHeight * 0.75 - 60,
              constraints: BoxConstraints(),
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
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
                      Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              // height: 46,
                              child: TextFormField(
                                controller: email,
                                focusNode: _emailFocusNode,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  label: hintText('Email'),
                                  floatingLabelBehavior: FloatingLabelBehavior.never,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.neutral_200, width: 2),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.neutral_400, width: 2),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.red_500, width: 2),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.red_500, width: 2),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  // hintText: 'Email',
                                  // hintStyle: TextStyle(color: AppColors.neutral_300),
                                ),
                                validator: (value) {
                                  if (_emailFocusNode.hasFocus) {
                                    return null;
                                  }
                                  if (value == null || value.isEmpty) {
                                    return 'Vui lòng nhập email';
                                  } else if (Helper().isEmailAddress(email: value) == false) {
                                    return 'Vui lòng nhập email đúng định dạng';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(height: 12),
                            SizedBox(
                              // height: 46,
                              child: TextFormField(
                                controller: password,
                                focusNode: _passwordFocusNode,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  label: hintText('Mật khẩu'),
                                  floatingLabelBehavior: FloatingLabelBehavior.never,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.neutral_200, width: 2),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.neutral_400, width: 2),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.red_500, width: 2),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.red_500, width: 2),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  // hintText: 'Mật khẩu',
                                  // hintStyle: TextStyle(color: AppColors.neutral_300),
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
                                validator: (value) {
                                  if (_passwordFocusNode.hasFocus) {
                                    return null;
                                  }
                                  if (value == null || value.isEmpty) {
                                    return 'Vui lòng nhập mật khẩu của bạn';
                                  }
                                  return null;
                                },
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
                                    Navigator.of(context).pushNamed(ForgetPasswordScreen.route);
                                  },
                                  child: Text('Quên mật khẩu', style: TextStyle(color: AppColors.primary_500)),
                                ),
                              ],
                            ),
                            SizedBox(height: 32),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: isLoading
                            ? null
                            : () async {
                                FocusScope.of(context).unfocus();
                                if (_formKey.currentState!.validate()) {
                                  if (isRemember) {
                                    HiveRepository().saveLoginInfo(isRemember: isRemember, email: email.text, password: password.text);
                                  } else {
                                    HiveRepository().clear();
                                  }
                                  await ref.read(authNotifierProvider.notifier).login(email: email.text, password: password.text);
                                }
                              },
                        child: Container(
                          height: 48,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(32), color: AppColors.primary_500),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              isLoading
                                  ? SizedBox(height: 24, width: 24, child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.neutral_200))
                                  : const SizedBox(),
                              isLoading ? const SizedBox(width: 12) : const SizedBox(),
                              Text(
                                'Đăng nhập',
                                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text.rich(
                        TextSpan(
                          text: 'Chưa có tài khoản? ',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.neutral_300),
                          children: [
                            TextSpan(
                              text: 'Đăng ký',
                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.primary_500),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).pushNamed(RegisterScreen.route);
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
