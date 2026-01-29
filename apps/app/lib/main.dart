import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Импортируй свои компоненты внимательно!
// Проверь, что SearchProvider лежит именно там.
import 'package:ui_kit/components/search.dart';
import 'package:ui_kit/components/select.dart';
// Если Chips, Button и остальные тоже в отдельных файлах, добавь их импорты тут

// 1. Оставляем Провайдер здесь для простоты
class FilterProvider extends ChangeNotifier {
  String selectedFilter = "Все";

  void updateFilter(String newValue) {
    selectedFilter = newValue;
    notifyListeners();
  }
}

// 2. ЕДИНСТВЕННЫЙ main на всё приложение
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FilterProvider()),
        ChangeNotifierProvider(create: (_) => SearchProvider()),
        ChangeNotifierProvider(
          create: (_) => SelectProvider()..init("Сначала новые"),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHome(),
      ),
    ),
  );
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    // Слушаем изменения фильтра
    final filter = context.watch<FilterProvider>().selectedFilter;

    return Scaffold(
      backgroundColor: Colors.white,
      // Нажимаем в любое место экрана — инпут теряет фокус (удобно!)
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30),

                // Твои чипсы (убедись, что внутри они вызывают FilterProvider)
                const Text(
                  "Категории",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),

                // Chips(list: const ["Все", "Мужчинам", "Женщинам"]),
                const SizedBox(height: 20),
                Text("Выбрано: $filter", style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 30),

                // ТОТ САМЫЙ ИНПУТ
                const Text("Поиск", style: TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
                SearchField(
                  placeholder: "Поиск кроссовок...",
                  onSearch: () {
                    print("Кнопка поиска нажата!");
                  },
                ),

                const SizedBox(height: 50),
                // Заглушка, чтобы можно было проскроллить
                Container(
                  height: 300,
                  width: double.infinity,
                  color: Colors.grey[100],
                  child: const Center(child: Text("Здесь будут твои товары")),
                ),
                const SizedBox(height: 100),
                CustomSelect(
                  label: "Сортировка",
                  items: const [
                    "Сначала новые",
                    "Дешевле",
                    "Дороже",
                    "По рейтингу",
                  ],
                  value: context.watch<SelectProvider>().selectedValue,
                  onChanged: (val) {
                    context.read<SelectProvider>().updateValue(val);
                    print("Выбрано: $val");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
