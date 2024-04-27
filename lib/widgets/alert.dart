import 'package:busha_assessment/core/utils/exports.dart';

/// This method displays a custom alert dialog.
Future customAlertDialog({
  required BuildContext context,
  required String message,
  required String title,
}) async {
  await showDialog(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext cxt) {
      return Align(
        alignment: Alignment.center,
        child: Container(
          margin: 32.hp,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
          decoration: BoxDecoration(
            color: const Color(0xffffffff),
            borderRadius: BorderRadius.circular(16.r),
            shape: BoxShape.rectangle,
          ),
          child: SingleChildScrollView(
            child: Material(
              color: const Color(0xffffffff),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Close icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.close),
                      ),
                    ],
                  ),
                  30.szbh,
                  // Title
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w500,
                      color: CustomColors.black.withOpacity(0.95),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  15.szbh,
                  // message
                  Text(
                    message,
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: CustomColors.black.withOpacity(0.60),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  20.szbh,
                  CustomButton(
                    text: 'Okay',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
