import 'package:flutter/material.dart';

import './screens/home_screen.dart';
import './screens/articles/articles.dart';
import './screens/welcome/welcome_screen.dart';
import './app/providers/providers.dart' show ArticlesProvider;
import './screens/auth/login_screen.dart';
import './screens/auth/phone_verifivation.dart';

final authRoutes = {
  'case': '/login',
  'route': loginRoute(),
};

Route routes(RouteSettings settings) {
  print('%%%%%%%%%%%%% ${settings.name}');
  switch (settings.name) {
    case '/':
      return welcomeRoute();
    // return homeRoute();
    case '/login':
      return loginRoute();
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
