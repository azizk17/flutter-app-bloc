import 'package:flutter/material.dart';
import 'dart:io';
import './screens/home_screen.dart';
import './screens/articles/articles.dart';
import './screens/welcome/welcome_screen.dart';
import './providers/providers.dart' show ArticlesProvider;
import './screens/auth/login_screen.dart';
import './screens/auth/phone_verifivation.dart';
import 'package:flutter/cupertino.dart';

final appRoutes = {
  '/': HomeScreen(),
  '/login': LoginScreen(),
  '/phoneVerification': PhoneVerificationScreen(),
};

_routeTransition(Widget page) {
  if (Platform.isIOS) {
    return CupertinoPageRoute(builder: (context) {
      return page;
    });
  } else {
    return MaterialPageRoute(builder: (context) {
      return page;
    });
  }
}

Route routes(RouteSettings settings) {
  print('%%%%%%%%%%%%% ${settings.name}');

  if (appRoutes[settings.name] != null) {
    return _routeTransition(appRoutes[settings.name]);
  }

  print(appRoutes[settings.name].toString());
  // appRoutes.map((route, page) {
  //   print("route is : " + route);
  //   if (route == settings.name) {
  //     return _routeTransition(page);
  //   }
  // });
  switch (settings.name) {
    // case '/':
    //   return welcomeRoute();
    // // return homeRoute();
    // case '/login':
    //   return loginRoute();
    case '/phoneVerification':
      return phoneVerificationRoute();
    case '/articles':
      return articlesRoute();
    case '/article':
      return articleRoute();
    case '/editArticle':
      return editArticleRoute();
      break;
  }
}

MaterialPageRoute welcomeRoute() {
  return MaterialPageRoute(builder: (context) {
    return WelcomeScreen();
  });
}

/**
 *  * Auth
 */
MaterialPageRoute loginRoute() {
  return MaterialPageRoute(builder: (context) {
    return LoginScreen();
  });
}

/**
 *  * phone varification
 */
MaterialPageRoute phoneVerificationRoute() {
  return MaterialPageRoute(builder: (context) {
    return PhoneVerificationScreen();
  });
}
/**
 * 
 * Home 
 */

MaterialPageRoute homeRoute() {
  return MaterialPageRoute(builder: (context) {
    return HomeScreen();
  });
}

/**
 * 
 * Articles List 
 */

MaterialPageRoute articlesRoute() {
  return MaterialPageRoute(builder: (context) {
    return ArticlesProvider(
      child: ArticlesListScreen(),
    );
  });
}

MaterialPageRoute articleRoute() {
  return MaterialPageRoute(builder: (context) {
    return ArticleScreen();
  });
}

MaterialPageRoute editArticleRoute() {
  return MaterialPageRoute(builder: (context) {
    return EditArticleScreen();
  });
}
