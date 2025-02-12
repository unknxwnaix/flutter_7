import 'package:auto/features/app.dart';
import 'package:flutter/material.dart';

import 'dj/service.dart';

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const App());
}