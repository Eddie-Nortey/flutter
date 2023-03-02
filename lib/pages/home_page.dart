import 'package:coffeeui/utils/coffe_tiles.dart';
import 'package:coffeeui/utils/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of coffee types
  final List coffeeTypes = [
    //[coffee type, isSelected]
    [
      'Cappucino',
      true,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Black',
      false,
    ],
    [
      'Tea',
      false,
    ],
  ];
  // user tapped on coffee types
  void coffeeTypeSelected(int index) {
    setState(() {
      //loop  to make every selection false
      for (int i = 0; i < coffeeTypes.length; i++) {
        coffeeTypes[i][1] = false;
      }
      coffeeTypes[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: const Icon(Icons.menu),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(Icons.person),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ""),
          ],
        ),
        body: Column(
          children: [
            //find the best coffee for you
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "Find the best coffee for you",
                style: GoogleFonts.bebasNeue(
                  fontSize: 56,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),

            //Search bar

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Find your coffee..",
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),

            //horizontal listview of coffee types
            SizedBox(
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: coffeeTypes.length,
                  itemBuilder: (context, index) {
                    return CoffeeType(
                        coffeeType: coffeeTypes[index][0],
                        isSelected: coffeeTypes[index][1],
                        onTap: () {
                          coffeeTypeSelected(index);
                        });
                  }),
            ),

            //horizontal listview of coffee
            SizedBox(
              height: MediaQuery.of(context).size.height /3,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CoffeeTile(
                    coffeeImagePath: 'assets/images/coffeegreen.jpg',
                    coffeePrice: '4.20',
                    coffeeName: 'Cappucino',
                  ),

                  CoffeeTile(
                    coffeeImagePath: 'assets/images/milk.jpg',
                    coffeePrice: '4.20',
                    coffeeName: 'Latte',
                  ),
                  CoffeeTile(
                    coffeeImagePath: 'assets/images/mixture.jpg',
                    coffeePrice: '4.20',
                    coffeeName: 'black',
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
