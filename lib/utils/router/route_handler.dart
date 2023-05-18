import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

abstract class Navigation {
  /// This method navigates to the route with the option to go back.
  /// Input: [routeName] name of the screen to which we are routeing.
  /// Output: [bool] tells user that the operation is performed successfully.
  bool navigate<T>(String routeName,
      {T? arguments, Map<String, String>? parameters});

  /// This method navigates to the route by removing the previous route from the stack.
  /// Input: [routeName] name of the screen to which we are routeing.
  /// Output: [bool] tells user that the operation is performed successfully.
  bool navigateReplacement(String routeName);

  /// This method navigates to the route by removing all previous routes from the stack.
  /// Input: [routeName] name of the screen to which we are routeing.
  /// Output: [bool] tells user that the operation is performed successfully.
  bool navigateAllReplacement(String routeName);

  // This method removes the route from the stack and go back to the previous route.
  /// Output: [bool] tells user that the operation is performed successfully.
  bool goBack();

  /// this method Calls pop several times in the stack until predicate returns true
  /// Output: [bool] tells user that the operation is performed successfully.
  bool popUntil(String routeName);
}

class NavigationImpl extends Navigation {
  NavigationImpl();

  @override
  bool navigate<T>(String routeName,
      {T? arguments, Map<String, String>? parameters}) {
    debugPrint("PARAMS: $parameters");
    Get.toNamed(routeName, arguments: arguments, parameters: parameters);
    return true;
  }

  @override
  bool goBack() {
    Get.back();
    return true;
  }

  @override
  bool navigateReplacement(String routeName) {
    Get.offNamed(routeName);
    return true;
  }

  @override
  bool popUntil(String routeName) {
    Get.until((route) => Get.currentRoute == routeName);
    return true;
  }

  @override
  bool navigateAllReplacement(String routeName) {
    Get.offAllNamed(routeName);
    return true;
  }
}
