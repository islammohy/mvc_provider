import 'package:flutter/material.dart';
import 'package:mvc_provider/user/user_controller.dart';
import 'package:mvc_provider/user/user_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //------
        ChangeNotifierProvider(
          create: (context) => UserController(),
        )
      ],
      child: const UserView(),
    );
  }
}
