
import 'package:e_commerce_app/bindings/initial_bindings.dart';
import 'package:e_commerce_app/core/constant/app_theme.dart';
import 'package:e_commerce_app/core/constant/routes.dart';
import 'package:e_commerce_app/core/localization/change_local.dart';
import 'package:e_commerce_app/core/localization/translation.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
  runApp(const MyApp());
  });

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MARKETNA',
      getPages: routes,
      initialRoute: AppRoutes.splash,
      translations: AppTranslation(),
      locale: controller.language,
      initialBinding: InitialBindings(),
      theme: appLightTheme,
    );
  }
}
