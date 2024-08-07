import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:medical_tour/home/home_page.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  usePathUrlStrategy();

  runApp(const MainApp());
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
      initialRoute: '/home',
      onGenerateRoute: (settings) {
        String routeName = settings.name.toString().toLowerCase();
        routeName = routeName.split("?")[0];
        if (routeName.contains("/home")) {
          return _getMaterialPageRoute(settings, "home");
        } else if (routeName == "/") {
          return null;
        } else {
          return _getMaterialPageRoute(settings, "home");
        }
      },
    );
  }

  _getMaterialPageRoute(RouteSettings settings, String routeName) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => HomePage(),
    );
  }
}
