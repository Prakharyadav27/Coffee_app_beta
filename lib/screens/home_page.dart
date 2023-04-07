// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffee_apk/utils/coffe_card.dart';
import 'package:coffee_apk/utils/coffe_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class home_Page extends StatefulWidget {
  @override
  State<home_Page> createState() => _home_PageState();
}

class _home_PageState extends State<home_Page> {
  // List of coffee types
  List coffeeTypes = [
    // [coffeeTypes, isSelected]
    ['Cappuccino', true],
    ['Latte', false],
    ['Black', false],
    ['Tea', false],
  ];
  // User tapped on coffee Types
  void coffeeTypesSelected(int index) {
    setState(() {
      // this loop make every selection false
      for (int i = 0; i < coffeeTypes.length; i++) {
        coffeeTypes[i][1] = false;
      }
      coffeeTypes[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Icon(Icons.person),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
              ),
              label: ''),
        ],
      ),
      body: Column(
        children: [
          // find the best cofee for u
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Find the best cofee for you',
              style: GoogleFonts.bebasNeue(fontSize: 70),
            ),
          ),
          SizedBox(
            height: 25,
          ),

          // Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Find your coffee..',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600))),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          // Cofee types
          Container(
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: coffeeTypes.length,
                  itemBuilder: (context, index) {
                    return Coffee_type(
                      coffee_type: coffeeTypes[index][0],
                      isSelected: coffeeTypes[index][1],
                      Ontap: () {
                        coffeeTypesSelected(index);
                      },
                    );
                  })),
          // Coffee cards Listview
          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Coffee_card(
                  coffeeimage: 'assets/images/cappucino.jpg',
                  coffeeName: 'Latte',
                  coffeePrice: '4.10'),
              Coffee_card(
                  coffeeimage: 'assets/images/Latte.jpg',
                  coffeeName: 'Cappucciono',
                  coffeePrice: '6.20'),
              Coffee_card(
                  coffeeimage: 'assets/images/black.jpg',
                  coffeeName: 'Black',
                  coffeePrice: '3.35'),
            ],
          ))
        ],
      ),
    );
  }
}
