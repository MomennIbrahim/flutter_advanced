import 'package:advanced_app/doc_app.dart';
import 'package:flutter/material.dart';

import 'core/routing/app_router.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();

  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}
