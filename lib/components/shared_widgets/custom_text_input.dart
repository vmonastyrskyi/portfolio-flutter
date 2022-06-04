import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_colors.dart';

class CustomTextInput extends StatefulWidget {
  const CustomTextInput({
    super.key,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.textAlign = TextAlign.start,
    this.hintText,
    this.minLines,
    this.maxLines,
  });

  final TextEditingController? controller;
  final FormFieldValidator<String?>? validator;
  final TextInputType keyboardType;
  final TextAlign textAlign;
  final String? hintText;
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
      cursorColor: AppColors.secondary,
      cursorWidth: 2,
      style: const TextStyle(
        height: 1.5,
        fontSize: 14.0,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        color: AppColors.secondary,
      ),
      decoration: InputDecoration(
        isDense: true,
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          height: 1.75,
          fontSize: 14.0,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          color: Color.fromRGBO(117, 117, 117, 1.0),
        ),
        errorStyle: const TextStyle(
          fontSize: 12.0,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          color: AppColors.error,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 18.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: AppColors.secondary,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: AppColors.secondary,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: AppColors.secondary,
            width: 2.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: AppColors.error,
            width: 2.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: AppColors.error,
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
