import 'package:advanced_app/core/di/dependency_injection.dart';
import 'package:advanced_app/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/app_router.dart';

void main() async {
  //  set up the production environment

  await ScreenUtil.ensureScreenSize();
  
  setupGetIt();
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}
