import 'package:eticaret/bottomNavigation.dart';
import 'package:flutter/material.dart';
import 'category.dart';
import 'header.dart';




class CategoriesPage extends StatelessWidget {
  final List<String> categories = [
    "All",
    "Computers",
    "Accessories",
    "Smartphones",
    "Smart objects",
    "Speakers"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [header("Categories",context),
// geri iconu

                  SizedBox(height: 16),

                  Expanded(
                      child: ListView(
                    children: categories
                        .map((String title) => buildCategory(title,context))
                        .toList(),
                  )),
                ],
              ),
            ),
            bottomNavigationBar("search"),
          ],
        ),
      ),
    );
  }
}

Widget buildCategory(String title,context) {
  return GestureDetector(
    onTap: (){Navigator.push(context!, MaterialPageRoute(builder: (context) {
      return CategoryPage(title );
    }));

    },
    child: Container(
      padding: EdgeInsets.all(24),
      margin: EdgeInsets.only(bottom: 16),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 4,
                offset: Offset(0, 4))
          ]),
      child: Text(title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF0a1034))),
    ),
  );
}
