import 'package:dokan/widget/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class DefaultTextFormField extends StatelessWidget {
  final String text;
  final String imageUrl;
  final bool isvisibleicon;
  TextEditingController controller;
  TextInputType inputType;
  final String emptyMessage;
  final bool obscure;
  VoidCallback obsState;

  DefaultTextFormField(
      {super.key,
      required this.text,
      required this.imageUrl,
      required this.isvisibleicon,
      required this.controller,
      required this.emptyMessage,
      required this.inputType,
      required this.obscure,
      required this.obsState});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      scrollPadding: const EdgeInsets.all(40),
      obscureText: obscure,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle(
            color: MyColors().font, fontSize: 16, fontWeight: FontWeight.w400),
        filled: true,
        fillColor: MyColors().white,
        border: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        suffixIcon: isvisibleicon
            ? obscure
                ? InkWell(
                    onTap: obsState,
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(17),
                        child: SvgPicture.asset(
                          'assets/icons/eye-crossed-svgrepo-com.svg',
                          fit: BoxFit.cover,
                          color: MyColors().font,
                          height: 25,
                          width: 25,
                        ),
                      ),
                    ),
                  )
                : IconButton(
                    onPressed: obsState,
                    icon: Icon(Icons.remove_red_eye_outlined,
                        size: 25, color: MyColors().mainColor),
                  )
            : null,
        prefixIcon: SizedBox(
          // height: 25,
          // width: 25,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SvgPicture.asset(
              imageUrl,
              fit: BoxFit.cover,
              color: MyColors().font,
              height: 25,
              width: 25,
            ),
          ),
        ),
      ),
    );
  }
}

const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(20)),
  borderSide: BorderSide.none,
);
