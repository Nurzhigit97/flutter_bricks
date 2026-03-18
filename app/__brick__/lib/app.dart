import 'package:flutter/material.dart';
import 'package:{{packageName}}/shared/theme/dark_theme.dart';
import 'package:{{packageName}}/shared/theme/light_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(child: Text('Base App')),
      ),
    );
  }
}
