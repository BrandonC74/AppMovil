import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/new_burger.dart';
import '../models/new_drink.dart';
import '../models/new_nugget.dart';
import '../providers/cart_provider.dart';
import '../providers/search_provider.dart'; // Import SearchProvider
import '../screens/cart_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  final dynamic product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
        backgroundColor: Colors.deepOrange[800],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Center(
              child: Image.asset(
                widget.product.imagePath,
                height: 400,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 400,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text('Imagen no disponible', 
                        style: TextStyle(color: Colors.red, fontSize: 20)),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            
            // Product Name and Price
            Center(
              child: Column(
                children: [
                  Text(
                    widget.product.name,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '\$${widget.product.price}',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            
            // Quantity Selector
            Row(
              children: [
                const Text(
                  'Cantidad:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (quantity > 1) quantity--;
                    });
                  },
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    quantity.toString(),
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            
            // Product Details
            if (widget.product is Burger) ...[ 
              const Text(
                'Ingredientes:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              ...(widget.product as Burger)
                  .ingredients
                  .map((ingredient) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Text(
                          '- $ingredient',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ))
                  ,
              const SizedBox(height: 20),
              Text(
                widget.product.description,
                style: const TextStyle(fontSize: 20),
              ),
            ],
            if (widget.product is Drink) ...[
              Text(
                'Tamaño: ${widget.product.size}',
                style: const TextStyle(fontSize: 22),
              ),
            ],
            if (widget.product is Nugget) ...[
              const SizedBox(height: 20),
              Text(
                'Acompañamientos: ${widget.product.sides.join(', ')}',
                style: const TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 12),
              Text(
                'Salsas incluidas: ${widget.product.sauces.join(', ')}',
                style: const TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 12),
              Text(
                'Cantidad: ${widget.product.pieces} piezas',
                style: const TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 20),
              Text(
                widget.product.description,
                style: const TextStyle(fontSize: 20),
              ),
            ],
            const SizedBox(height: 30),
            
            // Add to Cart Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange[800],
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Provider.of<CartProvider>(context, listen: false).addItem(
                    widget.product,
                    quantity,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${quantity}x ${widget.product.name} agregado al carrito'),
                      action: SnackBarAction(
                        label: 'VER CARRITO',
                        textColor: Colors.white,
                        onPressed: () {
                          Provider.of<SearchProvider>(context, listen: false).resetSearch(); // Reset search state
                          Navigator.pushNamed(context, CartScreen.routeName);
                        },
                      ),
                    ),
                  );
                },
                child: const Text(
                  'AGREGAR AL CARRITO',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
