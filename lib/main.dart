// import 'package:express_corner/test_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'Features/test/presentation/views/test_map_view.dart';
// import 'Features/test/presentation/views/test_search_view.dart';
// import 'Features/test/presentation/views/test_view.dart';
import 'binding.dart';
import 'core/localization/changelocal.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await intialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
      translations: MyTranslation(),
      title: 'Express Corner',
      debugShowCheckedModeBanner: false,
      theme: controller.AppTheme,

      locale: const Locale('ar'),
      // locale: controller.language,
      initialBinding: MyBinding(),
      // home: TestSearchView1(),
      getPages: routes,
    );
  }
}
