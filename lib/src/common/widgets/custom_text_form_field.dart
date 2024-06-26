import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loomi_challenge/src/core/data/my_app_enums.dart';

class CustomTextFormField extends StatefulWidget {
  final Function(String) onChanged;
  final TextFormFieldType textFormFieldType;
  final String label;
  final String? initalValue;

  const CustomTextFormField({
    super.key,
    required this.onChanged,
    required this.label,
    required this.textFormFieldType,
    this.initalValue,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late TextEditingController textController;
  late bool obscureText;
  late bool isPasswordField;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(
      text: widget.initalValue,
    );

    isPasswordField = widget.textFormFieldType == TextFormFieldType.password ||
        widget.textFormFieldType == TextFormFieldType.confirmPassword;

    obscureText = isPasswordField;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      obscureText: obscureText,
      onChanged: widget.onChanged,
      keyboardType: getKeyboardType(),
      style: Get.textTheme.bodySmall,
      decoration: InputDecoration(
        suffixIcon: suffixWidget(),
        label: Text(widget.label),
      ),
    );
  }

  Widget? suffixWidget() {
    return isPasswordField
        ? InkWell(
            onTap: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            child: Icon(obscureText
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined),
          )
        : null;
  }

  TextInputType getKeyboardType() {
    switch (widget.textFormFieldType) {
      case TextFormFieldType.email:
        return TextInputType.emailAddress;
      case TextFormFieldType.password:
        return TextInputType.text;
      case TextFormFieldType.name:
      default:
        return TextInputType.text;
    }
  }
}
