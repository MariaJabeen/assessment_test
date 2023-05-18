import 'package:assesment_test/utils/globals.dart';
import 'package:get/get.dart';

class ErrorSnackbar {
  final String message;
  final void Function(SnackbarStatus?)? snackbarStatus;

  const ErrorSnackbar({
    required this.message,
    this.snackbarStatus,
  });

  void showErrorSnackbar({Duration? duration}) {
    if (snackBarIsShown) {
      return;
    }

    snackBarIsShown = true;
    Get.closeAllSnackbars();
    final snackBar = GetSnackBar(
        message: message,
        duration: duration ?? const Duration(seconds: 4),
        snackbarStatus: (status) {
          if (status == SnackbarStatus.CLOSED) {
            snackBarIsShown = false;
          }
        });
    Get.showSnackbar(snackBar);
  }
}
