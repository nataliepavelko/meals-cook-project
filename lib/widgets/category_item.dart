import 'package:flutter/material.dart';
import 'package:meals_cook/screens/category_meals_screen.dart';

class CategotyItem extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;
  final Color categoryColor;

  CategotyItem({this.categoryId, this.categoryTitle, this.categoryColor});

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName, arguments: {
      'id': categoryId,
      'title': categoryTitle,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(
          15), // границы радиуса блика нажатия, должен быть равному границы borderRadius
      //карты или контейнера, к которому применяется блик нажатия
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          categoryTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [categoryColor.withOpacity(0.7), categoryColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
