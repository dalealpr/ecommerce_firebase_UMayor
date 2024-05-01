// Define la clase Producto
class Product {
  final String? categoria;
  final String? color;
  final String? descripcion;
  final String? img;
  final String? marca;
  final String? nombre;
  final int? precio;
  final int? stock;
  final dynamic talla;

  // Constructor de la clase
  Product({
    this.categoria,
    this.color,
    this.descripcion,
    this.img,
    this.marca,
    this.nombre,
    this.precio,
    this.stock,
    this.talla,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    // Convertir el mapa de tallas a una lista de strings con el formato 'Talla: Cantidad'
    return Product(
      categoria: map['categoria'],
      color: map['color'],
      descripcion: map['descripcion'],
      img: map['img'],
      marca: map['marca'],
      nombre: map['nombre'],
      precio: map['precio'],
      stock: map['stock'],
      talla: map['talla'],
    );
  }
}
