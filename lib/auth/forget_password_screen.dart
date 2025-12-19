import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:dashed_divider/dashed_divider.dart';
import 'package:tieng_trung_123/commons/helper.dart';
import 'package:tieng_trung_123/services/repositories/auth_repositories/auth.dart';
import 'package:tieng_trung_123/services/repositories/auth_repositories/auth_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../commons/widgets/clipper.dart';
import '../commons/widgets/hint_text.dart';
import '../core/colors.dart';
import '../services/providers/auth_provider/auth_provider.dart';

class ForgetPasswordScreen extends ConsumerStatefulWidget {
  const ForgetPasswordScreen({super.key});

  static const String route = 'ForgetPasswordScreen';

  @override
  ConsumerState<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends ConsumerState<ForgetPasswordScreen> {
  TextEditingController email = TextEditingController(text: '');
  TextEditingController code = TextEditingController(text: '');
  TextEditingController password = TextEditingController(text: '');
  TextEditingController rePassword = TextEditingController(text: '');

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _rePasswordFocusNode = FocusNode();

  bool passwordObscure = true;
  bool rePasswordObscure = true;

  final _sendEmailFormKey = GlobalKey<FormState>();
  final _updatePasswordFormKey = GlobalKey<FormState>();

  late PageController _pageController;
  int _currentPageIndex = 0;

  int time = 30;
  bool isButtonActive = false;
  Timer? _timer;

  // final Auth auth = AuthImplements();
  // bool isLoading = false;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(oneSec, (Timer timer) {
      if (time == 0) {
        setState(() {
          timer.cancel();
          isButtonActive = true;
        });
      } else {
        setState(() {
          time--;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _emailFocusNode.addListener(() {
      setState(() {});
    });
    _passwordFocusNode.addListener(() {
      setState(() {});
    });
    _rePasswordFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    bool isLoading = authState.isLoading;
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
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    return Scaffold(
      backgroundColor: AppColors.neutral_0,
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
              child: PageView.builder(
                controller: _pageController,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return inputEmail(isLoading);
                    case 1:
                      return inputValidationCode(isLoading);
                    case 2:
                      return inputNewPassword(isLoading);
                    default:
                      return const SizedBox.shrink();
                  }
                },
              ),
              // inputEmail(),
              // inputValidationCode(),
              // inputNewPassword(),
            ),
          ),
        ],
      ),
    );
  }

  Widget inputEmail(bool isLoading) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Quên mật khẩu", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
                const SizedBox(height: 4),
                const Text('Vui lòng nhập email của bạn để đặt lại mật khẩu', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
              ],
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  // height: 46,
                  child: Form(
                    key: _sendEmailFormKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                      ),
                      onChanged: (value) {
                        setState(() {});
                        print(email.text);
                      },
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
                ),
                const SizedBox(height: 12),
              ],
            ),
          ],
        ),
        email.text.isNotEmpty
            ? InkWell(
                onTap: isLoading
                    ? null
                    : () async {
                        if (_sendEmailFormKey.currentState!.validate()) {
                          await ref.read(authNotifierProvider.notifier).sendVerificationCode(email: email.text);
                          if (mounted) {
                            setState(() {
                              _currentPageIndex++;
                            });
                            _pageController.animateToPage(_currentPageIndex, duration: const Duration(milliseconds: 200), curve: Curves.ease);
                            startTimer();
                          }
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
                        'Gửi lại email',
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              )
            : Container(
                height: 48,
                alignment: Alignment.center,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(32), color: AppColors.neutral_200),
                child: Text(
                  'Gửi lại email',
                  style: TextStyle(color: AppColors.neutral_300, fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
      ],
    );
  }

  Widget inputValidationCode(bool isLoading) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Quên mật khẩu", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
            const SizedBox(height: 4),
            Text('Chúng tôi đã gửi liên kết đặt lại đến dungpp@techlead.vn'),
            Text('Nhập mã 5 chữ số được đề cập trong email'),

            const SizedBox(height: 24),
            //input code
            Center(
              child: Pinput(
                length: 5,
                showCursor: true,
                onChanged: (value) {
                  setState(() {
                    code.text = value;
                  });
                },
                onCompleted: (value) async {
                  await ref.read(authNotifierProvider.notifier).verifyOtp(otp: value);
                  if (mounted) {
                    setState(() {
                      _currentPageIndex++;
                    });
                    _pageController.animateToPage(_currentPageIndex, duration: const Duration(milliseconds: 200), curve: Curves.ease);
                  }
                },
              ),
            ),
            const SizedBox(height: 24),
            DashedDivider(color: AppColors.neutral_200, thickness: 2),
            const SizedBox(height: 24),
            //
            Text(
              'Không thấy email?',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.neutral_500),
            ),
            Text.rich(
              TextSpan(
                text: 'Hãy kiểm tra thư mục Spam hoặc nhấn ',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.neutral_500),

                children: [
                  TextSpan(
                    text: 'Gửi lại',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.primary_500),
                  ),
                  TextSpan(
                    text: ' sau 0:$time s.',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.neutral_500),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
        isButtonActive
            ? InkWell(
                onTap: () async {
                  // if (_verifyCodeFormKey.currentState!.validate()) {
                  //   setState(() {
                  //     _currentPageIndex++;
                  //   });
                  //   _pageController.animateToPage(_currentPageIndex, duration: const Duration(milliseconds: 200), curve: Curves.ease);
                  // }
                  await ref.read(authNotifierProvider.notifier).sendEmailConfirmation(email: email.text);
                  setState(() {
                    time = 30;
                  });
                  startTimer();
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
                        'Gửi mã xác nhận',
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              )
            : Container(
                height: 48,
                alignment: Alignment.center,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(32), color: AppColors.neutral_200),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    isLoading
                        ? SizedBox(height: 24, width: 24, child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.neutral_200))
                        : const SizedBox(),
                    isLoading ? const SizedBox(width: 12) : const SizedBox(),
                    Text(
                      'Gửi mã xác nhận',
                      style: TextStyle(color: AppColors.neutral_300, fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
      ],
    );
  }

  Widget inputNewPassword(bool isLoading) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Đặt mật khẩu mới", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
            const SizedBox(height: 4),
            const Text(
              'Tạo mật khẩu mới. Đảm bảo mật khẩu mới này khác với mật khẩu trước đó để bảo mật.',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 24),
            Form(
              key: _updatePasswordFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  TextFormField(
                    controller: password,
                    focusNode: _passwordFocusNode,
                    decoration: InputDecoration(
                      label: hintText('Nhập mật khẩu mới'),
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
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            passwordObscure = !passwordObscure;
                          });
                        },
                        icon: Icon(passwordObscure ? Icons.remove_red_eye_outlined : Icons.remove_red_eye, color: Colors.black26),
                      ),
                    ),
                    obscureText: passwordObscure,
                    validator: (value) {
                      if (_passwordFocusNode.hasFocus) {
                        return null;
                      }
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập mật khẩu';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: rePassword,
                    focusNode: _rePasswordFocusNode,
                    decoration: InputDecoration(
                      label: hintText('Nhập lại mật khẩu mới'),
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
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            rePasswordObscure = !rePasswordObscure;
                          });
                        },
                        icon: Icon(rePasswordObscure ? Icons.remove_red_eye_outlined : Icons.remove_red_eye, color: Colors.black26),
                      ),
                    ),
                    obscureText: rePasswordObscure,
                    validator: (value) {
                      if (_rePasswordFocusNode.hasFocus) {
                        return null;
                      }
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập lại mật khẩu';
                      } else if (value != password.text) {
                        return 'Mật khẩu không khớp';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        InkWell(
          onTap: isLoading
              ? null
              : () async {
                  if (_updatePasswordFormKey.currentState!.validate()) {
                    await ref.read(authNotifierProvider.notifier).updatePassword(email: email.text, password: password.text);
                    if (mounted) {
                      Navigator.of(context).pop();
                    }
                  }
                },
          child: Container(
            height: 48,
            alignment: Alignment.center,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(32), color: AppColors.primary_500),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isLoading ? SizedBox(height: 24, width: 24, child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.neutral_200)) : const SizedBox(),
                isLoading ? const SizedBox(width: 12) : const SizedBox(),
                Text(
                  'Đặt lại mật khẩu',
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
