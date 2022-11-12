import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



import 'logic/chart_data_bloc.dart';
import 'logic/losses_data_bloc.dart';
import 'logic/change_date_bloc.dart';
import 'screens/main_statistic_screen.dart';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}


void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    // systemNavigationBarColor: Colors.red,
    statusBarBrightness: Brightness.dark,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider<ChangeDateBloc>(
          create: (BuildContext context) => ChangeDateBloc(),
        ),
        BlocProvider<LossesDataBloc>(
          create: (BuildContext context) => LossesDataBloc(),
        ),
        BlocProvider<ChartDataBloc>(
          create: (BuildContext context) => ChartDataBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'RuWarLosses',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MainStatisticScreen()
        //PeopleLossChartScreen()
        //MainStatisticScreen(),
      ),
    );
  }
}

