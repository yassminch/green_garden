import 'package:flutter/material.dart';
import 'package:green_garden/pages/thankyou.dart';

import '../widgets/CustomButton.dart';
import '../widgets/CustomText.dart';
import '../widgets/plantsNamesList.dart';

class Result extends StatefulWidget {
  final String name; // nom du plante
  final dynamic plant; // plant elemnet
  final String imageUrl; // image url
  final String familyName; // famille du plante
  final List<dynamic> synonyms; // les noms synonymes du plante
  final String genus; // le group du plante
  final String rank; // le rank du plante
  final String scientificName; // le nom scientific
  const Result({
    Key? key,
    required this.name,
    required this.plant,
    required this.imageUrl,
    required this.familyName,
    required this.genus,
    required this.rank,
    required this.scientificName,
    required this.synonyms,
  }) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  int len = 0;
  List<String> synonymNames = [];
  @override
  Widget build(BuildContext context) {
    if (widget.synonyms.isNotEmpty) {
      len = widget.synonyms.length;
    } else {
      len = 0;
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(224, 126, 201, 149),
        title: Text("Green Garden -- Plant: "+ widget.name ),
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
              horizontal: 20.0,
              vertical: 30.0,
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    // name of the plant
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
                        child: Text(
                          widget.name,
                          style: TextStyle(
                            fontFamily: 'Parisienne',
                            color: Color.fromARGB(224, 125, 189, 145),
                            fontSize : 28,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                    //display plants image
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 25.0, bottom: 20.0),
                        child: SizedBox(
                            height: 200,
                            child: Image.network(widget.imageUrl, loadingBuilder:
                                (BuildContext context, Widget child,
                                    ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else {
                                return CircularProgressIndicator();
                              }
                            }, fit: BoxFit.cover)),
                      ),
                    ),
      
                    // scientific Name of the plant
                    Padding(
                      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(stringvalue: "Scientific Name  : "),
                          // scientific Name of the plant
                          Text(
                            widget.scientificName,
                            style: TextStyle(
                              fontFamily: 'Parisienne',
                              color: Color.fromARGB(223, 1, 36, 12),
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
      
                    // familyname of the plant
                    Padding(
                      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            stringvalue: "Family Name : ",
                          ),
                          // familyname of the plant
                          Text(
                            widget.familyName,
                            style: TextStyle(
                              fontFamily: 'Parisienne',
                              color: Color.fromARGB(223, 1, 36, 12),
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
      
                    // rank of the plant
                    Padding(
                      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            stringvalue: "Rank : ",
                          ),
                          // rank of the plant
                          Text(
                            widget.rank,
                            style: TextStyle(
                              fontFamily: 'Parisienne',
                              color: Color.fromARGB(223, 1, 36, 12),
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
      
                    // genus of the plant
                    Padding(
                      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            stringvalue: 'Genus(group/type) : ',
                          ),
                          Text(
                            // genus of the plant
                            widget.genus,
                            style: TextStyle(
                              fontFamily: 'Parisienne',
                              color: Color.fromARGB(223, 1, 36, 12),
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
      
                    // synonyme names of the plant
                    Padding(
                      padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // synonyme names of the plant and number of synonyms
                          Column(
                            children: [
                              CustomText(
                                stringvalue: "Synonym Names : ",
                              ),
                              Text(
                                "(" + nbsynonms() + ")",
                                style: TextStyle(
                                  fontFamily: 'Parisienne',
                                  color: Color.fromARGB(223, 2, 88, 29),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Container(
                              width: 200,
                              height: len * 51,
                              child: ListView.builder(
                                  itemCount: len,
                                  itemBuilder: (context, index) {
                                    print(len);
                                    int number = index + 1;
                                    widget.synonyms.sort();
                                    final synName = "$number . " +
                                        widget.synonyms[index].toString();
      
                                    return PlantsName(
                                      size: 20,
                                      Name: synName,
                                      color: Color.fromARGB(255, 197, 63, 63),
                                    );
                                  })),
                        ],
                      ),
                    ),
      
                    Padding(
                      padding: const EdgeInsets.only(top:20,left:200),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomButton(
                            nom: "Finish",
                            role: () {
                              print("Button Finish Prssed ");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const ThankYou()));
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String nbsynonms() {
    String nbsy;
    if (len == 0) {
      nbsy = 'No synonyme found !';
    } else {
      nbsy = len.toString() + ' Synonyms found ! ';
    }
    return nbsy;
  }
}
