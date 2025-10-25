import 'package:aqar/core/constants/aqar_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:aqar/core/constants/aqar_colors.dart';

class AqarTextFormField extends StatelessWidget {
  final TextInputType inputType;
  final TextEditingController controller;
  final VoidCallback? onSubmit;
  final String? label;
  final String? hint;
  final bool isObscureText, isDisabeldBoarder, isEnabled, isReadOnly;
  final int? maxLength;
  final IconData? prefixIcon;
  final double? height;
  final double? width;
  final double? borderRadius;
  final IconData? suffixIcon;
  final VoidCallback? suffixPressed;
  final Function(String?)? validator;
  final TextAlign textAlign;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  final double borderWidth;
  final Color borderColor;
  final Color? fillColor, hintColor;
  final int? maxLines, minLines;
  final TextStyle? textStyle;
  final Iterable<String>? autofillHints;

  const AqarTextFormField(
      {super.key,
      required this.inputType,
      required this.controller,
      this.onSubmit,
      this.label,
      this.hint,
      this.prefixIcon,
      this.isObscureText = false,
      this.height,
      this.textAlign = TextAlign.start,
      this.maxLength,
      this.width = double.infinity,
      this.suffixIcon,
      this.suffixPressed,
      this.validator,
      this.inputFormatters,
      this.onChanged,
      this.borderRadius = 12,
      this.borderWidth = 1,
      this.borderColor = AqarColors.light,
      this.fillColor,
      this.textStyle,
      this.autofillHints,
      this.maxLines,
      this.minLines,
      this.hintColor,
      this.isDisabeldBoarder = false,
      this.isEnabled = true,
      this.isReadOnly = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        autofillHints: autofillHints,
        controller: controller,
        obscureText: isObscureText,
        maxLength: maxLength,
        maxLines: maxLines,
        minLines: minLines,
        validator: (value) => validator?.call(value),
        inputFormatters: inputFormatters,
        enabled: isEnabled,
        readOnly: isReadOnly,
        keyboardType: inputType,
        textAlign: textAlign,
        style: textStyle,
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
        decoration: InputDecoration(
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          suffixIcon: suffixIcon != null
              ? IconButton(
                  onPressed: suffixPressed,
                  icon: Icon(suffixIcon),
                )
              : null,
          labelText: label,
          contentPadding: EdgeInsets.only(top: AqarSizes.md),
          hintStyle: TextStyle(color: hintColor),
          hintText: hint,
          fillColor: fillColor,
          border: isDisabeldBoarder
              ? InputBorder.none
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 0),
                  borderSide:
                      BorderSide(color: borderColor, width: borderWidth),
                ),
          enabledBorder: isDisabeldBoarder
              ? InputBorder.none
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 0),
                  borderSide:
                      BorderSide(color: borderColor, width: borderWidth),
                ),
          focusedBorder: isDisabeldBoarder
              ? InputBorder.none
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 0),
                  borderSide:
                      BorderSide(color: borderColor, width: borderWidth),
                ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
