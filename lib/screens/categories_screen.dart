import 'package:flutter/material.dart';

import '../components/category_item.dart';
import '../data/data.dart';
import '../models/category.dart';
import 'category_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // if (MediaQuery.of(context).orientation == Orientation.landscape) {
    //   return const Center(
    //     child: Text(
    //       'Landscape',
    //       style: TextStyle(fontSize: 50),
    //     ),
    //   );
    // }
    // if (Platform.isIOS) {
    //   return const Center(
    //     child: Text(
    //       'this is ios',
    //       style: TextStyle(fontSize: 50),
    //     ),
    //   );
    // }
    // if (Platform.isAndroid) {
    //   return const Center(
    //     child: Text(
    //       'this is android',
    //       style: TextStyle(fontSize: 50),
    //     ),
    //   );
    // }

    // final isSmall = MediaQuery.of(context).size.height > 400;
    // final isDesktop = MediaQuery.sizeOf(context).width > 600;

    return OrientationBuilder(builder: (context, orientation) {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: availableCategories.length,
        itemBuilder: (context, index) {
          final Category category = availableCategories[index];
          return InkWell(
            onTap: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => const CategoryScreen(),
              //   ),
              // );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryScreen(
                    category: category,
                  ),
                ),
              );
            },
            child: CategoryItem(category: category),
          );
        },
      );
    });
  }
}
