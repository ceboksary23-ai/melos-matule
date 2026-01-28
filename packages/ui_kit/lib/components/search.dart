import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_kit/colors/app_colors.dart';
class SearchProvider extends ChangeNotifier {
  final TextEditingController _controller = TextEditingController();
  String _searchText = "";
  //Геттеры
  TextEditingController get controller => _controller;
  String get searchText => _searchText;

  SearchProvider() {
    _controller.addListener(() {
      _searchText = _controller.text;
      notifyListeners();
    });
  }

  void clearText() {
    _controller.clear();
  }

  void performSearch() {
    print("Search $_searchText");
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
    required this.onSearch,
    required this.placeholder
  });
  
  @override
  Widget build(BuildContext context) {
    final searchProv = Provider.of<SearchProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(15)
      ),
      child: TextField(
        controller: searchProv._controller,
        textInputAction: TextInputAction.search,
        onSubmitted: (value) => searchProv.performSearch(),
        decoration: InputDecoration(
          hintText: placeholder,
          border: InputBorder.none,
          contentPadding: EdgeInsetsGeometry.symmetric(vertical: 15, horizontal: 20),
          prefixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          suffixIcon: searchProv.searchText.isNotEmpty 
            ? IconButton(onPressed: () {}, icon: Icon(Icons.delete)) 
            : null
        ),
      ),
    );
  }
}