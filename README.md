# ecommerce_application_01

A new Flutter project.

PAQUETES / DEPENDENCIAS
intl --(formato precios)

firebase_core: ^2.30.1 --(firebase)
cloud_firestore: ^4.17.2 --(firestore)

ESTRUCTURA DE PROYECTO

|-- lib/
|   |-- screens/
|   |   |-- error_screen.dart
|   |   |-- home_screen.dart (screen principal)
|   |   |-- screen.dart
|   |-- widgets/
|   |   |-- card_product_widget.dart (widget card producto)
|   |   |-- dropdown_list_widget.dart (widget lista desplegable atributo{talla})
|   |   |-- widget.dart
|   |-- models/
|   |   |-- categoria_model.dart (model categorias db Firebase)
|   |   |-- product_model.dart (model productos db Firebase)
|   |   |-- models.dart
|   |-- services/
|   |   |-- product_service.dart (servicio productos db Firebase)
|   |-- routes/
|   |   |-- app.routes.dart
|   |-- firebase_options.dart (archivo configuraciones firebase)
|   |-- main.dart
