// Define la clase Categoria
class Category {
  final String? nombre;

  // Constructor de la clase
  Category({this.nombre});

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(nombre: map['nombre']);
  }
}
