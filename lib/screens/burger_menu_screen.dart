import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/search_provider.dart';
import '../providers/theme_provider.dart';
import 'contact_screen.dart';
import 'about_screen.dart';
import '../models/new_burger.dart';
import '../models/new_drink.dart';
import '../models/new_nugget.dart';
import 'product_detail_screen.dart';
import 'cart_screen.dart';

class BurgerMenuScreen extends StatefulWidget {
  final String? message;

  const BurgerMenuScreen({super.key, this.message});

  @override
  State<BurgerMenuScreen> createState() => _BurgerMenuScreenState();
}

class _BurgerMenuScreenState extends State<BurgerMenuScreen> with SingleTickerProviderStateMixin {
  bool _productsInitialized = false;

  static const List<Burger> burgers = [
    Burger(
      id: 'b1',
      category: 'Hamburguesas',
      name: 'Clásica',
      variety: 'Normal',
      price: 5.99,
      description: 'Hamburguesa clásica con queso, lechuga y tomate',
      ingredients: ['Pan', 'Carne', 'Queso', 'Lechuga', 'Tomate'],
      imagePath: 'assets/images/clasica.png',
    ),
    Burger(
      id: 'b2',
      category: 'Hamburguesas',
      name: 'Doble Queso',
      variety: 'Extra',
      price: 7.99,
      description: 'Doble carne con extra queso',
      ingredients: ['Pan', 'Doble Carne', 'Doble Queso', 'Lechuga', 'Tomate'],
      imagePath: 'assets/images/dobleQueso.png',
    ),
    Burger(
      id: 'b3',
      category: 'Hamburguesas',
      name: 'Pollo Crispy',
      variety: 'Especial',
      price: 6.99,
      description: 'Hamburguesa de pollo crujiente con lechuga y mayonesa',
      ingredients: ['Pan', 'Pollo', 'Lechuga', 'Mayonesa'],
      imagePath: 'assets/images/polloCrispy.png',
    ),
    Burger(
      id: 'b4',
      category: 'Hamburguesas',
      name: 'BBQ',
      variety: 'Especial',
      price: 7.49,
      description: 'Hamburguesa con salsa BBQ, bacon y cebolla caramelizada',
      ingredients: ['Pan', 'Carne', 'Bacon', 'Cebolla', 'Salsa BBQ'],
      imagePath: 'assets/images/bbq.png',
    ),
    Burger(
      id: 'b5',
      category: 'Hamburguesas',
      name: 'Vegetariana',
      variety: 'Especial',
      price: 6.99,
      description: 'Hamburguesa vegetariana con quinoa y vegetales',
      ingredients: ['Pan', 'Quinoa', 'Lechuga', 'Tomate', 'Pepino'],
      imagePath: 'assets/images/vegetariana.png',
    ),
    Burger(
      id: 'b6',
      category: 'Hamburguesas',
      name: 'Mexicana',
      variety: 'Picante',
      price: 7.99,
      description: 'Hamburguesa con guacamole, jalapeños y salsa picante',
      ingredients: ['Pan', 'Carne', 'Guacamole', 'Jalapeños', 'Salsa Picante'],
      imagePath: 'assets/images/mexicana.png',
    ),
  ];

  static const List<Drink> drinks = [
    Drink(
      id: 'd1',
      category: 'Bebidas',
      name: 'Agua',
      variety: 'Botella',
      price: 1.50,
      size: '500ml',
      imagePath: 'assets/images/500.png',
    ),
    Drink(
      id: 'd2',
      category: 'Bebidas',
      name: 'Agua',
      variety: 'Botella',
      price: 1.00,
      size: '300ml',
      imagePath: 'assets/images/300.png',
    ),
    Drink(
      id: 'd3',
      category: 'Bebidas',
      name: 'Refresco',
      variety: 'Lata',
      price: 2.50,
      size: '355ml',
      imagePath: 'assets/images/refresco355.png',
    ),
    Drink(
      id: 'd4',
      category: 'Bebidas',
      name: 'Jugo Natural',
      variety: 'botella',
      price: 3.25,
      size: '500ml',
      imagePath: 'assets/images/jugo.png',
    ),
    Drink(
      id: 'd5',
      category: 'Bebidas',
      name: 'Cerveza',
      variety: 'Botella',
      price: 4.50,
      size: '355ml',
      imagePath: 'assets/images/cerveza.png',
    ),
    Drink(
      id: 'd6',
      category: 'Bebidas',
      name: 'Limonada',
      variety: 'Botella',
      price: 2.99,
      size: '500ml',
      imagePath: 'assets/images/limonada.png',
    ),
    Drink(
      id: 'd7',
      category: 'Bebidas',
      name: 'Té Helado',
      variety: 'jarra',
      price: 4.75,
      size: '2L',
      imagePath: 'assets/images/tehelado.png',
    ),
  ];

