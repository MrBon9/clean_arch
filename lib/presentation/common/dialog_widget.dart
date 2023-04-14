import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:tilt/app/app.dart';

class DialogWidget {
  static bool _dialogIsVisible(BuildContext context) {
    bool isVisible = false;
    Navigator.popUntil(context, (route) {
      isVisible = route is PopupRoute;

      return !isVisible;
    });

    return isVisible;
  }

  static void get hideLoadingDialog {
    if (_dialogIsVisible(NavigationUtil.currentContext!)) {
      Navigator.of(NavigationUtil.currentContext!).pop();
    }
  }

  // ignore: long-method
  static void showLoadingDialog(BuildContext context) async {
    final loadingDialog = Stack(
      children: const [
        Center(
          child: CircularProgressIndicator(
            strokeWidth: 6,
            color: ColorsManager.amberFFEF25,
          ),
        ),
      ],
    );

    if (!_dialogIsVisible(NavigationUtil.currentContext!)) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return loadingDialog;
        },
      );
    }
  }

  static void showSuccessDialog(
    BuildContext context, {
    required String content,
    void Function()? onPressed,
  }) async {
    final successDialogWidget = AlertDialog(
      backgroundColor: Colors.grey[850],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(32.0),
        ),
      ),
      title: Center(
        child: Text(
          'Success',
          style: StyleManager.poppins16.copyWith(
            color: ColorsManager.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 16.h,
      ),
      content: Text(
        content,
        style: StyleManager.poppins14.copyWith(
          color: ColorsManager.white,
        ),
        textAlign: TextAlign.center,
      ),
      actionsPadding: EdgeInsets.only(bottom: 24.h),
      actions: [
        Center(
          child: TextButton(
            style: TextButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              shape: const RoundedRectangleBorder(
                side: BorderSide(
                  color: ColorsManager.amberFFEF25,
                  width: 2,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(32.0),
                ),
              ),
            ),
            onPressed: onPressed ?? () => Navigator.of(context).pop(false),
            child: const Text(
              "OK",
              style: TextStyle(
                color: ColorsManager.amberFFEF25,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );

    if (!_dialogIsVisible(NavigationUtil.currentContext!)) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return successDialogWidget;
        },
      );
    }
  }

  // ignore: long-method
  static void showWarningDialog(
    BuildContext context, {
    required String content,
    String? buttonText,
    void Function()? onPressed,
  }) async {
    final warningDialogWidget = AlertDialog(
      backgroundColor: Colors.grey[850],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(32.0),
        ),
      ),
      title: Center(
        child: Text(
          'Warning',
          style: StyleManager.poppins16.copyWith(
            color: ColorsManager.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 16.h,
      ),
      content: Text(
        content,
        style: StyleManager.poppins14.copyWith(
          color: ColorsManager.white,
        ),
        textAlign: TextAlign.center,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: TextButton(
              style: TextButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                shape: const RoundedRectangleBorder(
                  side: BorderSide(
                    color: ColorsManager.amberFFEF25,
                    width: 2,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(32.0),
                  ),
                ),
              ),
              onPressed: onPressed ?? () => Navigator.of(context).pop(false),
              child: Text(
                buttonText ?? "Cancel",
                style: const TextStyle(
                  color: ColorsManager.amberFFEF25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    );

    if (!_dialogIsVisible(NavigationUtil.currentContext!)) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return warningDialogWidget;
        },
      );
    }
  }

  // ignore: long-method
  static Future<bool> showConfirmDialog(
    BuildContext context, {
    required String title,
    required String content,
    void Function()? onPressed,
  }) async {
    final showConfirmDialog = AlertDialog(
      backgroundColor: Colors.grey[850],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(32.0),
        ),
      ),
      title: Center(
        child: Text(
          title,
          style: StyleManager.poppins16.copyWith(
            color: ColorsManager.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 16.h,
      ),
      content: Text(
        content,
        style: StyleManager.poppins14.copyWith(
          color: ColorsManager.white,
        ),
        textAlign: TextAlign.center,
      ),
      actionsPadding: EdgeInsets.only(bottom: 24.h),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                shape: const RoundedRectangleBorder(
                  side: BorderSide(
                    color: ColorsManager.amberFFEF25,
                    width: 2,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(32.0),
                  ),
                ),
              ),
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text(
                "Cancel",
                style: TextStyle(
                  color: ColorsManager.amberFFEF25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: ColorsManager.amberFFEF25,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(32.0),
                  ),
                ),
              ),
              onPressed: onPressed ?? () => Navigator.of(context).pop(true),
              child: const Text(
                "Yes",
                style: TextStyle(
                  color: ColorsManager.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    );

    return await showDialog<bool>(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return showConfirmDialog;
          },
        ) ??
        false;
  }

  // ignore: long-method
  static Future<bool> showError(
    BuildContext context, {
    required String title,
    required String content,
    void Function()? onPressed,
  }) async {
    final showConfirmDialog = AlertDialog(
      backgroundColor: Colors.grey[850],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(32.0),
        ),
      ),
      title: Center(
        child: Text(
          title,
          style: StyleManager.poppins16.copyWith(
            color: ColorsManager.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 16.h,
      ),
      content: Text(
        content,
        style: StyleManager.poppins14.copyWith(
          color: ColorsManager.white,
        ),
        textAlign: TextAlign.center,
      ),
      actionsPadding: EdgeInsets.only(bottom: 24.h),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                shape: const RoundedRectangleBorder(
                  side: BorderSide(
                    color: ColorsManager.amberFFEF25,
                    width: 2,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(32.0),
                  ),
                ),
              ),
              onPressed: onPressed ?? () => Navigator.of(context).pop(false),
              child: const Text(
                "Cancel",
                style: TextStyle(
                  color: ColorsManager.amberFFEF25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    );

    return await showDialog<bool>(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return showConfirmDialog;
          },
        ) ??
        false;
  }

  // ignore: long-method
  static void showSigningInDialog(BuildContext context) async {
    final warningDialogWidget = AlertDialog(
      backgroundColor: Colors.grey[850],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(32.0),
        ),
      ),
      // title: const Center(
      //   child: CircularProgressIndicator(
      //     strokeWidth: 6,
      //     color: ColorsManager.amberFFEF25,
      //   ),
      // ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 16.h,
      ),
      content: SizedBox(
        height: 150.sp,
        width: MediaQuery.of(context).size.width * 0.85,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            const Center(
              child: CircularProgressIndicator(
                strokeWidth: 6,
                color: ColorsManager.white,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                "Signing in...",
                style: StyleManager.poppins21.copyWith(
                  color: ColorsManager.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                "Please wait",
                style: StyleManager.poppins14.copyWith(
                  color: ColorsManager.grey888888,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      // actions: [],
    );

    if (!_dialogIsVisible(NavigationUtil.currentContext!)) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return warningDialogWidget;
        },
      );
    }
  }

  // ignore: long-method
  static void showWarningBottomModalSheet(
    BuildContext context, {
    required String content,
    required String yesButtonText,
    void Function()? onPressed,
  }) async {
    return await showMaterialModalBottomSheet(
      expand: false,
      bounce: false,
      isDismissible: false,
      backgroundColor: Colors.transparent,
      context: context,
      enableDrag: false,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(AppConstant.mediumPadding),
          clipBehavior: Clip.antiAlias,
          height: 232,
          decoration: BoxDecoration(
            color: ColorsManager.black262626,
            borderRadius: BorderRadius.circular(32.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Reached Video Limit',
                style: StyleManager.poppins20.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: AppConstant.smallPadding),
              Text(
                content,
                style: StyleManager.poppins14.copyWith(
                  color: const Color.fromRGBO(255, 255, 255, 0.6),
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppConstant.mediumPadding * 2.5),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 12,
                        ),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(32.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context)
                          ..pop()
                          ..pop()
                          ..pop();
                      },
                      child: Text(
                        'Cancel',
                        style: StyleManager.poppins14.copyWith(
                          color: const Color.fromRGBO(255, 255, 255, 0.6),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: AppConstant.largePadding,
                  ),
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: ColorsManager.amberFFEF25,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 12,
                        ),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(32.0),
                          ),
                        ),
                      ),
                      onPressed: onPressed ?? () => Navigator.of(context).pop(),
                      child: Text(
                        yesButtonText,
                        style: StyleManager.poppins14.copyWith(
                          color: ColorsManager.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
