import 'package:flutter/material.dart';

import 'header.dart';
import 'label.dart';

class ProductDetailPage extends StatefulWidget {
  String productTitle;

  ProductDetailPage(this.productTitle);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  Color? selectedColor;

  List<Color> colors = [
    Color(0xFF52514F),
    Color(0xFF0001FC),
    Color(0xFF6F7972),
    Color(0xFFF5D8C0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //header
            header(widget.productTitle, context),
            SizedBox(height: 32),

            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    label("New"),

                    SizedBox(height: 25),
                    Image.asset("assets/telefons.png"),

                    SizedBox(height: 30),

                    // renk seçenekleri
                    Text(
                      "Color",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0a1034)),
                    ),
                    SizedBox(height: 16),


                    //hafıza

                    //sepete ekle
                    ],
                ))
          ]))
    ])));
  }
}

Widget colorOption(Color color,bool selected,Function onTap) {
  return GestureDetector(

    child: Container(
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(shape: BoxShape.circle, color: color,
      border: Border.all(color: Colors.blueAccent, width: selected ?3:0)),
      width: 23,
      height: 23,
    ),
  );
}
