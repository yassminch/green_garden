import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:green_garden/pages/result.dart';

import '../widgets/plantsNamesList.dart';

class SearchEdibalePalants extends StatefulWidget {
  const SearchEdibalePalants({super.key});

  @override
  State<SearchEdibalePalants> createState() => _SearchEdibalePalantsState();
}

class _SearchEdibalePalantsState extends State<SearchEdibalePalants> {
  int len = 0;
  List<dynamic> plants = [];

  @override
  void initState() {
    super.initState();
    fetchPlants(); // Appel de la fonction lors du chargement de la page
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromARGB(224, 126, 201, 149),
          title: const Text("Green Garden -- Edibale Palants"),
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 30.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //text 'Edibale Plants'
                  
                     Center(
                       child: const Text("Edibale Plants ",
                          style: TextStyle(
                              fontFamily: 'Parisienne',
                              color: Color.fromARGB(224, 125, 189, 145),
                              letterSpacing: 1.0,
                              fontSize: 28)),
                     ),
                  
                  //image
                  Container(
                    child: Image.asset("assets/b1.jpeg", fit: BoxFit.cover),
                  ),
                  // list of ediable plants !
                  PlantsName(
                    size: 25,
                    Name: 'Click on the name below to see more',
                    color: Color.fromARGB(255, 31, 1, 1),
                  ),

                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          // Use an AssetImage for your image and set fit as per your choice
                          /*image: DecorationImage(
                            image: AssetImage(
                                'assets/edibale2.jpeg'), // Replace with your image path
                            fit: BoxFit.fitWidth,
                            repeat: ImageRepeat.repeat, 
                            // Set the fit as needed
                          ),*/
                          border: Border.all(
                            color: const Color.fromARGB(
                                255, 97, 1, 1), // Couleur de la bordure
                            width: 0.5, // Épaisseur de la bordure
                          ),
                          borderRadius: BorderRadius.circular(
                              12.0), // Pour arrondir les coins du Container
                        ),
                        height: len * 40,
                        child: ListView.builder(
                          itemCount: len,
                          itemBuilder: (context, index) {
                            final plant = plants[index];
                            final scientificName = plant['scientific_name'];
                            final imageUrl = plant['image_url'];
                            final rank = plant['rank'];
                            final familyName = plant['family'];
                            final synonyms = plant['synonyms'];
                            final commonName = plant['common_name'];
                            final genus = plant['genus'];

                            return PlantsName(
                                size: 25,
                                Name: commonName,
                                color: Color.fromARGB(255, 197, 63, 63),
                                ontap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Result(
                                                name: commonName,
                                                plant: plant,
                                                scientificName: scientificName,
                                                imageUrl: imageUrl,
                                                rank: rank,
                                                familyName: familyName,
                                                synonyms: synonyms,
                                                genus: genus,
                                              )));
                                });
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }

  void fetchPlants() async {
    plants.clear();
    List<dynamic> firstResult = [];
    List<dynamic> secondResult = [];
    print("-----------fetching Edibale plants !");

    for (int i = 0; i < 6; i++) {
      int s = i + 1;
      var url =
          "https://trefle.io/api/v1/plants?filter_not%5Bedible_part%5D=null&token=Z9bG2WD2XGvzvQlt5xRxLFqJrHeOAERrRDe-eoEVd4s&page=$s";
      print(url);
      final uri = Uri.parse(url);
      final result = await http.get(uri);
      final body = result.body;
      final json = jsonDecode(body);
      setState(() {
        firstResult = json[
            "data"]; // data=[{},{},{}....] =>  firstResult = liste de 6 data => [ [{},{},{}....],[{},{},{}....],[{},{},{}....],[{},{},{}....],[{},{},{}....],[{},{},{}....]]
      });

      print("----------fetching page $s finished ");
      print("names : ");

      // on va creer une liste comme suit [ {},{},{},{},{},{},{},{},{},{}.......]
      // firstResult = liste de 6 data => [ [{},{},{}....],[{},{},{}....],[{},{},{}....],[{},{},{}....],[{},{},{}....],[{},{},{}....]]
      firstResult.forEach((element) {
        secondResult.add(element);
      });
      //secondResult.add(firstResult[i]);  //firstResult[i] = {},{},{}....
      print(firstResult.length);
      firstResult.forEach((element) {
        if (element['common_name'] != null) {
          plants.add(element);
          print(element['common_name']);
        } else {
          print('commen name is null no add !!!!!!!');
        }
      });
    }

    print("plants found : " + plants.length.toString());
    plants.sort((a, b) => a['common_name'].compareTo(b['common_name']));

    len = plants.length;
    print("len : " + len.toString());
    print(firstResult[3]);
  }
}
