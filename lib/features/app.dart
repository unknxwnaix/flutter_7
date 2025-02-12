import 'package:auto/dj/service.dart';
import 'package:auto/features/home/presentation/state/home_controller.dart';
import 'package:auto/features/home/presentation/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: init(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return MaterialApp(
            home: ChangeNotifierProvider(
              create: (context) => service<HomeController>(),
              child: const Home(),
            ),
          );
        }
      },
    );
  }
}
