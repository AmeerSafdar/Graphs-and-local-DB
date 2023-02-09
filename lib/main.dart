// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:task07/bloc/bloc.dart';
import 'package:task07/helper/const/commonkeys.dart';
import 'package:task07/presentation_layer/views/main_screen.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(CommonKeys.DB_NAME);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FieldsBloc>(create: ((context) => FieldsBloc())),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MainScreen(),
        ),
    );
  }
}
