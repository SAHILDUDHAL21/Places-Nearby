import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'app_theme.dart';
import 'hive_helper.dart';
import 'provider/app_provider.dart';
import 'router/app_router.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, __) => ChangeNotifierProvider(
        create: (_) => AppProvider(),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          routerConfig: appRouter,
        ),
      ),
    );
  }
}
