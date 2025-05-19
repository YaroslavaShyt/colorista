import 'package:colorista/core/service_locator.dart';
import 'package:colorista/presentation/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );

  ServiceLocator().init();

  runApp(App());
}
