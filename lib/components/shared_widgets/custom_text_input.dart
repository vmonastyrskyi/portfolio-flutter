import 'package:flutter/material.dart';
import 'package:portfolio/components/theme/app_colors.dart';

class CustomTextInput extends StatefulWidget {
  const CustomTextInput({
    super.key,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.textAlign = TextAlign.start,
    this.labelText,
    this.minLines,
    this.maxLines,
  });

  final TextEditingController? controller;
  final FormFieldValidator<String?>? validator;
  final TextInputType keyboardType;
  final TextAlign textAlign;
  final String? labelText;
  final int? minLines;
  final int? maxLines;

  @override
  State<CustomTextInput> createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      controller: widget.controller,
      validator: widget.validator,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      textAlign: widget.textAlign,
      keyboardType: widget.keyboardType,
      cursorColor: context.appColors.primaryColor,
      cursorWidth: 2,
      style: TextStyle(
        color: context.appColors.primaryTextColor,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
        fontSize: 14.0,
        height: 1.5,
      ),
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: context.appColors.primaryTextColor,
          fontWeight: FontWeight.w500,
          fontFamily: 'Poppins',
          fontSize: 14.0,
        ),
        floatingLabelStyle: TextStyle(
          color: context.appColors.primaryColor,
          fontWeight: FontWeight.w500,
          fontFamily: 'Poppins',
          fontSize: 16.0,
        ),
        errorStyle: TextStyle(
          color: context.appColors.errorColor,
          fontWeight: FontWeight.w500,
          fontFamily: 'Poppins',
          fontSize: 14.0,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 18.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: context.appColors.primaryTextColor,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: context.appColors.primaryTextColor,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: context.appColors.primaryColor,
            width: 2.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: context.appColors.errorColor,
            width: 2.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: context.appColors.errorColor,
            width: 2.0,
          ),
        ),
      ),
      autovalidateMode: _focusNode.hasFocus
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
