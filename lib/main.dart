import 'package:bdl_test/ui/components/bottom_nav_bar.dart';
import 'package:bdl_test/design/theme.dart';
import 'package:bdl_test/ui/pages/landing_page.dart';
import 'package:bdl_test/ui/components/panther_scaffold.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BDLTestApp());
}

class BDLTestApp extends StatelessWidget {
  const BDLTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: BDLThemes.appTheme,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100, // Set this height
          flexibleSpace: const PantherScaffold(),
        ),
        bottomNavigationBar: BDLBottomNavBar(
          onTap: (index) {
            // page navigation
          },
        ),
        body: const LandingPage(),
      ),
    );
  }
}
