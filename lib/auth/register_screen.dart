import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tieng_trung_123/auth/mail_confirmation_screen.dart';
import 'package:tieng_trung_123/commons/widgets/clipper.dart';
import 'package:tieng_trung_123/commons/widgets/hint_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tieng_trung_123/models/user.dart';

import '../commons/helper.dart';
import '../commons/widgets/menu_icon.dart';
import '../core/colors.dart';
import '../services/providers/auth_provider/auth_provider.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  static const String route = 'RegisterScreen';

  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController(text: '');
  TextEditingController lastName = TextEditingController(text: '');
  TextEditingController firstName = TextEditingController(text: '');
  TextEditingController phoneNumber = TextEditingController(text: '');
  TextEditingController password = TextEditingController(text: '');

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _lastNameFocusNode = FocusNode();
  final FocusNode _firstNameFocusNode = FocusNode();
  final FocusNode _phoneNumberFocusNode = FocusNode();

  bool isRemember = false;
  bool isObscure = true;
  String iconAsset = 'assets/icons/viet_nam.png';
  String code = '+84';

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
    _firstNameFocusNode.addListener(() {
      setState(() {});
    });
    _lastNameFocusNode.addListener(() {
      setState(() {});
    });
    _phoneNumberFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _phoneNumberFocusNode.dispose();
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
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back),
              color: AppColors.neutral_400,
              style: IconButton.styleFrom(backgroundColor: AppColors.neutral_0),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: screenWidth * 0.75 - 40,
              constraints: BoxConstraints(),
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
              child: Column(
                children: [
                  Column(
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
                      Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: firstName,
                              focusNode: _firstNameFocusNode,
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
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.red_500, width: 2),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                label: hintText('Họ'),
                                floatingLabelBehavior: FloatingLabelBehavior.never,
                                // hintText: 'Họ',
                                // hintStyle: TextStyle(color: AppColors.neutral_300),
                              ),
                              validator: (value) {
                                if (_firstNameFocusNode.hasFocus) {
                                  return null;
                                }
                                if (value == null || value.isEmpty) {
                                  return 'Vui lòng nhập họ';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: lastName,
                              focusNode: _lastNameFocusNode,
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
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.red_500, width: 2),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                label: hintText('Tên'),
                                floatingLabelBehavior: FloatingLabelBehavior.never,
                                // hintText: 'Tên',
                                // hintStyle: TextStyle(color: AppColors.neutral_300),
                              ),
                              validator: (value) {
                                if (_lastNameFocusNode.hasFocus) {
                                  return null;
                                }
                                if (value == null || value.isEmpty) {
                                  return 'Vui lòng nhập tên';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: email,
                              focusNode: _emailFocusNode,
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
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.red_500, width: 2),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                label: hintText('Email'),
                                floatingLabelBehavior: FloatingLabelBehavior.never,
                                // hintText: 'Email',
                                // hintStyle: TextStyle(color: AppColors.neutral_300),
                              ),
                              validator: (value) {
                                if (_emailFocusNode.hasFocus) {
                                  return null;
                                }
                                if (value == null || value.isEmpty) {
                                  return 'Vui lòng nhập email của bạn';
                                } else if (!Helper().isEmailAddress(email: value)) {
                                  return 'Vui lòng nhập email đúng định dạng';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            FormField<String>(
                              validator: (value) {
                                if (_phoneNumberFocusNode.hasFocus) {
                                  return null;
                                }
                                if (phoneNumber.text.isEmpty) {
                                  return 'Vui lòng nhập số điện thoại';
                                } else if (!Helper().isPhoneNumber(phoneNumber: phoneNumber.text)) {
                                  return 'Vui lòng nhập số điện thoại đúng định dạng';
                                }
                                return null;
                              },
                              builder: (FormFieldState<String> state) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(left: 14),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(width: 2, color: AppColors.neutral_200),
                                          ),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 14),
                                                child: SizedBox(width: 24, height: 24, child: Image.asset(iconAsset)),
                                              ),
                                              DropdownButton2<MenuItem>(
                                                customButton: const Icon(Icons.arrow_drop_down, size: 24),
                                                items: [
                                                  ...MenuItems.firstItems.map(
                                                    (item) => DropdownMenuItem<MenuItem>(value: item, child: MenuItems.buildItem(item)),
                                                  ),
                                                ],
                                                onChanged: (value) {
                                                  MenuItems.onChanged(context, value!);
                                                  setState(() {
                                                    iconAsset = value.asset;
                                                    code = value.code;
                                                  });
                                                },
                                                dropdownStyleData: DropdownStyleData(
                                                  width: 160,
                                                  padding: const EdgeInsets.symmetric(vertical: 6),
                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: AppColors.neutral_0),
                                                  offset: const Offset(0, 8),
                                                ),
                                                menuItemStyleData: MenuItemStyleData(
                                                  customHeights: [...List<double>.filled(MenuItems.firstItems.length, 48)],
                                                  padding: const EdgeInsets.only(left: 16, right: 16),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 8),

                                        Expanded(
                                          child: TextFormField(
                                            controller: phoneNumber,
                                            focusNode: _phoneNumberFocusNode,
                                            keyboardType: TextInputType.phone,
                                            onChanged: (value) {
                                              state.didChange(value);
                                            },
                                            decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: state.hasError ? AppColors.red_500 : AppColors.neutral_200, width: 2),
                                                borderRadius: BorderRadius.circular(16),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: state.hasError ? AppColors.red_500 : AppColors.neutral_300, width: 2),
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
                                              label: hintText('Số điện thoại'),
                                              floatingLabelBehavior: FloatingLabelBehavior.never,
                                              prefixIcon: Padding(
                                                padding: const EdgeInsets.all(13),
                                                child: Text(
                                                  code,
                                                  style: TextStyle(color: AppColors.neutral_500, fontSize: 15, fontWeight: FontWeight.w400),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    if (state.hasError)
                                      Padding(
                                        padding: const EdgeInsets.only(top: 6, left: 16),
                                        child: Text(state.errorText!, style: TextStyle(color: AppColors.red_500, fontSize: 12)),
                                      ),
                                  ],
                                );
                              },
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: password,
                              focusNode: _passwordFocusNode,
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
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: AppColors.red_500, width: 2),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                label: hintText('Mật khẩu'),
                                floatingLabelBehavior: FloatingLabelBehavior.never,
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
                                  return 'Vui lòng nhập mật khẩu';
                                } else if (!Helper().isPassword(password: value)) {
                                  return 'Vui lòng nhập mật khẩu đúng định dạng';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 24),
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
                                  await ref
                                      .read(authNotifierProvider.notifier)
                                      .register(
                                        user: User(
                                          id: 'id',
                                          firstName: firstName.text,
                                          lastName: lastName.text,
                                          email: email.text,
                                          password: password.text,
                                          phone: phoneNumber.text,
                                        ),
                                      );
                                  if (context.mounted) {
                                    Navigator.of(context).pushNamed(MailConfirmationScreen.route);
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
                                'Đăng ký',
                                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text.rich(
                        TextSpan(
                          text: 'Đã có tài khoản? ',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.neutral_300),
                          children: [
                            TextSpan(
                              text: 'Quay lại Đăng nhập',
                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.primary_500),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pop(context);
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
