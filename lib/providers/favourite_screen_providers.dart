import 'package:flutter/foundation.dart';

class FavouriteItemProvider with ChangeNotifier {
  List<String> _selectedItems = [];

  List<String> get selectedItems => _selectedItems;

  void addIteam(String title) {
    _selectedItems.add(title);

    notifyListeners();
  }

  void removeIteam(String title) {
    _selectedItems.remove(title);

    notifyListeners();
  }
}
