import 'package:flutter/material.dart';
class SelectProvider extends ChangeNotifier {
  String _selectedValue = "";

  String get selectedValue => _selectedValue;

  void init(String initialValue) {
    _selectedValue = initialValue;
  }

  void updateValue(String newValue) {
    if (_selectedValue != newValue) {
      _selectedValue = newValue;
      notifyListeners();
    }
  }
}
class CustomSelect extends StatelessWidget {
  final List<String> items;
  final String label;
  final Function(String) onChanged;
  final String value;

  const CustomSelect({
    super.key,
    required this.items,
    required this.label,
    required this.onChanged,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 8),
          child: Text(label, style: const TextStyle(color: Colors.grey)),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: const Color(0xFFF7F7F9),
            borderRadius: BorderRadius.circular(15),
          ),
          child: DropdownButtonHideUnderline( // Убираем стандартную полоску снизу
            child: DropdownButton<String>(
              value: value,
              isExpanded: true, // Растягивает на всю ширину контейнера
              icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
              borderRadius: BorderRadius.circular(15),
              items: items.map((String item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item, style: const TextStyle(color: Colors.black)),
                );
              }).toList(),
              onChanged: (newValue) {
                if (newValue != null) onChanged(newValue);
              },
            ),
          ),
        ),
      ],
    );
  }
}