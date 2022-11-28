// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Donate to Army`
  String get helpArmy {
    return Intl.message(
      'Donate to Army',
      name: 'helpArmy',
      desc: '',
      args: [],
    );
  }

  /// `russia's losses`
  String get ruLosses {
    return Intl.message(
      'russia\'s losses',
      name: 'ruLosses',
      desc: '',
      args: [],
    );
  }

  /// `Personnel`
  String get personnel {
    return Intl.message(
      'Personnel',
      name: 'personnel',
      desc: '',
      args: [],
    );
  }

  /// `Tanks`
  String get tanks {
    return Intl.message(
      'Tanks',
      name: 'tanks',
      desc: '',
      args: [],
    );
  }

  /// `Armored combat vehicles`
  String get bbm {
    return Intl.message(
      'Armored combat vehicles',
      name: 'bbm',
      desc: '',
      args: [],
    );
  }

  /// `Artillery systems`
  String get artillery {
    return Intl.message(
      'Artillery systems',
      name: 'artillery',
      desc: '',
      args: [],
    );
  }

  /// `MLRS`
  String get mlrs {
    return Intl.message(
      'MLRS',
      name: 'mlrs',
      desc: '',
      args: [],
    );
  }

  /// `Air defense systems`
  String get ads {
    return Intl.message(
      'Air defense systems',
      name: 'ads',
      desc: '',
      args: [],
    );
  }

  /// `Aircrafts`
  String get aircrafts {
    return Intl.message(
      'Aircrafts',
      name: 'aircrafts',
      desc: '',
      args: [],
    );
  }

  /// `Helicopters`
  String get helicopters {
    return Intl.message(
      'Helicopters',
      name: 'helicopters',
      desc: '',
      args: [],
    );
  }

  /// `Tactical Unmanned Aircraft`
  String get drone {
    return Intl.message(
      'Tactical Unmanned Aircraft',
      name: 'drone',
      desc: '',
      args: [],
    );
  }

  /// `Ship and boasts`
  String get ship {
    return Intl.message(
      'Ship and boasts',
      name: 'ship',
      desc: '',
      args: [],
    );
  }

  /// `Fuel tankers and vehicles`
  String get tankers {
    return Intl.message(
      'Fuel tankers and vehicles',
      name: 'tankers',
      desc: '',
      args: [],
    );
  }

  /// `Quantity per day`
  String get wuantityDay {
    return Intl.message(
      'Quantity per day',
      name: 'wuantityDay',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'uk'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
