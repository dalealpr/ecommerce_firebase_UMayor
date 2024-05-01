import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_application_01/models/models.dart';

class CategoryService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Category>> getAllCategory() async {
    try {
      QuerySnapshot querySnapshot = await _db.collection('categorias').get();
      List<Category> categories = querySnapshot.docs.map((doc) {
        Map<String, dynamic>? data =
            doc.data() as Map<String, dynamic>?; // Conversión explícita
        return Category.fromMap(
            data ?? {}); // Si data es nulo, se proporciona un mapa vacío
      }).toList();
      return categories;
    } catch (error) {
      print("Error al obtener las categorias: $error");
      return [];
    }
  }
}
