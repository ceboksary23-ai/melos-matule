import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_kit/components/buttons/chips.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => FilterProvider(),
      child: const MaterialApp(
        home: Scaffold(body: Center(child: MyHome()))),
    ),
  );
}
class MyHome extends StatelessWidget {
  const MyHome({super.key});
  @override
  Widget build(BuildContext context) {
    final filter = context.watch<FilterProvider>().selectedFilter;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Chips(list: const ["Все", "Мужчинам", "Женщинам"]),
        const SizedBox(height: 20),
        Text("Выбрано: $filter"),
      ],
    );
  }
}
