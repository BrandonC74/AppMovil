import 'package:flutter/material.dart';
import '../models/new_burger.dart';
import '../models/new_drink.dart';
import '../models/new_nugget.dart';

class SearchProvider with ChangeNotifier {
  List<dynamic> _allProducts = [];
  List<dynamic> _filteredProducts = [];
  String _searchQuery = '';

  List<dynamic> get filteredProducts => _filteredProducts;
  String get searchQuery => _searchQuery;

  void setProducts(List<Burger> burgers, List<Drink> drinks, List<Nugget> nuggets) {
    _allProducts = [...burgers, ...drinks, ...nuggets];
    _filteredProducts = _allProducts;
    notifyListeners();
  }

  void searchProducts(String query) {
    _searchQuery = query;
    if (query.isEmpty) {
      _filteredProducts = _allProducts;
    } else {
      _filteredProducts = _allProducts.where((product) =>
          product.name.toLowerCase().contains(query.toLowerCase())).toList();
    }
    notifyListeners();
  }

  // New method to reset search
  void resetSearch() {
    _searchQuery = '';
    _filteredProducts = _allProducts;
    notifyListeners();
  }
}
