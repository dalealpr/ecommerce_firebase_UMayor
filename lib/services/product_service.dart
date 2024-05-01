import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_application_01/models/models.dart';

class ProductService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Product>> getAllProducts() async {
    try {
      QuerySnapshot querySnapshot = await _db.collection('productos').get();
      List<Product> products = querySnapshot.docs.map((doc) {
        Map<String, dynamic>? data =
            doc.data() as Map<String, dynamic>?; // Conversión explícita
        return Product.fromMap(
            data ?? {}); // Si data es nulo, se proporciona un mapa vacío
      }).toList();
      return products;
    } catch (error) {
      print("Error al obtener los productos: $error");
      return [];
    }
  }
}
