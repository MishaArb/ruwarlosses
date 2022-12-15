import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



import 'generated/l10n.dart';
import 'logic/chart_bloc.dart';
import 'logic/losses_data_bloc.dart';
import 'logic/date_bloc.dart';
import 'main_statistic_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

var s;
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
        BlocProvider<DateBloc>(
          create: (BuildContext context) => DateBloc(),
        ),
        BlocProvider<LossesDataBloc>(
          create: (BuildContext context) => LossesDataBloc(),
        ),
        BlocProvider<ChartBloc>(
          create: (BuildContext context) => ChartBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'RuWarLosses',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
            Locale('uk', ''), // Spanish, no country code
            Locale('ru', ''), // Spanish, no country code
          ],
        home: const MainStatisticScreen()
        //PeopleLossChartScreen()
        //MainStatisticScreen(),
      ),
    );
  }
}

