import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../widgets/plantsNamesList.dart';
import 'result.dart';

import '../widgets/CustomButton.dart';
import '../widgets/CustomField.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String resultMessage = '';
  List<dynamic> plants = [];
  int len = 0;
  final formkey = GlobalKey<FormState>();
  String plantName = "";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromARGB(224, 126, 201, 149),
          title: const Text("Green Garden -- Search Page"),
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
                  //text 'search for plants'
          
                    Center(
                      child: const Text("Search for Plants ",
                          style: TextStyle(
                              fontFamily: 'Parisienne',
                              color: Color.fromARGB(224, 125, 189, 145),
                              letterSpacing: 1.0,
                              fontSize: 28)),
                    ),
                  
                  //image
                  Container(
                    child: Image.asset("assets/searchplant.jpeg",
                        fit: BoxFit.cover),
                  ),
                  // formulaire de recherche
                  Form(
                    key: formkey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        // search input
                        CustomField(
                          label: "Plant Name",
                          hint: "Enter Plant Name...",
                          iconDATA: Icons.local_florist,
                          typeInput: TextInputType.text,
                          saved: (value) {
                            plantName = value!;
                          },
                          valider: (value) {
                            if (value == null || value.length == 0) {
                              return "Please enter a Plant Name";
                            } else {
                              if (value.length <= 1) {
                                return "Are you for real ! ";
                              } else {
                                return null;
                              }
                            }
                          },
                        ),
                        // button search
                        CustomButton(
                          nom: "Search",
                          role: () {
                            /*Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Result()));*/
                            if (formkey.currentState!.validate()) {
                              //requperation des données
                              print("Search ... Valid Name !");
                              formkey.currentState!.save();
                              print("Plant's Name : " + plantName!);
                              fetchPlants(plantName);
                              //db.addPlant(plant);
                            } else {
                              print(".... Not Valid !");
                            }
                          },
                        ),
                      ],
                    ),
                  ),

                  // Result message si il ya du resultat 'Click on the name below to see more' sinon 'No Such plant ! '
                  PlantsName(
                    size: 25,
                    Name: resultMessage,
                    color: Color.fromARGB(255, 31, 1, 1),
                  ),

                  // liste des resultat obtenues apres recherche
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Container(
                        decoration: BoxDecoration(
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

  void fetchPlants(String? plantName) async {
    plants.clear();
    List<dynamic> firstResult = [];
    print("-----------fetching plants  !");
    var url =
        "https://trefle.io/api/v1/plants/search?token=Z9bG2WD2XGvzvQlt5xRxLFqJrHeOAERrRDe-eoEVd4s&q=$plantName";
    //const url = "https://perenual.com/api/species-list?key=sk-ZHmI655fb6423c0253102";
    print(url);
    final uri = Uri.parse(url);
    final result = await http.get(uri);
    final body = result.body;
    final json = jsonDecode(body);
    setState(() {
      firstResult = json["data"];
    });

    print("----------fetching finished");
    print("names : ");
    firstResult.forEach((element) {
      if (element['common_name'] != null) {
        plants.add(element);
        print(element['common_name']);
      } else {
        print('commen name is null no add !!!!!!!');
      }
    });
    print("plants found : " + plants.length.toString());
    len = plants.length;
    print("len : " + len.toString());

    if (len != 0) {
      resultMessage = 'Click on the name below to see more';
    } else {
      resultMessage = 'No Such plant ! ';
    }
    print(resultMessage);
  }
}
