import 'package:flutter/material.dart';

import 'package:tieng_trung_123/commons/widgets/hint_text.dart';
import '../commons/helper.dart';
import '../commons/widgets/rounded_image.dart';
import '../core/colors.dart';

class UpdatePasswordScreen extends StatefulWidget {
  static const String route = 'UpdatePasswordScreen';

  const UpdatePasswordScreen({super.key});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  TextEditingController currPassword = TextEditingController(text: '');
  TextEditingController newPassword = TextEditingController(text: '');
  TextEditingController reTypeNewPassword = TextEditingController(text: '');

  final _formKey = GlobalKey<FormState>();

  final FocusNode _currPasswordFocusNode = FocusNode();
  final FocusNode _newPasswordFocusNode = FocusNode();
  final FocusNode _reTypeNewPasswordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Thay đổi mật khẩu',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.neutral_500),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: roundedImage(size: 16, assetPath: 'assets/images/back_button.png'),
          ),
        ),
        backgroundColor: AppColors.neutral_0,
      ),
      backgroundColor: AppColors.neutral_0,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 12, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 12),
                    editableInfoField(title: 'Mật khẩu hiện tại'),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: currPassword,
                      focusNode: _currPasswordFocusNode,
                      style: TextStyle(color: AppColors.neutral_500, fontSize: 14, fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        label: hintText('Nhập mật khẩu hiện tại'),
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
                      },
                      validator: (value) {
                        //todo: validate old password
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    editableInfoField(title: 'Mật khẩu mới'),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: newPassword,
                      focusNode: _newPasswordFocusNode,
                      style: TextStyle(color: AppColors.neutral_500, fontSize: 14, fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        label: hintText('Nhập mật khẩu mới (ít nhất 8 ký tự)'),
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
                      },
                      validator: (value) {
                        if (_newPasswordFocusNode.hasFocus) {
                          return null;
                        }
                        if (Helper().isPassword(password: value!) == false) {
                          return 'Mật khẩu không đúng định dạng';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    editableInfoField(title: 'Nhập lại mật khẩu mới'),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: reTypeNewPassword,
                      focusNode: _reTypeNewPasswordFocusNode,
                      style: TextStyle(color: AppColors.neutral_500, fontSize: 14, fontWeight: FontWeight.w400),
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
                      ),
                      onChanged: (value) {
                        setState(() {});
                      },
                      validator: (value) {
                        if (_reTypeNewPasswordFocusNode.hasFocus) {
                          return null;
                        }
                        if (newPassword.text != value) {
                          return 'Mật khẩu không khớp';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          !(currPassword.text.isNotEmpty && newPassword.text.isNotEmpty && reTypeNewPassword.text.isNotEmpty)
              ? Positioned(
                  bottom: 40,
                  left: width / 3.5,
                  right: width / 3.5,
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(43), color: AppColors.neutral_200),
                    alignment: Alignment.center,
                    child: Text(
                      'Lưu',
                      style: TextStyle(color: AppColors.neutral_300, fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                )
              : Positioned(
                  bottom: 40,
                  left: width / 3.5,
                  right: width / 3.5,
                  child: GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).pop();
                      }
                    },
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(43), color: AppColors.primary_500),
                      alignment: Alignment.center,
                      child: Text(
                        'Lưu',
                        style: TextStyle(color: AppColors.neutral_0, fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  Widget editableInfoField({required String title}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 4,
              height: 20,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), color: AppColors.primary_500),
            ),
            const SizedBox(width: 8),
            Text.rich(
              TextSpan(
                text: title,
                style: TextStyle(color: AppColors.neutral_500, fontSize: 12, fontWeight: FontWeight.w700),
                children: [
                  TextSpan(
                    text: '*',
                    style: TextStyle(color: AppColors.red_500, fontSize: 12, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
