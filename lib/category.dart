import 'package:eticaret/bottomNavigation.dart';
import 'package:eticaret/productDetail.dart';
import 'package:flutter/material.dart';

import 'header.dart';

class CategoryPage extends StatelessWidget {
  String categoryTitle;

  CategoryPage(this.categoryTitle);

  final List<Map> products = [
    {"name": "Surface Laptop", "photo": "assets/Laptop.png", "price": "999"},
    {"name": "a", "photo": "assets/Laptop.png", "price": "999"},
    {"name": "b", "photo": "assets/Laptop.png", "price": "999"},
    {"name": "c", "photo": "assets/Laptop.png", "price": "999"},
    {"name": "Surface Laptop", "photo": "assets/Laptop.png", "price": "999"},
    {"name": "Surface Laptop", "photo": "assets/Laptop.png", "price": "999"},
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
                  children: [
                    //header
                    header(categoryTitle, context),
                    SizedBox(height: 32),

                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 10,
                        children: products.map((Map product) {
                          return buildContent(product["name"], product["photo"],
                              product["price"],context);
                        }).toList(),
                      ),
                    ),

//içerikler
                  ],
                ),
              ),
              bottomNavigationBar("search"),
            ],
          ),

        ),
    );
}

Widget buildContent(String title, String photoUrl, String price,context ) {
  return  GestureDetector(
    onTap: (){
      Navigator.push(context,MaterialPageRoute(builder: (context){
        return ProductDetailPage(title);
      }));
    },
    child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 24,
                  offset: Offset(0, 16))
            ]),
        child: Column(
          children: [
            SizedBox(height: 16),
            Image.asset(
              photoUrl,
            ),
            //Expanded(child: Container()),
            SizedBox(height:  34),
            Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Color(0xFF0A1034),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "USD $price",
                  style: TextStyle(
                    color: Color(0xFF0001FC),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 18,),
              ],
            )
          ],
        ),
      ),
  );}}

