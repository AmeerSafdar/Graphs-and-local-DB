// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:task07/bloc/add_screen_bloc.dart/add_screen_bloc.dart';
import 'package:task07/bloc/main_screen_bloc.dart/main_screen_bloc.dart';
import 'package:task07/helper/const/commonkeys.dart';
import 'package:task07/helper/const/constants.dart';
import 'package:task07/route_generator.dart';
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(CommonKeys.DB_NAME);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainScreenBloc>(create: ((context) => MainScreenBloc())),
        BlocProvider<AddScreenBloc>(create: ((context) => AddScreenBloc())),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        ),
    );
  }
}
