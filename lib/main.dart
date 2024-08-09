import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_tour/home/consultation_page.dart';
import 'package:medical_tour/home/home_page.dart';
import 'package:medical_tour/home/success_page.dart';
import 'package:medical_tour/utils/analytics_manager.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  await _initAmplitude();
  FlutterNativeSplash.remove();

  runApp(const MainApp());
}

Future<void> _initAmplitude() async {
  try {
    await AnalyticsManager.instance.init();
    await AnalyticsManager.instance.amplitude.logEvent("TestingLaunch");
  } catch (e) {
    print(e);
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return ResponsiveBreakpoints.builder(child: child!, breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K')
        ]);
      },
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      initialRoute: '/consultation',
      onGenerateRoute: (settings) {
        String routeName = settings.name.toString().toLowerCase();
        routeName = routeName.split("?")[0];
        if (routeName.contains("/home")) {
          return _getMaterialPageRoute(settings, "home");
        } else if (routeName == "/") {
          return null;
        } else if (routeName == "/success") {
          return _getMaterialPageRoute(settings, "success");
        } else {
          return _getMaterialPageRoute(settings, "home");
        }
      },
    );
  }

  _getMaterialPageRoute(RouteSettings settings, String routeName) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => routeName == "success" ? SuccessPage() : ConsultationPage(),
    );
  }
}
