import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart'; // Importa el paquete Firebase Core
// Routes
import './routes/app.routes.dart';

void main() async {
  // Asegúrate de que Firebase esté inicializado antes de ejecutar la aplicación
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Inicializa Firebase

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(254, 0, 109, 255),
      systemNavigationBarColor: Color.fromARGB(255, 244, 244, 244),
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Color.fromARGB(255, 255, 255, 255),
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false, //Quita etiqueta debug
      title: 'Ecommerce App',
      //  RUTAS:
      initialRoute: AppRoutes.initialRoute, //Ruta inicial
      routes: AppRoutes.routes, //Rutas
      onGenerateRoute: AppRoutes.onGenerateRoute, //Genera las rutas
      // TEMAS:
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(
              254, 0, 109, 255), // Mismo color que statusBarColor
        ),
      ),
    );
  }
}
