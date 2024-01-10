import 'package:flutter/material.dart';
import '../widgets/CustomButton.dart';
import 'bienvenue.dart';

class ThankYou extends StatelessWidget {
  const ThankYou({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromARGB(224, 125, 189, 145),
          title: const Text("Green Garden"),
        ),
        body: Center(
          child: SingleChildScrollView(
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
                    //Text 'Keep Your Plants Alive '
                    const Text("Thank you for Growing Green with Us!\nMay Your Garden Flourish With Every Seed Planted! ",
                        style: TextStyle(
                            fontFamily: 'Parisienne',
                            color: Color.fromARGB(224, 125, 189, 145),
                            fontSize: 30)),
        
                    
                    //image thank you
                    Container(
                      child:
                          Image.asset("assets/thankyou2.png", fit: BoxFit.cover),
                    ),
                    //Text 'Discover everything you need to know about the plant you're seeking.\n\tWelcome to your Green Haven !'
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 25.0, bottom: 30.0, right: 8.0, left: 8.0),
                      child: Column(
                        children: [
                          const Text(
                              "This App was developed by Yassmine Chayeb ",
                              style: TextStyle(
                                  fontFamily: 'Sacramento',
                                  color: Color.fromARGB(223, 6, 15, 9),
                                  fontSize: 30)),
                                  Text(
                              "Yassmine Chayeb\nDSI3.2 ",
                              style: TextStyle(
                                  fontFamily: 'Parisienne',
                                  color: Color.fromARGB(223, 6, 15, 9),
                                  fontSize: 30)),
                        ],
                      ),
                    ),
                    CustomButton(
                      nom: "OK",
                      role: () {
                        print("Button Ok Prssed ");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const bienvenue()));
                      },
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
