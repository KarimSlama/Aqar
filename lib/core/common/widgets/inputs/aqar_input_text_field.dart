import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../constants/aqar_colors.dart';
import '../circulars/circular_container_with_shadow.dart';

class AqarBarInputField extends StatelessWidget {
  final String hintText;
  final bool isClicked, isVoice;
  final VoidCallback? onPressed, onSendPressed;
  final IconData? prefixIcon;
  final TextEditingController controller;
  final int? minLines, maxLines;
  const AqarBarInputField({
    super.key,
    required this.hintText,
    this.isClicked = false,
    this.isVoice = false,
    required this.controller,
    this.onPressed,
    this.prefixIcon,
    this.onSendPressed,
    this.maxLines,
    this.minLines,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: CircularContainerShadow(
            width: double.infinity,
            widget: Row(
              children: [
                isClicked
                    ? IconButton(
                        onPressed: onPressed,
                        icon: Icon(
                          prefixIcon,
                          color: AqarColors.light,
                        ),
                      )
                    : Icon(
                        prefixIcon ?? Iconsax.search_normal,
                        color: AqarColors.light,
                      ),
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    maxLines: maxLines,
                    minLines: minLines,
                    style: const TextStyle(color: AqarColors.silver),
                    decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: TextStyle(
                          color: AqarColors.light, fontWeight: FontWeight.w400),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        CircularContainerShadow(
          containerColor: AqarColors.green,
          widget: IconButton(
            icon: Icon(
              Iconsax.send_2_copy,
              color: AqarColors.white,
            ),
            onPressed: onSendPressed ?? () {},
          ),
        ),
      ],
    );
  }
}
