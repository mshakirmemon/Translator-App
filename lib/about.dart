import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/bg1.gif"), fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    height: MediaQuery.of(context).size.height * 0.45,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(100),
                          topRight: Radius.circular(100)),
                      // color: Color.fromARGB(255, 19, 36, 92),
                      gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              
                              Color.fromARGB(255, 120, 132, 201),
                              Color.fromARGB(255, 19, 36, 92),
                            ],
                            stops: [
                              0,9
                            ],
                          ),

                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 3,
                          blurRadius: 1,
                          offset: Offset(0, 2),
                        ),
                      ],
                      
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        // width: MediaQuery.of(context).size.width * 0.90,
                        // height: MediaQuery.of(context).size.height * 0.30,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(100),
                              topRight: Radius.circular(100)),
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              
                              Color.fromARGB(255, 120, 132, 211),
                              Color.fromARGB(255, 19, 36, 92),
                            ],
                            stops: [
                              0,9
                            ],
                          ),
                          // color: Color.fromARGB(255, 120, 132, 201),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              spreadRadius: 3,
                              blurRadius: 1,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                              "Translation is a process which is intended to find meaning equivalence in the target text."
                              "Translation is the communication of the meaning of a sourse-language text by means of an equivalent target-language text."
                              "Generally, translation is a process of rendering meaning, ideas, or messages of a text from one language to other language."
                              "It is necessary to understand the concept of translation as mentioned by many translation theorists to obtain an overall Text and voice  of the translation process."),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
