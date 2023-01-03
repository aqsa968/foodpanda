import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final String? hintText;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final TextEditingController? controller;
  final void Function()? onTap;
  final ValueChanged<String>? onChanged;
  final bool decoration;
  final bool readOnly;
  final bool? showCursor;
  ValueChanged<String>? onFieldSubmitted;


  SearchTextField({
    Key? key,
    this.onTap,
    this.onFieldSubmitted,
    this.contentPadding = const EdgeInsets.only(left: 13),
    this.controller,
    this.suffixIcon,
    this.hintText,
    this.onChanged,
    this.decoration = true,
    this.showCursor,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: decoration ? const EdgeInsets.symmetric(vertical: 9) : null,
      decoration: decoration
          ? const BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Color(0xffE0E0E0),
          ),
        ),
      )
          : null,
      child: TextFormField(
        onFieldSubmitted:onFieldSubmitted,
        onTap: onTap,
        controller: controller,
        onChanged: onChanged,
        readOnly: readOnly,
        showCursor: showCursor,
        decoration: InputDecoration(
          suffixIcon: const Icon(
            CupertinoIcons.search,
            color: Color(0xff818181),
            size: 19,
          ),
          suffixIconConstraints:
          const BoxConstraints.tightFor(height: 36, width: 40),
          contentPadding: contentPadding,
          isDense: true,
          hintText: 'Search',
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 13.5,
            color: Color(0xff818181),
          ),
          filled: true,
          fillColor: const Color(0xffE0E0E0).withOpacity(0.5),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}

class CustomTextField1 extends StatelessWidget {
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? title;
  final EdgeInsetsGeometry? contentPadding;
  final bool obscureText;
  final TextEditingController? controller;
  final Color? fillColor;
  final bool readOnly;
  final bool? showCursor;
  final void Function()? onTap;

  CustomTextField1({
    Key? key,
    this.onTap,
    this.showCursor,
    this.readOnly = false,
    this.fillColor,
    this.contentPadding = const EdgeInsets.fromLTRB(10, 13.5, 10, 13.5),
    this.controller,
    this.suffixIcon,
    this.obscureText = false,
    this.hintText,
    this.prefixIcon,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? "",
          style: const TextStyle(color: Color(0xff818181), fontSize: 12),
        ),
        TextFormField(
          onTap: onTap,
          showCursor: showCursor,
          controller: controller,
          minLines: 3,
          maxLines: null,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
            suffixIcon: suffixIcon,
            // suffixIconConstraints: BoxConstraints.expand(width: 40),
            filled: true,
            fillColor: Colors.white,
            hintText: hintText,
            errorStyle: TextStyle(
              color: Colors.red,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(6),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(6),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(6),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent, width: 1.5),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
      ],
    );
  }
}
