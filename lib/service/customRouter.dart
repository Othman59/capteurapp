import 'package:capteurapp/screen/Homepage/homepage.dart';
import 'package:capteurapp/screen/connexion/connexion.dart';
import 'package:flutter/material.dart';

class CustomRouter {
  static const String base = "/";
  static const String homepage = "/homepage";
  static const String connexion = "/connexion";

  static Route<dynamic>? router(RouteSettings settings) {
    switch (settings.name) {
      case homepage:
        return MaterialPageRoute(
          builder: (context) => Homepage(),
        );
      case connexion:
        return MaterialPageRoute(
          builder: (context) => Connexion(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Connexion(),
        );
    }
  }
}