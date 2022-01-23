import 'package:flutter/material.dart';

Widget bottomNavigationBar(String page){
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: Offset(0, -3),
                color: Colors.black.withOpacity(0.25),
                blurRadius: 10)
          ],
          color: Color(0xFFEFF5FB),
        ),
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildNavIcon(Icons.home_filled, page == "home"),
              buildNavIcon(Icons.search, page == "search"),
              buildNavIcon(Icons.shopping_basket, page == "cart"),
              buildNavIcon(Icons.person, page =="profile"),
            ]),
      ),
    );
}

Widget buildNavIcon(IconData iconData, bool active) {
  return Icon(iconData,
      size: 20, color: Color(active ? 0xFF0001FC : 0xFF0A1034)); // icon
}
