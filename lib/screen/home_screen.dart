import 'package:flutter/material.dart';
import 'package:ecommerce_application_01/services/product_service.dart';
import '../models/models.dart';
import '../widgets/widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productService = ProductService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
      ),
      backgroundColor: Color.fromARGB(255, 235, 235, 235),
      body: FutureBuilder<List<Product>>(
        future: productService.getAllProducts(),
        builder: (context, snapshot) {
          // loading productos
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
            // db con coleccion productos
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final product = snapshot.data![index];
                return ProductCardWidget(product: product);
              },
            );
            //  error / coleccion productos vacia
          } else {
            return Center(
              child: Text(
                  'Lo sentimos, no hay productos disponibles en este momento.'),
            );
          }
        },
      ),
    );
  }
}
