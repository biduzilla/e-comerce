import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomInput extends StatelessWidget {
  CustomInput({
    super.key,
    this.controller,
    required this.hint,
    this.onChange,
    this.prefix,
    this.suffix,
    this.enabled,
  });

  final TextEditingController? controller;

  final String hint;
  final Widget? prefix;
  final Widget? suffix;

  final bool? enabled;
  final Function(String)? onChange;

  String? erroText;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height / 20,
      // width: MediaQuery.of(context).size.width / 8,
      decoration: BoxDecoration(
        color: Color(0xffEDF2F4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Theme(
          data: Theme.of(context).copyWith(
            primaryColor: Color(0xff2B2D42),
          ),
          child: TextField(
            style: TextStyle(
                color: Color(0xff2B2D42), fontWeight: FontWeight.bold),
            controller: controller,
            onChanged: onChange,
            enabled: enabled,
            decoration: InputDecoration(
              errorText: erroText,
              hintText: hint,
              hintStyle: TextStyle(fontWeight: FontWeight.bold),
              border: InputBorder.none,
              prefixIcon: prefix,
              suffix: suffix,
            ),
            textAlignVertical: TextAlignVertical.center,
          ),
        ),
      ),
    );
  }
}
