import 'package:advanced_app/core/di/dependency_injection.dart';
import 'package:advanced_app/doc_app.dart';
import 'package:flutter/material.dart';

import 'core/routing/app_router.dart';

void main() {
  setupGetIt();
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}
