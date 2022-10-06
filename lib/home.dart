import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController textEditingController = TextEditingController();
  GoogleTranslator translator = GoogleTranslator();
  // ignore: prefer_typing_uninitialized_variables
  var output;
  // ignore: prefer_typing_uninitialized_variables
  var dropdownValue;

  static Map<String, String> lang = {
    "English": "en",
    "Urdu": "ur",
    "Sindhi": "sd",
    "Arabic": "ar",
    "Punjabi": "pa",
    "Pashto": "ps",
  };

  void trans() {
    translator
        .translate(textEditingController.text, to: "$dropdownValue")
        .then((value) {
      setState(() {
        output = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 159, 185, 231),
        body: ColorfulSafeArea(
          color: Colors.transparent,
          // overflowRules: OverflowRules.all(true),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 60,
                  color: Color.fromARGB(255, 93, 153, 202),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, right: 10, left: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color.fromARGB(255, 175, 213, 243),
                      ),
                      child: Center(
                          child: Text(
                        "Translator App",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        // height: 100,
                        color: Color.fromARGB(255, 93, 153, 202),
                        child: Column(
                          children: [
                            Container(
                              height: 30,
                              width: 190,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(40),
                                  topRight: Radius.circular(40),
                                ),
                                color: Color.fromARGB(255, 175, 213, 243),
                              ),
                              child: Center(
                                  child: Text(
                                "Your Language",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        // height: 100,
                        color: Color.fromARGB(255, 93, 153, 202),
                        child: Column(
                          children: [
                            Container(
                              height: 30,
                              // width: MediaQuery.of(context).size.width * 0.50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(40),
                                  topLeft: Radius.circular(40),
                                ),
                                color: Color.fromARGB(255, 175, 213, 243),
                              ),
                              child: Center(
                                  child: Text(
                                "Select Language",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.94,
                  // height: 100,
                  color: Color.fromARGB(255, 93, 153, 202),
                  child: Column(
                    children: [
                      Container(
                        height: 70,
                        width: MediaQuery.of(context).size.width * 0.94,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(70),
                            topRight: Radius.circular(70),
                          ),
                          color: Color.fromARGB(255, 175, 213, 243),
                        ),
                        child: Row(
                          children: [
                            Center(
                              child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.32,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Center(
                                            child: Text(
                                          "Default",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ))
                                      ])),
                            ),
                            Center(
                              child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.30,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Center(
                                            child: InkWell(
                                                onTap: () {},
                                                child:
                                                    Icon(Icons.restart_alt))),
                                      ])),
                            ),
                            Center(
                              child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.30,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: DropdownButton<String>(
                                            value: dropdownValue,
                                            icon: const Icon(
                                                Icons.arrow_downward),
                                            iconSize: 24,
                                            elevation: 16,
                                            style: const TextStyle(
                                                color: Colors.deepPurple),
                                            underline: Container(
                                              height: 2,
                                              color: Colors.deepPurpleAccent,
                                            ),
                                            onChanged: (var newValue) {
                                              setState(() {
                                                dropdownValue = newValue;
                                                trans();
                                              });
                                            },
                                            items: lang
                                                .map((string, value) {
                                                  return MapEntry(
                                                    string,
                                                    DropdownMenuItem<String>(
                                                      value: value,
                                                      child: Text(string),
                                                    ),
                                                  );
                                                })
                                                .values
                                                .toList(),
                                          ),
                                        )
                                      ])),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60,
                    child: TextField(
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                      controller: textEditingController,
                      onTap: () {
                        trans();
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(59)),
                          labelText: 'Type Here',
                          labelStyle:
                              TextStyle(fontSize: 18, color: Colors.black),
                          suffixIcon: InkWell(
                              onTap: () {
                                trans();
                              },
                              child: Icon(
                                Icons.send,
                                color: Colors.black,
                              ))),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Text("Select Language here =>"),
                  ],
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.94,
                          // height: 100,
                          color: Color.fromARGB(255, 93, 153, 202),
                          child: Column(
                            children: [
                              Container(
                                height: 30,
                                // width: MediaQuery.of(context).size.width * 0.50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(40),
                                    topLeft: Radius.circular(40),
                                  ),
                                  color: Color.fromARGB(255, 175, 213, 243),
                                ),
                                child: Center(
                                    child: Text(
                                  "Translated Text:",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            output == null
                                ? "Please Select Language"
                                : output.toString(),
                            style: const TextStyle(
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
