import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:portfolio/components/shared_widgets/custom_button.dart';
import 'package:portfolio/components/shared_widgets/custom_text_input.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/app_strings.dart';
import 'package:portfolio/utils/email_sender.dart';

class ContactForm extends StatelessWidget {
  ContactForm({super.key});

  final GlobalKey<FormState> _contactFormKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _contactFormKey,
      child: Column(
        children: [
          CustomTextInput(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              final emailPattern = RegExp(r'^[\w\-\.]+@([\w]+\.)+[\w]{2,4}$');

              if (value != null) {
                if (value.trim().isEmpty) {
                  return 'The field is required';
                } else if (!emailPattern.hasMatch(value)) {
                  return 'Invalid email address';
                }
              }

              return null;
            },
            hintText: 'Email',
          ),
          const SizedBox(height: 32.0),
          CustomTextInput(
            controller: _subjectController,
            validator: (value) {
              if (value != null && value.trim().isEmpty) {
                return 'The field is required';
              }

              return null;
            },
            hintText: 'Subject',
          ),
          const SizedBox(height: 32.0),
          CustomTextInput(
            controller: _contentController,
            validator: (value) {
              if (value != null && value.trim().isEmpty) {
                return 'The field is required';
              }

              return null;
            },
            keyboardType: TextInputType.multiline,
            hintText: 'Content',
            minLines: 5,
          ),
          const SizedBox(height: 32.0),
          Align(
            alignment: Alignment.centerRight,
            child: CustomButton(
              onPressed: () async {
                FocusManager.instance.primaryFocus?.unfocus();

                if (!_contactFormKey.currentState!.validate()) {
                  return;
                }

                final email = _emailController.text;
                final subject = _subjectController.text;
                final content = _contentController.text;

                final result = await EmailService.send(
                  fromEmail: email,
                  subject: subject,
                  content: content,
                );

                if (result) {
                  _emailController.clear();
                  _subjectController.clear();
                  _contentController.clear();
                }

                final toastMessage = result
                    ? AppStrings.sendEmailSuccess
                    : AppStrings.sendEmailFailure;


                Fluttertoast.showToast(
                  msg: toastMessage,
                  gravity: ToastGravity.BOTTOM,
                  webBgColor: '#0D1730',
                  textColor: AppColors.white,
                  timeInSecForIosWeb: 3,
                  webPosition: 'center',
                );
              },
              width: 128.0,
              height: 48.0,
              text: 'Send',
            ),
          ),
        ],
      ),
    );
  }
}
