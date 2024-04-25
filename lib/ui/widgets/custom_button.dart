import 'package:busha_assessment/core/utils/exports.dart';

/// A custom button widget.
class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final Color? buttonColor;
  final Color? appProgressIndicatorColor;
  final Color? textColor;
  final bool? isLoading;

  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
    this.buttonColor,
    this.isLoading,
    this.appProgressIndicatorColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(5),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(buttonColor ?? CustomColors.primary70),
      ),
      child: Padding(
        padding: 16.vp,
        child: Center(
          child: isLoading != true
              ? Text(
                  text,
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: CustomColors.backgroundOnLight,
                  ),
                )
              : SizedBox(
                  height: 20.h,
                  width: 20.h,
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor: appProgressIndicatorColor ?? CustomColors.backgroundOnLight,
                  ),
                ),
        ),
      ),
    );
  }
}

/// A custom button that listens to changes in a list of text editing controllers.
class CustomListenableButton extends StatelessWidget {
  final List<TextEditingController> textEditingControllers;
  final bool isLoading;
  final VoidCallback onTap;
  final String text;
  final GlobalKey<FormState> formKey;
  final bool? otherValidation;

  const CustomListenableButton({
    super.key,
    required this.textEditingControllers,
    required this.isLoading,
    required this.onTap,
    required this.text,
    required this.formKey,
    this.otherValidation,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge(textEditingControllers),
      builder: (context, child) {
        // Check if all text fields are not empty
        bool allTextFieldsNotEmpty() {
          return textEditingControllers.every((element) => element.text.isNotEmpty);
        }

        // Check if the form is valid
        bool isValid() {
          if (otherValidation != false && allTextFieldsNotEmpty()) {
            return true;
          }
          return false;
        }

        return CustomButton(
          isLoading: isLoading,
          onTap: () {
            if (isValid() && formKey.currentState!.validate() && !isLoading) {
              if (!FocusScope.of(context).hasPrimaryFocus) {
                FocusScope.of(context).unfocus();
              }
              onTap();
            }
          },
          buttonColor: isValid() ? CustomColors.primary70 : const Color(0xffACA6AF), // Checks if the form is valid and changes the button color
          text: text,
        );
      },
    );
  }
}
