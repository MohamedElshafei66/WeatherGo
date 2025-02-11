import 'package:flutter/material.dart';
import 'package:weather_go/core/utils/app_color.dart';
import 'package:weather_go/core/utils/app_style.dart';

class CustomeTextField extends StatefulWidget {
  const CustomeTextField(
      {super.key,
        required this.hintText,
        required this.controller,
        this.perfixIcon,
        this.suffixIcon,
        this.isPassword = false
      });

  final String hintText;
  final Widget? perfixIcon;
  final Widget? suffixIcon;
  final bool isPassword;
  final TextEditingController controller;

  @override
  State<CustomeTextField> createState() => _CustomeTextFieldState();
}

class _CustomeTextFieldState extends State<CustomeTextField> {
  bool obscureText = true;
  void hidePass(){
    setState(() {
      obscureText = !obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:widget.controller,
      obscureText: widget.isPassword ? obscureText : false,
      cursorColor:AppColors.darkestBlue,
      decoration: InputDecoration(
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        suffixIcon: widget.isPassword ?
        IconButton(
          icon: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed:hidePass,
        ) : null,
        prefixIcon: widget.perfixIcon,
        prefixIconColor:AppColors.darkestBlue,
        suffixIconColor:AppColors.darkestBlue,
        hintText: widget.hintText,
        hintStyle:AppStyle.medium18(context),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(width:1, color:Colors.grey));
  }
}
