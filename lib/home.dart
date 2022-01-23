import 'package:eticaret/bottomNavigation.dart';
import 'package:eticaret/categories.dart';
import 'package:flutter/material.dart';

import 'label.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                children: [
                  //Başlık
                  buildBaslik(),

                  //banner
                  buildBanner(),
                  //butonlar
                  Padding(
                    padding: EdgeInsets.only(top: 48),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildNavigation(text: "Categories", icon: Icons.menu,widget: CategoriesPage(),context: context),
                        buildNavigation(
                            text: "Favorites ", icon: Icons.star_border,widget: CategoriesPage(),context: context),
                        buildNavigation(
                            text: "Gifts", icon: Icons.card_giftcard,widget: CategoriesPage(),context: context),
                        buildNavigation(
                            text: "Best selling", icon: Icons.people,widget: CategoriesPage(),context: context),
                      ],
                    ),
                  ),
                  //sales
                  SizedBox(height: 40),
                  //salestitle
                  Center(
                    child: Text(
                      "SALES",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Color(0xFF0A1034),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  //salesitem
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildSalesItem(
                          text: "Akıllı Telefon",
                          photoUrl: "assets/telefons.png",
                          discount: "-%30",
                          screenWidth: screenWidth),
                      buildSalesItem(
                          text: "Laptop",
                          photoUrl: "assets/Laptop.png",
                          discount: "-%20",
                          screenWidth: screenWidth),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildSalesItem(
                          text: "Akıllı Telefon",
                          photoUrl: "assets/telefons.png",
                          discount: "-%30",
                          screenWidth: screenWidth),
                      buildSalesItem(
                          text: "Laptop",
                          photoUrl: "assets/Laptop.png",
                          discount: "-%20",
                          screenWidth: screenWidth),
                    ],
                  ),
                ],
              ),
            ),
            //bottom navigation bar
            bottomNavigationBar("home"),
          ],
        ),
      ),
    );
  }
}

Widget buildBaslik() {
  return Padding(
    padding: const EdgeInsets.only(top: 24.0),
    child: Text(
      "Home",
      style: TextStyle(
          fontSize: 32, color: Color(0xFF0A1034), fontWeight: FontWeight.bold),
    ),
  );
}

Widget buildBanner() {
  return Padding(
    padding: EdgeInsets.only(top: 24.0),
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 24, right: 36, top: 14, bottom: 18),
      decoration: BoxDecoration(
          color: Color(0xFF0001FC), borderRadius: BorderRadius.circular(6)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Bose Home Speaker",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "USD 300",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Image.asset(
            "assets/bose_30.png",
            width: 70,
            height: 78,
          ),
        ],
      ),
    ),
  );
}

Widget buildNavigation({
  String? text,
  IconData? icon,
  Widget? widget,
  BuildContext? context,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context!, MaterialPageRoute(builder: (context) {
        return widget!;
      }));
    },
    child: Column(
      children: [
        Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFE0ECF8),
            ),
            padding: EdgeInsets.symmetric(horizontal: 19, vertical: 22),
            child: Icon(
              icon,
              color: Color(0xFF0001FC),
              size: 18,
            )),
        SizedBox(height: 8),
        Text(text!,
            style: TextStyle(
              color: Color(0XFF1F53E4),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            )),
      ],
    ),
  );
}

Widget buildSalesItem(
    {@required String? text,
    @required String? photoUrl,
    @required String? discount,
    @required double? screenWidth}) {
  return Container(
    width: (screenWidth! - 60) * 0.5,
    padding: EdgeInsets.only(left: 12, top: 12, bottom: 21, right: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label(discount!),
        SizedBox(height: 22),
        Center(
          child: Image.asset(
            photoUrl!,
            width: 61.7,
            height: 130,
          ),
        ),
        SizedBox(height: 22),
        Center(
          child: Text(
            text!,
            style: TextStyle(fontSize: 18, color: Color(0xFF0A1034)),
          ),
        )
      ],
    ),
  );
}
