import 'package:flutter/material.dart';
import 'package:green_garden/pages/search.dart';
import 'package:green_garden/pages/searchEdibalePlants.dart';
import '../widgets/CustomButton.dart';

class bienvenue extends StatelessWidget {
  const bienvenue({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromARGB(224, 125, 189, 145),
          title: const Text("Green Garden"),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 20.0,
              ),
              child: Column(
                children: [
                  Container(
                    child: Image.asset("assets/bienvenueimg.jpeg",
                        fit: BoxFit.cover),
                  ),
                  //Text 'Keep Your Plants Alive '
                  const Text("Keep Your Plants Alive ",
                      style: TextStyle(
                          fontFamily: 'Parisienne',
                          color: Color.fromARGB(224, 125, 189, 145),
                          fontSize: 28)),
                  //Text 'Discover everything you need to know about the plant you're seeking.\n\tWelcome to your Green Haven !'
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 25.0, bottom: 70.0, right: 8.0, left: 8.0),
                    child: const Text(
                        "Discover everything you need to know about the plant you're seeking.\n\tWelcome to your Green Haven !",
                        style: TextStyle(
                            fontFamily: 'XanhMono',
                            color: Color.fromARGB(223, 6, 15, 9),
                            fontSize: 20)),
                  ),
                  CustomButton(
                    nom: "Start Search",
                    role: () {
                      print("Button Start Search is pressed! ");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Search()));
                    },
                  ),
                  CustomButton(
                    nom: "Edibale Plants",
                    role: () {
                      print("Button Edibale Plants is pressed! ");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SearchEdibalePalants()));
                    },
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
