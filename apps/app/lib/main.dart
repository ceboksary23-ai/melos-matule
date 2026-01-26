import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_kit/components/buttons/button.dart';
import 'package:ui_kit/components/buttons/cart.dart';
import 'package:ui_kit/components/buttons/chips.dart';
import 'package:ui_kit/components/buttons/login_buttons.dart';
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
             Chips(list: const ["Все", "Мужчинам", "Женщинам"]),
        const SizedBox(height: 20),
        Text("Выбрано: $filter"),
        Cart(
        label: "В корзину",
        price: 500,
        onPressed: () {
          print("Cart Button Pressed!");
        }
        ),
        Text("Big Buttons"),
        Button(
          text: "Подтвердить", 
          style: AppButtonStyles.primary, 
          onPressed: () => print("Clicked!") 
        ),
        Button(
          text: "Подтвердить", 
          style: AppButtonStyles.inactive, 
          onPressed: () => print("Clicked!") 
        ),
        Button(
          text: "Подтвердить", 
          style: AppButtonStyles.secondary, 
          onPressed: () => print("Clicked!") 
        ),
        Button(
          text: "Подтвердить", 
          style: AppButtonStyles.tetriary, 
          onPressed: () => print("Clicked!") 
        ),
        Text("Small Buttons"),
        Button(
          text: "Добавить", 
          style: AppButtonStyles.primary, 
          isSmall: true,
          onPressed: () => print("Clicked!") 
        ),
        Button(
          text: "Убрать", 
          style: AppButtonStyles.secondary, 
          isSmall: true,
          onPressed: () => print("Clicked!") 
        ),
        Button(
          text: "Добавить", 
          style: AppButtonStyles.inactive, 
          isSmall: true,
          onPressed: () => print("Clicked!") 
        ),
        Button(
          text: "Подтвердить", 
          style: AppButtonStyles.tetriary, 
          isSmall: true,
          onPressed: () => print("Clicked!") 
        ),
        LoginButtons(
          text: "Войти с VK", 
          style: LoginButtonStyle.vk
        ),
        LoginButtons(
          text: "Войти с Yandex", 
          style: LoginButtonStyle.yandex
        )
          ],
        ),
      ),
    );
  }
}
