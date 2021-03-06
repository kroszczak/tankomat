import 'package:flutter/material.dart';
import 'package:tankomat/route_generator.dart';
import 'package:tankomat/utils.dart';

void main() {
  initializeFirebase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Root widget of the application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tankomat',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.black.withOpacity(0),
        ),
      ),
      initialRoute: '/loading',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
