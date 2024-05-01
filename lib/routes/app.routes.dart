import 'package:flutter/material.dart';
// Importamos archivo de exportacion de screens
import '../screen/screen.dart';

class AppRoutes {
  // Ruta inicial
  static const initialRoute = 'home';

  // Rutas con alias , screen
  static Map<String, Widget Function(BuildContext)> routes = {
    'home': (BuildContext context) => const HomeScreen()
  };

  // Configuracion Error 404 Screen
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const ErrorScreen());
  }
}
