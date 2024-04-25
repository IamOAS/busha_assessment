import 'package:busha_assessment/core/utils/exports.dart';

/// This is a custom text form field widget that can be used to create text form fields.
class CustomTextFormField extends StatelessWidget {
  final TextFormFieldWidget textFormField;
  final String? label;

  const CustomTextFormField({
    super.key,
    this.label,
    required this.textFormField,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...{
          Text(
            label!,
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xff5A5A5A),
            ),
          ),
          4.szbh,
        },
        textFormField,
      ],
    );
  }
}

class TextFormFieldWidget extends StatelessWidget {
  final Key? textFormFieldKey;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final bool enabled;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  const TextFormFieldWidget({
    super.key,
    this.textFormFieldKey,
    this.enabled = true,
    this.validator,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.focusNode,
    this.onChanged,
    this.nextFocusNode,
    this.onFieldSubmitted,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: textFormFieldKey,
      enabled: enabled,
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      focusNode: focusNode,
      cursorColor: CustomColors.primary70,
      onChanged: onChanged ?? (value) {},
      onFieldSubmitted: (value) {
        nextFocusNode?.requestFocus();
        onFieldSubmitted?.call(value);
      },
      textAlignVertical: TextAlignVertical.top,
      style: GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: CustomColors.black.withOpacity(0.95),
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        fillColor: const Color(0xffefefef),
        filled: true,
        border: defaultCustomTextFormFieldBorder(),
        enabledBorder: defaultCustomTextFormFieldBorder(),
        focusedBorder: defaultCustomTextFormFieldBorder(),
        errorBorder: defaultCustomTextFormFieldBorder(),
        errorStyle: GoogleFonts.inter(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: CustomColors.error70,
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.inter(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: CustomColors.black.withOpacity(0.60),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
    );
  }
}

OutlineInputBorder defaultCustomTextFormFieldBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.r),
    borderSide: BorderSide.none,
  );
}