  static const List<Nugget> nuggets = [
    Nugget(
      id: 'n1',
      category: 'Nuggets',
      name: 'Pollo',
      variety: 'Clásicos',
      price: 4.99,
      pieces: 6,
      sauces: ['BBQ', 'Mostaza', 'Ketchup'],
      sides: ['Papas fritas', 'Arroz'],
      description: '6 piezas de nuggets de pollo clásicos, crujientes por fuera y jugosos por dentro',
      imagePath: 'assets/images/pollo.png',
    ),
    Nugget(
      id: 'n2',
      category: 'Nuggets',
      name: 'Pollo',
      variety: 'Grandes',
      price: 6.99,
      pieces: 10,
      sauces: ['BBQ', 'Mostaza', 'Ketchup'],
      sides: ['Papas fritas', 'Ensalada'],
      description: '10 piezas grandes de nuggets de pollo con doble empanizado crujiente',
      imagePath: 'assets/images/pollo10.png',
    ),
    Nugget(
      id: 'n3',
      category: 'Nuggets',
      name: 'Queso',
      variety: 'Sticks',
      price: 5.99,
      pieces: 8,
      sauces: ['Ranch', 'Salsa de queso'],
      sides: ['Papas fritas', 'Aros de cebolla'],
      description: '8 piezas de sticks de queso fundente con empanizado dorado',
      imagePath: 'assets/images/stickQueso.png',
    ),
    Nugget(
      id: 'n4',
      category: 'Nuggets',
      name: 'Vegetales',
      variety: 'Mixtos',
      price: 5.49,
      pieces: 8,
      sauces: ['Miel', 'Ajo'],
      sides: ['Ensalada', 'Arroz'],
      description: '8 piezas de nuggets de vegetales mixtos (brócoli, zanahoria, papa)',
      imagePath: 'assets/images/vegetariana2.png',
    ),
    Nugget(
      id: 'n5',
      category: 'Nuggets',
      name: 'Pollo',
      variety: 'Picantes',
      price: 6.49,
      pieces: 8,
      sauces: ['Buffalo', 'Chipotle'],
      sides: ['Papas fritas', 'Elote'],
      description: '8 piezas de nuggets de pollo picante con especias especiales',
      imagePath: 'assets/images/picantenuggets.png',
    ),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final searchProvider = Provider.of<SearchProvider>(context, listen: false);
      if (!_productsInitialized) {
        searchProvider.setProducts(List.from(burgers), List.from(drinks), List.from(nuggets));
        _productsInitialized = true;
      }

      // Show temporary message if present
      if (widget.message != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(widget.message!),
            duration: const Duration(minutes: 1),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Menú Principal'),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        foregroundColor: Theme.of(context).appBarTheme.titleTextStyle?.color ?? Colors.white,
        elevation: 10,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      drawer: _buildMainDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Banner promocional
            _buildPromoBanner(),
            // Sección de hamburguesas
            _buildSectionTitle('HAMBURGUESAS'),
            Consumer<SearchProvider>(
              builder: (context, searchProvider, _) {
                final filteredBurgers = searchProvider.filteredProducts
                    .whereType<Burger>()
                    .toList();
                
                if (filteredBurgers.isEmpty && searchProvider.searchQuery.isNotEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('No se encontraron hamburguesas'),
                  );
                }

                return _buildProductGrid(context, filteredBurgers.map((burger) => {
                  'name': burger.name,
                  'price': '\$${burger.price}',
                  'icon': Icons.lunch_dining,
                  'product': burger,
                }).toList());
              },
            ),
            // Sección de bebidas
            _buildSectionTitle('BEBIDAS'),
            Consumer<SearchProvider>(
              builder: (context, searchProvider, _) {
                final filteredDrinks = searchProvider.filteredProducts
                    .whereType<Drink>()
                    .toList();
                
                if (filteredDrinks.isEmpty && searchProvider.searchQuery.isNotEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('No se encontraron bebidas'),
                  );
                }

                return _buildProductGrid(context, filteredDrinks.map((drink) => {
                  'name': drink.name,
                  'price': '\$${drink.price}',
                  'icon': drink.name == 'Agua' ? Icons.water_drop : Icons.local_drink,
                  'product': drink,
                }).toList());
              },
            ),
            // Sección de nuggets
            _buildSectionTitle('NUGGETS'),
            Consumer<SearchProvider>(
              builder: (context, searchProvider, _) {
                final filteredNuggets = searchProvider.filteredProducts
                    .whereType<Nugget>()
                    .toList();
                
                if (filteredNuggets.isEmpty && searchProvider.searchQuery.isNotEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('No se encontraron nuggets'),
                  );
                }

                return _buildProductGrid(context, filteredNuggets.map((nugget) => {
                  'name': '${nugget.name} (${nugget.pieces})',
                  'price': '\$${nugget.price}',
                  'icon': Icons.fastfood,
                  'product': nugget,
                }).toList());
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, CartScreen.routeName);
        },
        backgroundColor: Colors.deepOrange[800],
        child: const Icon(Icons.shopping_cart, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildPromoBanner() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepOrange[400]!, Colors.deepOrange[800]!],
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.deepOrange.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.local_offer_outlined, color: Colors.white, size: 40),
          const SizedBox(width: 16),
          const Expanded(
            child: Text(
              '¡HOY ESPECIAL! 2x1 en hamburguesas los martes',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.deepOrange[800],
          ),
        ),
      ),
    );
  }

  Widget _buildProductGrid(BuildContext context, List<Map<String, dynamic>> products) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.9,
      padding: const EdgeInsets.all(16),
      children: products.map((product) => _buildProductCard(context, product)).toList(),
    );
  }

  Widget _buildMainDrawer(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.75,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.deepOrange[800],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.restaurant, size: 50, color: Colors.white),
                const SizedBox(height: 10),
                const Text(
                  'The Best Burger',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Search Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar productos...',
                hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
                prefixIcon: Icon(Icons.search, color: Theme.of(context).iconTheme.color),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
              ),
              onChanged: (value) {
                searchProvider.searchProducts(value);
              },
            ),
          ),
          // Menu Items
          Consumer<SearchProvider>(builder: (context, searchProvider, _) {
            if (searchProvider.searchQuery.isNotEmpty) {
              return _buildSearchResults(context);
            }
            return Column(
              children: [
                ListTile(
                  leading: Icon(Icons.home, color: Theme.of(context).iconTheme.color),
                  title: Text('Main Menu', style: Theme.of(context).textTheme.bodyMedium),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.contact_mail, color: Theme.of(context).iconTheme.color),
                  title: Text('Contactos', style: Theme.of(context).textTheme.bodyMedium),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, ContactScreen.routeName);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.info, color: Theme.of(context).iconTheme.color),
                  title: Text('Sobre Nosotros', style: Theme.of(context).textTheme.bodyMedium),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, AboutScreen.routeName);
                  },
                ),
                const Divider(),
                ListTile(
                  leading: Icon(
                    themeProvider.themeMode == ThemeMode.dark
                        ? Icons.wb_sunny
                        : Icons.nightlight_round,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  title: Text(
                    themeProvider.themeMode == ThemeMode.dark
                        ? 'Modo Claro'
                        : 'Modo Oscuro',
                  ),
                  onTap: () {
                    themeProvider.toggleTheme(
                      themeProvider.themeMode != ThemeMode.dark,
                    );
                  },
                ),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget _buildSearchResults(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    
    return Consumer<SearchProvider>(
      builder: (context, searchProvider, _) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: searchProvider.filteredProducts.length,
          itemBuilder: (ctx, index) {
            final product = searchProvider.filteredProducts[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    product.imagePath,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 40,
                        height: 40,
                        color: Colors.grey[200],
                        child: const Icon(Icons.fastfood,
                          size: 24,
                          color: Colors.deepOrange),
                      );
                    },
                  ),
                ),
                title: Text(
                  product.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  '\$${product.price}',
                  style: TextStyle(
                    color: Colors.green[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => ProductDetailScreen(product: product),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildProductCard(BuildContext context, Map<String, dynamic> product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: product['product']),
          ),
        );
      },
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        shadowColor: Colors.deepOrange.withOpacity(0.2),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 210,
                width: 210,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[100],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    product['product'].imagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[200],
                        child: const Icon(Icons.fastfood,
                          size: 40,
                          color: Colors.deepOrange),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                product['name'] as String,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange[800],
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                product['price'] as String,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.green[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
