import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tieng_trung_123/commons/widgets/image.dart';
import 'package:tieng_trung_123/core/colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../commons/helper.dart';
import '../commons/widgets/hint_text.dart';
import '../commons/widgets/rounded_image.dart';

class AccountSettingScreen extends StatefulWidget {
  static const String route = 'AccountSettingScreen';

  const AccountSettingScreen({super.key});

  @override
  State<AccountSettingScreen> createState() => _AccountSettingScreenState();
}

class _AccountSettingScreenState extends State<AccountSettingScreen> {
  late TextEditingController name;
  late TextEditingController username;

  final _formKey = GlobalKey<FormState>();

  final Map<String, String> userData = {'name': 'Long Anh', 'username': 'octopus1212', 'gender': 'Nữ'};

  final List<String> genderItems = ['Nam', 'Nữ', 'Khác'];
  late String selectedItem;

  File? fileImage;

  Future<File?> showImagePickerBottomSheet(BuildContext context) async {
    return showModalBottomSheet<File?>(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (BuildContext context) {
        double screenWidth = MediaQuery.sizeOf(context).width;

        Future<void> pickImage(ImageSource source) async {
          final ImagePicker picker = ImagePicker();
          try {
            final XFile? pickedFile = await picker.pickImage(source: source, imageQuality: 80);

            if (context.mounted) {
              Navigator.of(context).pop(pickedFile != null ? File(pickedFile.path) : null);
            }
          } catch (e) {
            debugPrint("Lỗi chọn ảnh: $e");
            if (context.mounted) Navigator.of(context).pop(null);
          }
        }

        return SizedBox(
          height: 180,
          width: screenWidth,
          child: Column(
            children: [
              const SizedBox(height: 12),
              Container(
                height: 5,
                width: 80,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(32), color: AppColors.neutral_300),
              ),
              const SizedBox(height: 24),
              GestureDetector(
                onTap: () => pickImage(ImageSource.camera),
                child: Container(
                  height: 48,
                  width: screenWidth * 0.5,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(43), color: AppColors.primary_500),
                  child: Text(
                    'Máy ảnh',
                    style: TextStyle(color: AppColors.neutral_0, fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              GestureDetector(
                onTap: () => pickImage(ImageSource.gallery),
                child: Container(
                  height: 48,
                  width: screenWidth * 0.5,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(43), color: AppColors.primary_500),
                  child: Text(
                    'Thư viện',
                    style: TextStyle(color: AppColors.neutral_0, fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name = TextEditingController(text: userData['name']);
    username = TextEditingController(text: userData['username']);
    selectedItem = userData['gender']!;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tài khoản',
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
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 12, 20, 0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        fileImage == null
                            ? image(size: 80, assetPath: 'assets/images/avatar.png')
                            : Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(shape: BoxShape.circle),
                                clipBehavior: Clip.hardEdge,
                                child: Image.file(fileImage!, fit: BoxFit.cover),
                              ),
                        const SizedBox(height: 12),
                        GestureDetector(
                          onTap: () async {
                            fileImage = await showImagePickerBottomSheet(context);
                            setState(() {});
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                            decoration: BoxDecoration(color: AppColors.primary_200, borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                image(size: 18, assetPath: 'assets/icons/camera.png'),
                                const SizedBox(width: 8),
                                Text(
                                  'Thay đổi ảnh đại diện',
                                  style: TextStyle(color: AppColors.primary_500, fontSize: 12, fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    editableInfoField(title: 'Tên', textEditingController: name),
                    const SizedBox(height: 12),
                    editableInfoField(title: 'Tên', textEditingController: username),
                    const SizedBox(height: 12),
                    Column(
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
                            Text(
                              'Giới tính',
                              style: TextStyle(color: AppColors.neutral_500, fontSize: 12, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        DropdownButtonFormField2<String>(
                          isExpanded: true,
                          value: selectedItem,
                          style: TextStyle(color: AppColors.neutral_500, fontSize: 14, fontWeight: FontWeight.w400),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(vertical: 14),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.neutral_200, width: 2),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.neutral_400, width: 2),
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          hint: const Text('Select Your Gender', style: TextStyle(fontSize: 14)),
                          items: genderItems
                              .map(
                                (item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(item, style: const TextStyle(fontSize: 14)),
                                ),
                              )
                              .toList(),
                          validator: (value) {
                            if (value == null) {
                              return 'Please select gender.';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              selectedItem = value!;
                            });
                          },
                          onSaved: (value) {
                            selectedItem = value.toString();
                          },
                          buttonStyleData: const ButtonStyleData(padding: EdgeInsets.only(right: 8)),
                          iconStyleData: const IconStyleData(icon: Icon(Icons.arrow_drop_down, color: Colors.black45), iconSize: 24),
                          dropdownStyleData: DropdownStyleData(decoration: BoxDecoration(borderRadius: BorderRadius.circular(15))),
                          menuItemStyleData: const MenuItemStyleData(padding: EdgeInsets.symmetric(horizontal: 16)),
                        ),
                      ],
                    ),
                    // editableInfoField(title: 'Giới tính', textEditingController: gender),
                    const SizedBox(height: 12),
                    unEditableInfoField(width: width - 40, title: 'Hình thức đăng nhập', content: 'Email'),
                    const SizedBox(height: 12),
                    unEditableInfoField(width: width - 40, title: 'Email', content: 'maihm@techlead.com'),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: width / 3.5,
            right: width / 3.5,
            child: (name.text == userData['name'] && username.text == userData['username'] && selectedItem == userData['gender'])
                ? Container(
                    height: 48,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(43), color: AppColors.neutral_200),
                    alignment: Alignment.center,
                    child: Text(
                      'Lưu',
                      style: TextStyle(color: AppColors.neutral_300, fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          userData['name'] = name.text;
                          userData['username'] = username.text;
                          userData['gender'] = selectedItem;
                        });
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

  Widget editableInfoField({required String title, required TextEditingController textEditingController}) {
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
            Text(
              title,
              style: TextStyle(color: AppColors.neutral_500, fontSize: 12, fontWeight: FontWeight.w700),
            ),
          ],
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: textEditingController,
          // focusNode: _emailFocusNode,
          style: TextStyle(color: AppColors.neutral_500, fontSize: 14, fontWeight: FontWeight.w400),
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
          },
          validator: (value) {
            // if (_emailFocusNode.hasFocus) {
            //   return null;
            // }
            // if (value == null || value.isEmpty) {
            //   return 'Vui lòng nhập email';
            // } else if (Helper().isEmailAddress(email: value) == false) {
            //   return 'Vui lòng nhập email đúng định dạng';
            // }
            return null;
          },
        ),
      ],
    );
  }

  Widget unEditableInfoField({required double width, required String title, required String content}) {
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
        const SizedBox(height: 12),
        Container(
          width: width,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColors.neutral_100),
          child: Text(
            content,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.neutral_500),
          ),
        ),
      ],
    );
  }
}
