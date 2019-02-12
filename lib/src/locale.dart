import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './i10n/messages_all.dart';

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /**
   * 
   * local messages
   */

  String get appTitle {
    return Intl.message('Hello world App',
        name: 'appTitle', desc: 'The application title');
  }

  String get hello {
    return Intl.message('Hello', name: 'hello');
  }

  // buttons
  String get btnSend {
    return Intl.message('Send', name: 'btnSend');
  }

  String get btnCancel {
    return Intl.message('Cancel', name: 'btnCancel');
  }

  String get btnSave {
    return Intl.message('Save', name: 'btnSave');
  }

  String get btnRegister {
    return Intl.message('Register', name: 'btnRegister');
  }

  String get btnLogin {
    return Intl.message('Login', name: 'btnLogin');
  }

  String get btnAgree {
    return Intl.message('Agree', name: 'btnAgree');
  }

  // messages
  String get termsMsg {
    return Intl.message(
        'Read our Privacy terms. Tap "Agree" to accept the terms of services',
        name: 'termsMsg');
  }

  String get enterYourPhoneMsg {
    return Intl.message('Enter your phone number', name: 'enterYourPhoneMsg');
  }

  String get invalidPhoneNumber {
    return Intl.message(
      'phone number is incorrect',
      name: 'invalidPhoneNumber',
    );
  }

  String get enterVerifiCodeMsg {
    return Intl.message('Enter varification code', name: 'enterVerifiCodeMsg');
  }

  String get invalidVerifiCodeMsg {
    return Intl.message('varification code is incorrect',
        name: 'invalidVerifiCodeMsg');
  }

  String get waitResendMsg {
    return Intl.message('Wait 3 mintes to send agine', name: 'waitResendMsg');
  }

  // validation
  String get phoneFormatErr {
    return Intl.message('Please enter a correct phone number',
        name: 'phoneFormatErr');
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar', 'pt'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}
