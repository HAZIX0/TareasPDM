import 'package:flutter/material.dart';
import 'package:tarea5/item.dart';

class ForageProvider with ChangeNotifier {
  List<Item> _items = [];
  var _nameController = TextEditingController();
  var _locationController = TextEditingController();
  bool _isInSeason = false;
  var _notesController = TextEditingController();
  int _selectedIndex = 0;

  List<Item> get getItems => _items;
  TextEditingController get getNameController => _nameController;
  TextEditingController get getLocationController => _locationController;
  bool get getIsInSeason => _isInSeason;
  TextEditingController get getNotesController => _notesController;
  Item get getSelectedItem => _items[_selectedIndex];

  void addItem() {
    _items.add(Item(
        name: _nameController.text,
        location: _locationController.text,
        isInSeason: _isInSeason,
        notes: _notesController.text));
    notifyListeners();
  }

  void setIsInSeasonSelected(bool updatedSwitchValue) {
    _isInSeason = updatedSwitchValue;
    notifyListeners();
  }

  void deleteItem() {
    _nameController.clear();
    _locationController.clear();
    _notesController.clear();
    _isInSeason = false;
    notifyListeners();
  }

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
