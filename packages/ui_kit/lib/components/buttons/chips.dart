import "package:flutter/material.dart";
import 'package:provider/provider.dart';
class FilterProvider with ChangeNotifier {
  
  String _selectedFilter = 'Все';
  String get selectedFilter => _selectedFilter;

  void setFilter(String newFilter) {
    if (_selectedFilter != newFilter) {
      _selectedFilter = newFilter;
      notifyListeners();
    }
  }
}

class Chips extends StatelessWidget {
 final List<String> list;
 const Chips({required this.list, super.key});
 @override
  Widget build(BuildContext context) {
    final filterProvider = context.watch<FilterProvider>();
    return Wrap(
      spacing: 8.0,
      children: list.map((String name) {
        final isSelected = filterProvider.selectedFilter == name;
        return ChoiceChip(
          label: Text(name),
          selected: isSelected,
          onSelected: (bool selected) {
            context.read<FilterProvider>().setFilter(name);
          },
        );
      }).toList(),
    );
  }
}