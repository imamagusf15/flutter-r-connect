import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_rconnect/app/common/session/session_manager.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');
  await GetStorage.init();

  Get.put<SessionManager>(SessionManagerImpl(), permanent: true);

  runApp(
    GetMaterialApp(
      title: "RConnect",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
