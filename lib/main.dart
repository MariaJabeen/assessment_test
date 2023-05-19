import 'package:assesment_test/app/app.dart';
import 'package:assesment_test/utils/dependency_injection/dependency_injection.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection.init();

  runApp(const MyApp());
}
