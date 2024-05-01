import 'package:flutter/material.dart';
import 'package:ecommerce_application_01/models/models.dart';
import '../widgets/widget.dart';
import 'package:intl/intl.dart'; // dependencia formato precio

class ProductCardWidget extends StatelessWidget {
  final Product product; // Producto que se mostrará en la Card

  const ProductCardWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Formato para precios
    final NumberFormat f = NumberFormat("#,##0", "es_AR");
    // Variable para valor de talla por defecto
    String dropdownValue = '';

    // Funcion para asignar valor por defecto a dropdownValue
    String getInitialDropdownValue(Map<String, dynamic> talla) {
      bool isSize9Available = talla.containsKey('9');
      // Si talla es de producto ropa asigna {S} por defecto
      // Si talla es de producto zapatillas asigna {9} por defecto
      return isSize9Available ? '9' : 'S';
    }

    return Card(
      margin: EdgeInsets.all(10),
      color: Color.fromARGB(255, 255, 255, 255),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
            // Imagen producto
            child: Image.network(
              product.img ?? '',
              width: double.infinity,
              height: 385,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Marca Producto
                Text(
                  product.marca ?? '',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                ),
                SizedBox(height: 5),
                // Nombre Producto
                Text(
                  product.nombre ?? '',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                ),
                Text(
                  "Vendido por Paris",
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.w300),
                ),
                SizedBox(height: 10),
                // Precio Producto
                Text(
                  '\$${f.format(product.precio).toString()}',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
                ),
                Row(
                  children: [
                    Text(
                      'Stock: ',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                    ),
                    // Stock Producto
                    Text(
                      ' ${product.stock.toString()} unidades',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Text(
                      'Talla: ',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                    ),
                    // Si el valor de talla es String "Talla unica"
                    if (product.talla is String)
                      Text(
                        product.talla,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                    // Si el valor de talla es Object
                    if (product.talla is Map<String, dynamic>)
                      // Widget lista desplegable
                      CustomDropdownButton(
                        talla: product.talla as Map<String, dynamic>,
                        getInitialDropdownValue: getInitialDropdownValue,
                        onChanged: (newValue) {},
                      )
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 15),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 15.0,
              ),
              // Boton agregar al carrito
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(254, 0, 109, 255),
                  ),
                  foregroundColor: MaterialStateProperty.all<Color>(
                    Colors.white,
                  ),
                ),
                child: Text(
                  'Agregar al carrito',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
