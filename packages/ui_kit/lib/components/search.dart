import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchProvider extends ChangeNotifier {
  final TextEditingController _controller = TextEditingController();
  String _searchText = "";

  TextEditingController get controller => _controller;
  String get searchText => _searchText;
  
  SearchProvider() {
    _controller.addListener(() {
      if (_searchText != _controller.text) {
        _searchText = _controller.text;
        notifyListeners();
      }
    });
  }

  void clearText() {
    _controller.clear();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class SearchField extends StatelessWidget {
  final VoidCallback onSearch;
  final String placeholder;

  const SearchField({
    super.key,
    required this.onSearch,
    required this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    // Получаем провайдер БЕЗ прослушивания, чтобы не перерисовывать весь метод build
    final provider = context.read<SearchProvider>();

    return Material(
      color: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFF7F7F9),
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          controller: provider.controller,
          textInputAction: TextInputAction.search,
          onSubmitted: (_) => onSearch(),
          style: const TextStyle(color: Colors.black, fontSize: 16),
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: const TextStyle(color: Colors.grey),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            prefixIcon: const Icon(Icons.search, color: Colors.grey),
            // Обновляем только иконку крестика через Consumer
            suffixIcon: Consumer<SearchProvider>(
              builder: (context, searchProv, _) {
                return searchProv.searchText.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.close, color: Colors.black),
                        onPressed: searchProv.clearText,
                      )
                    : const SizedBox.shrink();
              },
            ),
          ),
        ),
      ),
    );
  }
}