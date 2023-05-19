import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

abstract class Navigation {
  /// This method navigates to the route with the option to go back.
  /// Input: [routeName] name of the screen to which we are routeing.
  /// Output: [bool] tells user that the operation is performed successfully.
  bool navigate<T>(String routeName,
      {T? arguments, Map<String, String>? parameters});

  // This method removes the route from the stack and go back to the previous route.
  /// Output: [bool] tells user that the operation is performed successfully.
  bool goBack();
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
}
