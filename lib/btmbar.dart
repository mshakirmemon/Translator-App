// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names

// import 'dart:ui';

import 'dart:ui';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:pandabar/pandabar.dart';
import 'package:translator/translator.dart';
import 'package:translator_app/about.dart';
import 'package:translator_app/developer.dart';
import 'package:translator_app/main.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:animated_button/animated_button.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
// import 'package:gradient_app_bar/gradient_app_bar.dart';

// import 'package:animated_button/animated_button.dart';
class BtmMainpage extends StatefulWidget {
  const BtmMainpage({Key? key}) : super(key: key);

  @override
  State<BtmMainpage> createState() => _BtmMainpageState();
}

class _BtmMainpageState extends State<BtmMainpage> {
  String page = 'Blue';
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  var _lastWords;
  var output, voice_speech;
  var dropdownValue;
  @override
  void initState() {
    super.initState();
    _initSpeech();
    super.initState();
  }

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
    });
  }

  TextEditingController textEditingController = TextEditingController();
  GoogleTranslator translator = GoogleTranslator();
  static Map<String, String> lang = {
    "Afrikaans		": "af",
    "Albanian			": "sq",
    "Amharic			": "am",
    "Arabic				": "ar",
    "Armenian			": "hy",
    "Assamese			": "as",
    "Azeri				": "az",
    "Basque				": "eu",
    "Belarusian		": "be",
    "Bengali			": "bn",
    "Bengali 			": "bn",
    "Bosnian			": "bs",
    "Bulgarian		": "bg",
    "Burmese			": "my",
    "Catalan			": "ca",
    "Chinese 			": "zh",
    "Croatian			": "hr",
    "Czech				": "cs",
    "Danish				": "da",
    "Dutch				": "nl",
    "Dutch 				": "nl",
    "English 			": "en",
    "Estonian			": "et",
    "Faroese			": "fo",
    "Farsi 				": "fa",
    "Finnish			": "fi",
    "French 			": "fr",
    "FYRO   			": "mk",
    "Gaelic 			": "gd",
    "Galician			": "gl",
    "Georgian			": "ka",
    "German 			": "de",
    "Greek				": "el",
    "Guarani 			": "gn",
    "Gujarati			": "gu",
    "Hebrew				": "he",
    "Hindi				": "hi",
    "Hungarian		": "hu",
    "Icelandic		": "is",
    "Indonesian		": "id",
    "Italian 			": "it",
    "Japanese			": "ja",
    "Kannada			": "kn",
    "Kashmiri			": "ks",
    "Kazakh				": "kk",
    "Khmer				": "km",
    "Korean				": "ko",
    "Lao				  ": "lo",
    "Latin				": "la",
    "Latvian			": "lv",
    "Lithuanian		": "lt",
    "Malay 				": "ms",
    "Malayalam		": "ml",
    "Maori				": "mi",
    "Marathi			": "mr",
    "Mongolian		": "mn",
    "Nepali				": "ne",
    "Norwegian 		": "nb",
    "Oriya				": "or",
    "Polish				": "pl",
    "Portuguese 	": "pt",
    "Punjabi			": "pa",
    "Raeto				": "rm",
    "Romanian			": "ro",
    "Russian 			": "ru",
    "Sanskrit			": "sa",
    "Serbian 			": "sr",
    "Setsuana	    ": "tn",
    "Sindhi				": "sd",
    "Sinhala			": "si",
    "Slovak				": "sk",
    "Slovenian		": "sl",
    "Somali				": "so",
    "Sorbian			": "sb",
    "Spanish 			": "es",
    "Swahili			": "sw",
    "Swedish 			": "sv",
    "Tajik				": "tg",
    "Tamil				": "ta",
    "Tatar				": "tt",
    "Telugu				": "te",
    "Thai				  ": "th",
    "Tibetan			": "bo",
    "Tsonga				": "ts",
    "Turkish			": "tr",
    "Turkmen			": "tk",
    "Ukrainian		": "uk",
    "Urdu				  ": "ur",
    "Uzbek 				": "uz",
    "Vietnamese		": "vi",
    "Welsh				": "cy",
    "Xhosa				": "xh",
    "Yiddish			": "yi",
    "Zulu				  ": "zu",
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

  void transvoice() {
    translator.translate(_lastWords, to: "$dropdownValue").then((value) {
      setState(() {
        voice_speech = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color.fromARGB(255, 19, 36, 92),
            const Color.fromARGB(255, 19, 36, 92),
            Color.fromARGB(255, 120, 132, 201),
            const Color.fromARGB(255, 19, 36, 92),
          ],
        ),
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu));
        }),
        centerTitle: true,
        title: const Center(
          child: Text("Translator App",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              )),
        ),
        actions: [
          PopupMenuButton(
              icon: const Icon(Icons.more_vert),
              itemBuilder: (context) => [
                    const PopupMenuItem(
                        child: InkWell(child: Text("Privacy Policy"))),
                    const PopupMenuItem(child: InkWell(child: Text("Setting"))),
                    PopupMenuItem(
                        child: InkWell(
                            onTap: () {
                              showd();
                            },
                            child: const Text("Voice Translation"))),
                  ]),
        ],
      ),
      drawer: SafeArea(
        child: Drawer(
          // backgroundColor: const Color(0xff7884c9),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Color.fromARGB(255, 160, 171, 233),
                  Color.fromARGB(255, 19, 36, 92),
                ],
              ),
            ),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color.fromARGB(255, 160, 171, 233),
                            Color.fromARGB(255, 19, 36, 92),
                          ],
                          stops: [
                            0.0,
                            1.0
                          ]),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 2,
                          blurRadius: 1,
                          offset: Offset(1, 1),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(40),
                      color: const Color.fromARGB(255, 19, 36, 92)),
                  height: MediaQuery.of(context).size.height * 0.30,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            width: 180,
                            height: 180,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 2,
                                  blurRadius: 1,
                                  offset: Offset(1, 1),
                                ),
                              ],
                            ),
                            child: const CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage("assets/drawer.gif"),
                              // child: Image.asset("assets/drawer.gif")),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  leading: const Icon(Icons.search, color: Colors.black),
                  title: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.40,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: DropdownButton<String>(
                                value: dropdownValue,
                                // iconDisabledColor: Colors.red,

                                // iconEnabledColor: Colors.blue,

                                icon: Row(
                                  children: [
                                    Container(
                                      width: 50,
                                      // child:
                                      // Image.asset("assets/select.gif"),
                                    ),
                                    AvatarGlow(
                                      animate: _speechEnabled,
                                      glowColor: Colors.blueAccent,
                                      endRadius: 40,
                                      duration:
                                          const Duration(milliseconds: 2000),
                                      repeatPauseDuration:
                                          const Duration(milliseconds: 200),
                                      repeat: true,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text(
                                              'Select ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "Language",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ]),
                                    )
                                  ],
                                ),
                                // iconSize: 10,
                                // elevation: 16,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                                underline: Container(
                                  height: 2,
                                  color: const Color.fromARGB(255, 0, 0, 0),
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
                                          child: Text(
                                            string,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      );
                                    })
                                    .values
                                    .toList(),
                              ),
                            )
                          ])),
                ),
              ),
              InkWell(
                onTap: () {
                  showd();
                },
                child: const ListTile(
                  leading: Icon(Icons.mic, color: Colors.black),
                  title: Text(
                    "Voice To Text Translation",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: const ListTile(
                  leading: Icon(Icons.privacy_tip, color: Colors.black),
                  title: Text(
                    "Privacy Policy",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: const ListTile(
                  leading: Icon(Icons.settings, color: Colors.black),
                  title: Text(
                    "Settings",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  const About();
                },
                child: InkWell(
                  onTap: () {
                    const About();
                  },
                  child: const ListTile(
                    leading: Icon(Icons.info, color: Colors.black),
                    title: Text(
                      "About",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  const About();
                },
                child: const ListTile(
                  leading: Icon(Icons.developer_mode, color: Colors.black),
                  title: Text(
                    "Developer",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
      // backgroundColor: Colors.blue,
      extendBody: true,
      bottomNavigationBar: PandaBar(
        buttonData: [
          PandaBarButtonData(id: 'home', icon: Icons.home, title: 'Home'),

          PandaBarButtonData(id: 'voce', icon: Icons.mic, title: 'Voice'),

          // PandaBarButtonData(id: 'Green', icon: Icons.multiple_stop,title: 'Home'),
          PandaBarButtonData(id: 'about', icon: Icons.info, title: 'About'),
          PandaBarButtonData(id: 'dev', icon: Icons.code, title: 'Develper'),
        ],
        onChange: (id) {
          setState(() {
            page = id;
          });
        },
        buttonColor: const Color(0xff7884c9),
        backgroundColor: Color(0xff0b185f),

        // const Color.fromARGB(255, 19, 36, 92),
        buttonSelectedColor: const Color.fromARGB(255, 186, 193, 231),
        fabColors: const [
          // Colors.w,
          Color(0xff7884c9),
          Color(0xff0b185f),
        ],
        fabIcon: InkWell(
          autofocus: true,
          onTap: _speechToText.isAvailable ? _startListening : _stopListening,

          child: Icon(_speechToText.isListening ? Icons.mic : Icons.mic_off,
              size: 30, color: Colors.white),
          // onDoubleTap: Function(Navigator.push(context, route)),
        ),

        // fabIcon: InkWell(
        //   onTap: _speechToText.isAvailable ? _startListening : _stopListening,
        //   // },

        //   child: Icon(_speechToText.isListening ? Icons.mic : Icons.mic_off,
        //       size: 30, color: Colors.white),
        // ),

        onFabButtonPressed: () {
          _speechToText.isAvailable ? _startListening : _stopListening;
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => txtpage()));
          // showCupertinoDialog(
          //   context: context,
          //   builder: (context) {
          //     return CupertinoAlertDialog(
          //       content: Text('Fab Button Pressed!'),
          //       actions: <Widget>[
          //         CupertinoDialogAction(
          //           child: Text('Close'),
          //           isDestructiveAction: true,
          //           onPressed: () {
          //             Navigator.pop(context);
          //           },
          //         )
          //       ],
          //     );
          //   }
          // );
        },
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 120, 132, 201),
              Color.fromARGB(255, 19, 36, 92),
            ],
          ),
        ),
        child: Builder(
          builder: (context) {
            switch (page) {
              case 'home':
                return Scaffold(
                  body: SingleChildScrollView(
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/bg1.gif"),
                                fit: BoxFit.cover)),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, left: 5, right: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.40,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(100),
                                            topRight: Radius.circular(100)),
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color.fromARGB(255, 120, 132, 201),
                                            Color.fromARGB(255, 120, 132, 201),
                                            Color.fromARGB(255, 19, 36, 92),
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
                                      child: const Center(
                                          child: const Text(
                                        "English",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const MyApp()));
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.15,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.06,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(160),
                                              topRight: Radius.circular(160)),
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color.fromARGB(
                                                  255, 120, 132, 201),
                                              Color.fromARGB(255, 19, 36, 92),
                                              Color.fromARGB(
                                                  255, 120, 132, 201),
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
                                        child: const Icon(Icons.multiple_stop,
                                            color: Color.fromARGB(
                                                255, 154, 164, 219)),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.40,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(100),
                                            topRight: Radius.circular(100)),
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color.fromARGB(255, 19, 36, 92),
                                            Color.fromARGB(255, 120, 132, 201),
                                            Color.fromARGB(255, 120, 132, 201),
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
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: DropdownButton<String>(
                                          value: dropdownValue,
                                          icon: const Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.black),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          underline: Container(
                                            height: 2,
                                            color: const Color.fromARGB(
                                                255, 0, 0, 0),
                                          ),
                                          onChanged: (var newValue) {
                                            setState(() {
                                              dropdownValue = newValue;
                                              trans();
                                              transvoice();
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
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // row language
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 20,
                                ),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.95,
                                  height:
                                      MediaQuery.of(context).size.height * 0.22,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(100),
                                        topRight: Radius.circular(100)),
                                    gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [
                                        Color.fromARGB(255, 120, 132, 201),
                                        Color.fromARGB(255, 19, 36, 92),
                                        Color.fromARGB(255, 120, 132, 201),
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
                                      width: MediaQuery.of(context).size.width *
                                          0.95,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.20,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(100),
                                            topRight: Radius.circular(100)),
                                        gradient: LinearGradient(
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomLeft,
                                          colors: [
                                            Color.fromARGB(255, 19, 36, 92),
                                            Color.fromARGB(255, 120, 132, 201),
                                            Color.fromARGB(255, 120, 132, 201),
                                            Color.fromARGB(255, 19, 36, 92),
                                          ],
                                        ),
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
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 20, right: 20),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              TextFormField(
                                                controller:
                                                    textEditingController,
                                                onTap: () {
                                                  setState(() {
                                                    trans();
                                                    transvoice();
                                                  });
                                                },
                                                // expands: true,
                                                cursorColor: Colors.black,

                                                decoration: const InputDecoration(
                                                    hintText:
                                                        "Type for Translation",
                                                    hintStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    border: OutlineInputBorder(
                                                        borderSide:
                                                            BorderSide.none)),

                                                smartDashesType:
                                                    SmartDashesType.enabled,
                                                textDirection:
                                                    TextDirection.ltr,
                                                focusNode: FocusNode(
                                                  canRequestFocus: true,
                                                  descendantsAreFocusable: true,
                                                  skipTraversal: true,
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: AnimatedButton(
                                                    child: const Text(
                                                        "Translate"), // Child widget, Row, Text, Column,...etc.
                                                    onPressed: () {
                                                      setState(() {
                                                        trans();
                                                        transvoice();
                                                      });
                                                    },
                                                    duration: 10,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.25,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.04,
                                                    // enabled: true,
                                                    shape: BoxShape.rectangle,
                                                    shadowDegree:
                                                        ShadowDegree.dark,
                                                    color: const Color.fromARGB(
                                                        255, 120, 132, 201)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              Padding(
                                //textfield
                                padding: const EdgeInsets.only(
                                  top: 20,
                                ),
                                child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.95,
                                    // height: MediaQuery.of(context).size.height * 0.42,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(100),
                                          topLeft: Radius.circular(100)),
                                      gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          // Color.fromARGB(255, 120, 132, 201),

                                          Color.fromARGB(255, 19, 36, 92),
                                          Color.fromARGB(255, 120, 132, 201),
                                          Color.fromARGB(255, 19, 36, 92),
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
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.90,
                                            // height:
                                            //     MediaQuery.of(context).size.height * 0.18,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(100),
                                                  topLeft:
                                                      Radius.circular(100)),
                                              gradient: LinearGradient(
                                                  begin: Alignment.topRight,
                                                  end: Alignment.bottomLeft,
                                                  colors: [
                                                    // Color.fromARGB(255, 120, 132, 201),

                                                    Color.fromARGB(
                                                        255, 120, 132, 201),
                                                    Color.fromARGB(
                                                        255, 19, 36, 92),
                                                  ]),
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
                                              padding:
                                                  const EdgeInsets.all(30.0),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                        textEditingController
                                                            .text,
                                                        style:
                                                            const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black)),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                        textEditingController
                                                                    .text
                                                                    .isEmpty &&
                                                                _lastWords ==
                                                                    null
                                                            ? "Type Or Talk"
                                                            : "",
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black,
                                                        )),
                                                    Text(_lastWords ?? "",
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black,
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.90,
                                            // height:
                                            //     MediaQuery.of(context).size.height * 0.18,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(100),
                                                  topLeft:
                                                      Radius.circular(100)),
                                              gradient: LinearGradient(
                                                  begin: Alignment.topRight,
                                                  end: Alignment.bottomLeft,
                                                  colors: [
                                                    // Color.fromARGB(255, 120, 132, 201),

                                                    Color.fromARGB(
                                                        255, 19, 36, 92),
                                                    Color.fromARGB(
                                                        255, 120, 132, 201),
                                                  ]),
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
                                              padding:
                                                  const EdgeInsets.all(30.0),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      output == null
                                                          ? ""
                                                          : output.toString(),
                                                      style: const TextStyle(
                                                        // fontSize: 20,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    if (voice_speech == null &&
                                                        output == null) ...{
                                                      const Text(
                                                        "Select Language",
                                                        style: TextStyle(
                                                          // fontSize: 20,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    },
                                                    Text(
                                                      voice_speech == null
                                                          ? ""
                                                          : voice_speech
                                                              .toString(),
                                                      style: const TextStyle(
                                                        // fontSize: 20,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                              ), //textfield
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.30,
                              )
                            ],
                          ),
                        )),
                  ),
                );
              case 'dev':
                return const Develp();

              case 'voce':
                return Scaffold(
                  body: SingleChildScrollView(
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/bg1.gif"),
                                fit: BoxFit.cover)),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                
                                padding: const EdgeInsets.only(
                                    top: 20.0, left: 5, right: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.40,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(100),
                                            topRight: Radius.circular(100)),
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color.fromARGB(255, 19, 36, 92),
                                            Color.fromARGB(255, 120, 132, 201),
                                            Color.fromARGB(255, 120, 132, 201),
                                           
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
                                      child: const Center(
                                          child: Text(
                                        "English",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const MyApp()));
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.15,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.06,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(160),
                                              topRight: Radius.circular(160)),
                                          gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color.fromARGB(255, 19, 36, 92),
                                            Color.fromARGB(255, 120, 132, 201),
                                            Color.fromARGB(255, 120, 132, 201),
                                            Color.fromARGB(255, 19, 36, 92),
                                           
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
                                        child: const Icon(Icons.multiple_stop,
                                            color:Color.fromARGB(255, 19, 36, 92)),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.40,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(100),
                                            topRight: Radius.circular(100)),
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            
                                            Color.fromARGB(255, 120, 132, 201),
                                            Color.fromARGB(255, 120, 132, 201),
                                            Color.fromARGB(255, 19, 36, 92),
                                           
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
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: DropdownButton<String>(
                                          value: dropdownValue,
                                          icon: const Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.black),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          underline: Container(
                                            height: 2,
                                            color: const Color.fromARGB(
                                                255, 0, 0, 0),
                                          ),
                                          onChanged: (var newValue) {
                                            setState(() {
                                              dropdownValue = newValue;
                                              trans();
                                              transvoice();
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
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Padding(
                                //textfield
                                padding: const EdgeInsets.only(
                                  top: 20,
                                ),
                                child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.95,
                                    // height: MediaQuery.of(context).size.height * 0.42,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(100),
                                          topLeft: Radius.circular(100)),
                                      gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Color.fromARGB(255, 19, 36, 92),
                                            
                                            Color.fromARGB(255, 120, 132, 201),
                                            Color.fromARGB(255, 19, 36, 92),
                                           
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
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.90,
                                            // height:
                                            //     MediaQuery.of(context).size.height * 0.18,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(100),
                                                  topLeft:
                                                      Radius.circular(100)),
                                              gradient: LinearGradient(
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomLeft,
                                          colors: [
                                            Color.fromARGB(255, 19, 36, 92),
                                            Color.fromARGB(255, 120, 132, 201),
                                            
                                            
                                           
                                          ],
                                        ),
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
                                              padding:
                                                  const EdgeInsets.all(30.0),
                                              child: SingleChildScrollView(
                                                child: Center(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      // Text(
                                                      //     textEditingController
                                                      //         .text,
                                                      //     style:
                                                      //         const TextStyle(
                                                      //             fontWeight:
                                                      //                 FontWeight
                                                      //                     .bold,
                                                      //             color: Colors
                                                      //                 .black)),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                          textEditingController
                                                                      .text
                                                                      .isEmpty &&
                                                                  _lastWords ==
                                                                      null
                                                              ? "Type Or Talk"
                                                              : "",
                                                          style:
                                                              const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black,
                                                          )),
                                                      Text(_lastWords ?? "",
                                                          style:
                                                              const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black,
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.90,
                                            // height:
                                            //     MediaQuery.of(context).size.height * 0.18,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(100),
                                                  topLeft:
                                                      Radius.circular(100)),
                                              gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            
                                            
                                            
                                            Color.fromARGB(255, 19, 36, 92),
                                            Color.fromARGB(255, 120, 132, 201),
                                            Color.fromARGB(255, 120, 132, 201),
                                            Color.fromARGB(255, 120, 132, 201),
                                            Color.fromARGB(255, 19, 36, 92),
                                            
                                           
                                          ],
                                        ),
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
                                              padding:
                                                  const EdgeInsets.all(30.0),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    // Text(
                                                    //   output == null
                                                    //       ? ""
                                                    //       : output.toString(),
                                                    //   style: const TextStyle(
                                                    //     // fontSize: 20,
                                                    //     fontStyle:
                                                    //         FontStyle.italic,
                                                    //     fontWeight:
                                                    //         FontWeight.bold,
                                                    //     color: Colors.black,
                                                    //   ),
                                                    // ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    if (voice_speech == null &&
                                                        output == null) ...{
                                                      const Text(
                                                        "Select Language",
                                                        style: TextStyle(
                                                          // fontSize: 20,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    },
                                                    Text(
                                                      voice_speech == null
                                                          ? ""
                                                          : voice_speech
                                                              .toString(),
                                                      style: const TextStyle(
                                                        // fontSize: 20,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(50.0),
                                          child: AnimatedButton(
                                              child: const Text(
                                                  "Translate"), // Child widget, Row, Text, Column,...etc.
                                              onPressed: () {
                                                setState(() {
                                                  trans();
                                                  transvoice();
                                                });
                                              },
                                              duration: 10,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.35,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.06,
                                              // enabled: true,
                                              shape: BoxShape.rectangle,
                                              shadowDegree: ShadowDegree.dark,
                                              color: const Color.fromARGB(
                                                  255, 120, 132, 201)),
                                        ),
                                      ],
                                    )),
                              ), //textfield
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.30,
                              )
                            ],
                          ),
                        )),
                  ),
                );
              case 'about':
                return const About();

              default:
                return Scaffold(
                  body: SingleChildScrollView(
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/bg1.gif"),
                                fit: BoxFit.cover)),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, left: 5, right: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.40,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(100),
                                            topRight: Radius.circular(100)),
                                        gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                      Color.fromARGB(255, 120, 132, 201),
                                      Color.fromARGB(255, 120, 132, 201),
                                      Color.fromARGB(255, 19, 36, 92),
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
                                      child: const Center(
                                          child: const Text(
                                        "English",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const MyApp()));
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.15,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.06,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(160),
                                              topRight: Radius.circular(160)),
                                          gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                      Color.fromARGB(255, 120, 132, 201),
                                      Color.fromARGB(255, 19, 36,92),
                                      Color.fromARGB(255, 120, 132, 201),
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
                                        child: const Icon(Icons.multiple_stop,
                                            color: Color.fromARGB(
                                                255, 154, 164, 219)),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.40,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(100),
                                            topRight: Radius.circular(100)),
                                        gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                      Color.fromARGB(255, 19, 36, 92),
                                      Color.fromARGB(255, 120, 132, 201),
                                      Color.fromARGB(255, 120, 132, 201),
                                      
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
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: DropdownButton<String>(
                                          value: dropdownValue,
                                          icon: const Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.black),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          underline: Container(
                                            height: 2,
                                            color: const Color.fromARGB(
                                                255, 0, 0, 0),
                                          ),
                                          onChanged: (var newValue) {
                                            setState(() {
                                              dropdownValue = newValue;
                                              trans();
                                              transvoice();
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
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // row language
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 20,
                                ),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.95,
                                  height:
                                      MediaQuery.of(context).size.height * 0.22,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(100),
                                        topRight: Radius.circular(100)),
                                    gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                      Color.fromARGB(255, 120, 132, 201),
                                      
                                      Color.fromARGB(255, 19, 36, 92),
                                      Color.fromARGB(255, 120, 132, 201),
                                      
                                      
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
                                      width: MediaQuery.of(context).size.width *
                                          0.95,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.20,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(100),
                                            topRight: Radius.circular(100)),
                                        gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                      Color.fromARGB(255, 19, 36, 92),
                                      Color.fromARGB(255, 120, 132, 201),
                                      Color.fromARGB(255, 120, 132, 201),
                                      Color.fromARGB(255, 19, 36, 92),
                                      
                                      
                                        ],
                                         ),
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
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 20, right: 20),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              TextFormField(
                                                controller:
                                                    textEditingController,
                                                onTap: () {
                                                  setState(() {
                                                    trans();
                                                    transvoice();
                                                  });
                                                },
                                                // expands: true,
                                                cursorColor: Colors.black,

                                                decoration: const InputDecoration(
                                                  
                                                    hintText: 
                                                        "Type for Translation",
                                                  hintStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    border: OutlineInputBorder(
                                                        borderSide:
                                                            BorderSide.none)),

                                                smartDashesType:
                                                    SmartDashesType.enabled,
                                                textDirection:
                                                    TextDirection.ltr,
                                                focusNode: FocusNode(
                                                  canRequestFocus: true,
                                                  descendantsAreFocusable: true,
                                                  skipTraversal: true,
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: AnimatedButton(
                                                    child: const Text(
                                                        "Translate"), // Child widget, Row, Text, Column,...etc.
                                                    onPressed: () {
                                                      setState(() {
                                                        trans();
                                                        transvoice();
                                                      });
                                                    },
                                                    duration: 10,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.25,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.04,
                                                    // enabled: true,
                                                    shape: BoxShape.rectangle,
                                                    shadowDegree:
                                                        ShadowDegree.dark,
                                                    color: const Color.fromARGB(
                                                        255, 120, 132, 201)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              Padding(
                                //textfield
                                padding: const EdgeInsets.only(
                                  top: 20,
                                ),
                                child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.95,
                                    // height: MediaQuery.of(context).size.height * 0.42,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(100),
                                          topLeft: Radius.circular(100)),
                                     gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                      // Color.fromARGB(255, 120, 132, 201),
                                      
                                      Color.fromARGB(255, 19, 36, 92),
                                      Color.fromARGB(255, 120, 132, 201),
                                      Color.fromARGB(255, 19, 36, 92),
                                      
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
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.90,
                                            // height:
                                            //     MediaQuery.of(context).size.height * 0.18,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(100),
                                                  topLeft:
                                                      Radius.circular(100)),
                                              gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                      // Color.fromARGB(255, 120, 132, 201),
                                      
                                      
                                      Color.fromARGB(255, 120, 132, 201),
                                      Color.fromARGB(255, 19, 36, 92),]),
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
                                              padding:
                                                  const EdgeInsets.all(30.0),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                        textEditingController
                                                            .text,
                                                        style:
                                                            const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black)),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Text(
                                                        textEditingController
                                                                    .text
                                                                    .isEmpty &&
                                                                _lastWords ==
                                                                    null
                                                            ? "Type Or Talk"
                                                            : "",
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black,
                                                        )),
                                                    Text(_lastWords ?? "",
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black,
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.90,
                                            // height:
                                            //     MediaQuery.of(context).size.height * 0.18,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(100),
                                                  topLeft:
                                                      Radius.circular(100)),
                                              gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                      // Color.fromARGB(255, 120, 132, 201),
                                      
                                      
                                      
                                      Color.fromARGB(255, 19, 36, 92),
                                      Color.fromARGB(255, 120, 132, 201),
                                      ]),
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
                                              padding:
                                                  const EdgeInsets.all(30.0),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      output == null
                                                          ? ""
                                                          : output.toString(),
                                                      style: const TextStyle(
                                                        // fontSize: 20,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    if (voice_speech == null &&
                                                        output == null) ...{
                                                      const Text(
                                                        "Select Language",
                                                        style: TextStyle(
                                                          // fontSize: 20,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    },
                                                    Text(
                                                      voice_speech == null
                                                          ? ""
                                                          : voice_speech
                                                              .toString(),
                                                      style: const TextStyle(
                                                        // fontSize: 20,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                              ), //textfield
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.30,
                              )
                            ],
                          ),
                        )),
                  ),
                );
            }
          },
        ),
      ),
    );
  }

  showd() {
    showDialog(
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.60,
            decoration: const BoxDecoration(color: Colors.transparent),
            child: AlertDialog(
              backgroundColor: const Color(0xff7884c8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(29)),
              title: Center(
                child: Container(
                    height: 40,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 19, 36, 92),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    child: const Center(
                        child: Text("Google Translate",
                            style: TextStyle(
                              decorationColor: Colors.red,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )))),
              ),
              content: SizedBox(
                height: MediaQuery.of(context).size.height * 0.20,
                // width: MediaQuery.of(context).size.width *0.20,

                child: Stack(
                  children: [
                    Center(
                      child: AvatarGlow(
                        animate: _speechEnabled,
                        glowColor: Colors.blueAccent,
                        endRadius: 80,
                        duration: const Duration(milliseconds: 2000),
                        repeatPauseDuration: const Duration(milliseconds: 200),
                        repeat: true,
                        child: TextButton(
                          // iconSize: 50,
                          // splashColor: Colors.green,
                          // highlightColor: Colors.purple,
                          // color: Colors.lightBlue,
                          onPressed: _speechToText.isAvailable
                              ? _startListening
                              : _stopListening,
                          // tooltip: 'Listen',
                          child: Image.asset("assets/micd1.gif"),

                          // Icon(
                          //     _speechToText.isNotListening
                          //         ? Icons.mic
                          //         : Icons.mic,
                          //     size: 30,
                          //     color: Colors.white)
                        ),
                      ),
                    ),
                    Center(
                        child: InkWell(
                            // iconSize: 50,
                            // splashRadius: 100,
                            onTap: _speechToText.isAvailable
                                ? _startListening
                                : _stopListening,
                            child: const Text("Click and Talk",
                                style: TextStyle(
                                  color: Colors.black,
                                ))))
                    //       TextButton(
                    //   onPressed: () async {
                    //     setState(() {
                    //        _voiceWaveType = VoiceWaveType.finished;
                    //     });
                    //   },
                    //   child: Text('Finish'),
                    // ),
                    // Container(
                    //   width: 263,
                    //   height: 60,
                    //   // color: Colors.red,
                    //   child: VoiceWaveWidget(type: _voiceWaveType),
                    // ),
                  ],
                ),
              ),
              actions: [
                Center(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: AnimatedButton(
                          child: const Text("Cancel",
                              style: TextStyle(
                                  color: Colors
                                      .white)), // Child widget, Row, Text, Column,...etc.
                          onPressed: () {
                            setState(() {
                              Navigator.pop(context);

                              trans();
                              transvoice();
                            });
                          },
                          duration: 10,
                          width: MediaQuery.of(context).size.width * 0.30,
                          height: MediaQuery.of(context).size.height * 0.06,
                          // enabled: true,
                          shape: BoxShape.rectangle,
                          shadowDegree: ShadowDegree.dark,

                          color: Color.fromARGB(255, 19, 36, 92),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: AnimatedButton(
                          child: const Text(
                            "Translate",
                            style: TextStyle(color: Colors.white),
                          ), // Child widget, Row, Text, Column,...etc.
                          onPressed: () {
                            setState(() {
                              Navigator.pop(context);
                              trans();
                              transvoice();
                            });
                          },
                          duration: 10,
                          width: MediaQuery.of(context).size.width * 0.30,
                          height: MediaQuery.of(context).size.height * 0.06,
                          // enabled: true,
                          shape: BoxShape.rectangle,
                          shadowDegree: ShadowDegree.dark,

                          color: Color.fromARGB(255, 19, 36, 92),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}

// Container name() {
//   return Container();
// }
                            // Padding(
                            //   padding: const EdgeInsets.only(
                            //     top: 20,
                            //   ),
                            //   child: Container(
                            //     width: MediaQuery.of(context).size.width * 0.90,
                            //     height: MediaQuery.of(context).size.height * 0.22,
                            //     decoration: const BoxDecoration(
                            //       borderRadius: BorderRadius.only(
                            //           bottomRight: Radius.circular(100),
                            //           topLeft: Radius.circular(100)),
                            //       color: Colors.transparent,
                            //       boxShadow: [
                            //         BoxShadow(color:
                            //           Color.fromARGB(255, 120, 132, 201),
                            //           spreadRadius: 3,
                            //           blurRadius: 1,
                            //           offset: Offset(0, 2),
                            //         ),
                            //       ],
                            //     ),
                            //     child: Padding(
                            //       padding: const EdgeInsets.all(20.0),
                            //       child: Container(
                            //         width:
                            //             MediaQuery.of(context).size.width * 0.90,
                            //         height:
                            //             MediaQuery.of(context).size.height * 0.20,
                            //         decoration: const BoxDecoration(
                            //           borderRadius: BorderRadius.only(
                            //               bottomLeft:Radius.circular(100),
                            //               topRight: Radius.circular(100)),
                            //           color: Colors.transparent,
                            //           boxShadow: [
                            //             BoxShadow(
                            //               color:
                            //                   Color.fromARGB(255, 120, 132, 201),
                            //               spreadRadius: 3,
                            //               blurRadius: 1,
                            //               offset: Offset(0, 2),
                            //             ),
                            //           ],
                            //         ),
                            //         child: Padding(
                            //           padding: const EdgeInsets.all(20.0),
                            //           child: SingleChildScrollView(
                            //             child: TextFormField(
                            //               // expands: true,
                            //               cursorColor: Colors.black,

                            //               decoration: InputDecoration(
                            //                   label: Text("Type for Translation"),
                            //                   labelStyle: TextStyle(
                            //                       color: Colors.black,
                            //                       fontWeight: FontWeight.bold),
                            //                   border: OutlineInputBorder(
                            //                       borderSide: BorderSide.none)),

                            //               smartDashesType:
                            //                   SmartDashesType.enabled,
                            //               textDirection: TextDirection.ltr,
                            //               focusNode: FocusNode(
                            //                 canRequestFocus: true,
                            //                 descendantsAreFocusable: true,
                            //                 skipTraversal: true,
                            //               ),
                            //             ),
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.all(20.0),
                            //   child: Container(
                            //     width: MediaQuery.of(context).size.width * 0.90,
                            //     height: MediaQuery.of(context).size.height * 0.20,
                            //     decoration: const BoxDecoration(
                            //       borderRadius: BorderRadius.only(
                            //           bottomLeft: Radius.circular(100),
                            //           topRight: Radius.circular(100)),
                            //       color: Colors.transparent,
                            //       boxShadow: [
                            //         BoxShadow(
                            //           color: Color.fromARGB(184, 120, 132, 201),
                            //           spreadRadius: 3,
                            //           blurRadius: 1,
                            //           offset: Offset(0, 2),
                            //         ),
                            //       ],
                            //     ),
                            //     child: Padding(
                            //       padding: const EdgeInsets.all(20.0),
                            //       child: SingleChildScrollView(
                            //         child: TextFormField(
                            //           // expands: true,
                            //           cursorColor: Colors.black,

                            //           decoration: InputDecoration(
                            //               label: Text("Type for Translation"),
                            //               labelStyle: TextStyle(
                            //                   color: Colors.black,
                            //                   fontWeight: FontWeight.bold),
                            //               border: OutlineInputBorder(
                            //                   borderSide: BorderSide.none)),

                            //           smartDashesType: SmartDashesType.enabled,
                            //           textDirection: TextDirection.ltr,
                            //           focusNode: FocusNode(
                            //             canRequestFocus: true,
                            //             descendantsAreFocusable: true,
                            //             skipTraversal: true,
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),

                            // Text("name"),
  
                // Container(
                //   decoration: const BoxDecoration(
                //       image: DecorationImage(
                //     image: AssetImage("assets/bg.gif"),
                //     fit: BoxFit.fitHeight,
                //   )),
                //   child: ColorfulSafeArea(
                //       color: Colors.transparent,
                //       child: SingleChildScrollView(
                //         child: Container(
                //           width: MediaQuery.of(context).size.width,
                //           height: MediaQuery.of(context).size.height,
                //           // decoration: const BoxDecoration(
                //           //     // image: DecorationImage(
                //           //     //     image: AssetImage("assets/bg.gif"), fit: BoxFit.cover
                //           //         // )
                //           //         ),
                //           child: Column(children: [
                //             SizedBox(
                //               height:
                //                   MediaQuery.of(context).size.height * 0.226000,
                //               child: Stack(
                //                 children: [
                //                   Align(
                //                     alignment: Alignment.topCenter,
                //                     child: Padding(
                //                       padding: const EdgeInsets.only(
                //                           top: 20, right: 10, left: 10),
                //                       child: Row(
                //                         mainAxisAlignment:
                //                             MainAxisAlignment.center,
                //                         children: [
                //                           Container(
                //                             width: MediaQuery.of(context)
                //                                     .size
                //                                     .width *
                //                                 0.47,
                //                             height: MediaQuery.of(context)
                //                                     .size
                //                                     .height *
                //                                 0.10,
                //                             decoration: BoxDecoration(
                //                               boxShadow: [
                //                                 BoxShadow(
                //                                   color: Colors.black12,
                //                                   spreadRadius: 3,
                //                                   blurRadius: 1,
                //                                   // blurStyle: BlurStyle.outer,
                //                                   offset: Offset(0, 2),
                //                                 ),
                //                               ],
                //                               color: const Color.fromARGB(
                //                                   255, 19, 36, 92),

                //                               // boxShadow: BoxShadow()
                //                             ),
                //                             child: Padding(
                //                               padding: const EdgeInsets.only(
                //                                   top: 8, left: 8),
                //                               child: Container(
                //                                 decoration: const BoxDecoration(
                //                                   borderRadius:
                //                                       BorderRadius.only(
                //                                     topLeft:
                //                                         Radius.circular(40),
                //                                     // topRight: Radius.circular(40),
                //                                     // bottomLeft: Radius.circular(40),
                //                                     bottomRight:
                //                                         Radius.circular(50),
                //                                   ),
                //                                   color: Color(0xff7884c9),
                //                                 ),
                //                                 child: const Center(
                //                                     child: Text(
                //                                   "Your Language",
                //                                   style: TextStyle(
                //                                     fontWeight: FontWeight.bold,
                //                                     fontSize: 20,
                //                                     color: Color.fromARGB(
                //                                         255, 250, 251, 252),
                //                                   ),
                //                                 )),
                //                               ),
                //                             ),
                //                           ),
                //                           Container(
                //                             width: MediaQuery.of(context)
                //                                     .size
                //                                     .width *
                //                                 0.47,
                //                             height: MediaQuery.of(context)
                //                                     .size
                //                                     .height *
                //                                 0.10,
                //                             decoration: BoxDecoration(
                //                               boxShadow: [
                //                                 BoxShadow(
                //                                   color: Colors.black12,
                //                                   spreadRadius: 3,
                //                                   blurRadius: 1,
                //                                   offset: Offset(0, 2),
                //                                 ),
                //                               ],
                //                               color: const Color.fromARGB(
                //                                   255, 19, 36, 92),

                //                               // boxShadow: BoxShadow()
                //                             ),
                //                             child: Padding(
                //                               padding: const EdgeInsets.only(
                //                                   top: 8, right: 8),
                //                               child: Container(
                //                                 decoration: const BoxDecoration(
                //                                   borderRadius:
                //                                       BorderRadius.only(
                //                                     // topLeft: Radius.circular(40),
                //                                     topRight:
                //                                         Radius.circular(40),
                //                                     bottomLeft:
                //                                         Radius.circular(50),
                //                                     // bottomRight: Radius.circular(40),
                //                                   ),
                //                                   color: Color(0xff7884c9),
                //                                 ),
                //                                 child: const Center(
                //                                     child: Text(
                //                                   "Select Language",
                //                                   style: TextStyle(
                //                                     fontWeight: FontWeight.bold,
                //                                     fontSize: 18,
                //                                     color: Color.fromARGB(
                //                                         255, 250, 251, 252),
                //                                   ),
                //                                 )),
                //                               ),
                //                             ),
                //                           ),
                //                         ],
                //                       ),
                //                     ),
                //                   ),
                //                   SizedBox(height: 10),
                //                   Align(
                //                     alignment: Alignment.bottomCenter,
                //                     child: Padding(
                //                       padding: const EdgeInsets.only(
                //                           top: 50, right: 10, left: 10),
                //                       child: Row(
                //                         mainAxisAlignment:
                //                             MainAxisAlignment.center,
                //                         children: [
                //                           Container(
                //                             width: MediaQuery.of(context)
                //                                     .size
                //                                     .width *
                //                                 0.47,
                //                             height: MediaQuery.of(context)
                //                                     .size
                //                                     .height *
                //                                 0.10,
                //                             decoration: BoxDecoration(
                //                               boxShadow: [
                //                                 BoxShadow(
                //                                   color: Colors.black12,
                //                                   spreadRadius: 3,
                //                                   blurRadius: 3,
                //                                   offset: Offset(0, 2),
                //                                 ),
                //                               ],
                //                               color: const Color.fromARGB(
                //                                   255, 19, 36, 92),

                //                               // boxShadow: BoxShadow()
                //                             ),
                //                             child: Padding(
                //                               padding: const EdgeInsets.only(
                //                                   bottom: 8, left: 8),
                //                               child: Container(
                //                                 decoration: const BoxDecoration(
                //                                   borderRadius:
                //                                       BorderRadius.only(
                //                                     // topLeft: Radius.circular(40),
                //                                     topRight:
                //                                         Radius.circular(50),
                //                                     bottomLeft:
                //                                         Radius.circular(40),
                //                                     // bottomRight: Radius.circular(40),
                //                                   ),
                //                                   color: Color(0xff7884c9),
                //                                 ),
                //                                 child: const Center(
                //                                     child: Text(
                //                                   "Auto Detect",
                //                                   style: TextStyle(
                //                                     fontWeight: FontWeight.bold,
                //                                     fontSize: 18,
                //                                     color: Color.fromARGB(
                //                                         255, 0, 0, 0),
                //                                   ),
                //                                 )),
                //                               ),
                //                             ),
                //                           ),
                //                           Container(
                //                             width: MediaQuery.of(context)
                //                                     .size
                //                                     .width *
                //                                 0.47,
                //                             height: MediaQuery.of(context)
                //                                     .size
                //                                     .height *
                //                                 0.10,
                //                             decoration: BoxDecoration(
                //                               boxShadow: [
                //                                 BoxShadow(
                //                                   color: Colors.black12,
                //                                   spreadRadius: 3,
                //                                   blurRadius: 3,
                //                                   offset: Offset(0, 2),
                //                                 ),
                //                               ],
                //                               color: const Color.fromARGB(
                //                                   255, 19, 36, 92),

                //                               // boxShadow: BoxShadow()
                //                             ),
                //                             child: Padding(
                //                               padding: const EdgeInsets.only(
                //                                   bottom: 8, right: 8),
                //                               child: Container(
                //                                 decoration: const BoxDecoration(
                //                                   borderRadius:
                //                                       BorderRadius.only(
                //                                     topLeft:
                //                                         Radius.circular(50),
                //                                     bottomRight:
                //                                         Radius.circular(40),
                //                                   ),
                //                                   color: Color(0xff7884c9),
                //                                 ),
                //                                 child: Center(
                //                                     child: SizedBox(
                //                                   width: MediaQuery.of(context)
                //                                           .size
                //                                           .width *
                //                                       0.37,
                //                                   child: Column(
                //                                       mainAxisAlignment:
                //                                           MainAxisAlignment
                //                                               .center,
                //                                       children: [
                //                                         Align(
                //                                           alignment: Alignment
                //                                               .centerLeft,
                //                                           child: DropdownButton<
                //                                               String>(
                //                                             value:
                //                                                 dropdownValue,
                //                                             icon: Container(
                //                                               width: 50,
                //                                               child: Image.asset(
                //                                                   "assets/select.gif"),
                //                                             ),
                //                                             iconSize: 24,
                //                                             elevation: 16,
                //                                             style:
                //                                                 const TextStyle(
                //                                               color: const Color
                //                                                       .fromARGB(
                //                                                   255, 0, 0, 0),
                //                                             ),
                //                                             underline:
                //                                                 Container(
                //                                               height: 1,
                //                                               color: const Color
                //                                                       .fromARGB(
                //                                                   255, 0, 0, 0),
                //                                             ),
                //                                             onChanged:
                //                                                 (var newValue) {
                //                                               setState(() {
                //                                                 dropdownValue =
                //                                                     newValue;
                //                                                 trans();
                //                                               });
                //                                             },
                //                                             items: lang
                //                                                 .map((string,
                //                                                     value) {
                //                                                   return MapEntry(
                //                                                     string,
                //                                                     DropdownMenuItem<
                //                                                         String>(
                //                                                       value:
                //                                                           value,
                //                                                       child: Text(
                //                                                           string),
                //                                                     ),
                //                                                   );
                //                                                 })
                //                                                 .values
                //                                                 .toList(),
                //                                           ),
                //                                         )
                //                                       ]),
                //                                 )),
                //                               ),
                //                             ),
                //                           )
                //                         ],
                //                       ),
                //                     ),
                //                   ),
                //                   Padding(
                //                     padding: const EdgeInsets.only(top: 20.0),
                //                     child: Align(
                //                       alignment: Alignment.center,
                //                       child: InkWell(
                //                         // color: Colors.black,
                //                         onTap: () {
                //                           // showd;
                //                         },
                //                         child: CircleAvatar(
                //                           radius: 25,
                //                           backgroundImage: AssetImage(
                //                               "assets/restarttop.gif"),
                //                         ),
                //                       ),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),

                //             const SizedBox(
                //               height: 20,
                //             ),
                //             Padding(
                //               padding:
                //                   const EdgeInsets.only(left: 10, right: 10),
                //               child: Container(
                //                 height:
                //                     MediaQuery.of(context).size.height * 0.12,
                //                 decoration: BoxDecoration(
                //                   boxShadow: [
                //                     BoxShadow(
                //                       color: Colors.black12,
                //                       spreadRadius: 3,
                //                       blurRadius: 3,
                //                       offset: Offset(0, 2),
                //                     ),
                //                   ],
                //                   color: const Color.fromARGB(255, 19, 36, 92),
                //                 ),
                //                 child: Center(
                //                   child: Padding(
                //                     padding: const EdgeInsets.all(5.0),
                //                     child: Container(
                //                       height:
                //                           MediaQuery.of(context).size.height *
                //                               0.11,
                //                       decoration: BoxDecoration(
                //                         borderRadius: BorderRadius.circular(50),
                //                         color: const Color.fromARGB(
                //                             255, 175, 213, 243),
                //                       ),
                //                       child: Padding(
                //                         padding: const EdgeInsets.all(7.0),
                //                         child: TextField(
                //                           style: const TextStyle(
                //                               fontSize: 20,
                //                               color: Colors.black),
                //                           controller: textEditingController,
                //                           onTap: () {
                //                             setState(() {
                //                               trans();
                //                             });
                //                           },
                //                           decoration: InputDecoration(
                //                             border: OutlineInputBorder(
                //                                 borderRadius:
                //                                     BorderRadius.circular(59)),
                //                             labelText: 'Type Here',
                //                             labelStyle: const TextStyle(
                //                                 fontSize: 18,
                //                                 color: Color.fromARGB(
                //                                     255, 0, 0, 0),
                //                                 fontWeight: FontWeight.bold),
                //                             suffix: InkWell(
                //                                 onTap: () {
                //                                   setState(() {
                //                                     textEditingController
                //                                                 .text ==
                //                                             null
                //                                         ? _lastWords
                //                                         : Text("$_lastWords");
                //                                     trans();
                //                                     transvoice();
                //                                   });
                //                                 },
                //                                 child: const Icon(
                //                                   Icons.send,
                //                                   color: Color.fromARGB(
                //                                       255, 0, 0, 0),
                //                                 )),
                //                             suffixIcon: Padding(
                //                               padding: const EdgeInsets.only(
                //                                   right: 3),
                //                               child: InkWell(
                //                                 // onTap: showd,
                //                                 child: CircleAvatar(
                //                                   radius: 30,
                //                                   backgroundImage: AssetImage(
                //                                       "assets/mictype.gif"),
                //                                 ),
                //                                 // AvatarGlow(
                //                                 //     animate: _speechEnabled,
                //                                 //     glowColor: Colors.blueAccent,
                //                                 //     endRadius: 30,
                //                                 //     duration:
                //                                 //         const Duration(milliseconds: 2000),
                //                                 //     repeatPauseDuration:
                //                                 //         const Duration(milliseconds: 200),
                //                                 //     repeat: true,
                //                                 //     child: const Icon(
                //                                 //       Icons.mic_off,
                //                                 //       color: Color.fromARGB(255, 0, 0, 0),
                //                                 //     )),
                //                               ),
                //                             ),
                //                           ),
                //                         ),
                //                       ),
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //             ),

                //             SizedBox(
                //               width: MediaQuery.of(context).size.width * 0.95,
                //               child: Stack(
                //                 children: [
                //                   Align(
                //                     alignment: Alignment.topLeft,
                //                     child: Padding(
                //                       padding: const EdgeInsets.only(
                //                           top: 20, left: 10, right: 10),
                //                       child: Align(
                //                         alignment: Alignment.centerLeft,
                //                         child: Container(
                //                           width: MediaQuery.of(context)
                //                                   .size
                //                                   .width *
                //                               0.4,
                //                           decoration: BoxDecoration(
                //                               boxShadow: [
                //                                 BoxShadow(
                //                                   color: Colors.black12,
                //                                   spreadRadius: 3,
                //                                   blurRadius: 3,
                //                                   offset: Offset(0, 2),
                //                                 ),
                //                               ],
                //                               color: const Color.fromARGB(
                //                                   255, 175, 213, 243)),
                //                           child: Center(
                //                               child: Column(
                //                             children: [
                //                               Padding(
                //                                 padding: const EdgeInsets.only(
                //                                     right: 2, left: 2, top: 2),
                //                                 child: Container(
                //                                   height: MediaQuery.of(context)
                //                                           .size
                //                                           .height *
                //                                       0.05,
                //                                   color: const Color.fromARGB(
                //                                       255, 93, 153, 202),
                //                                   child: Padding(
                //                                     padding:
                //                                         const EdgeInsets.all(
                //                                             3.0),
                //                                     child: Container(
                //                                         width: MediaQuery.of(
                //                                                     context)
                //                                                 .size
                //                                                 .width *
                //                                             0.43,
                //                                         decoration:
                //                                             BoxDecoration(
                //                                           borderRadius:
                //                                               BorderRadius
                //                                                   .circular(60),
                //                                           color: const Color
                //                                                   .fromARGB(255,
                //                                               175, 213, 243),
                //                                         ),
                //                                         child: const Center(
                //                                             child: Text(
                //                                                 "Your Text Or Voice",
                //                                                 style:
                //                                                     TextStyle(
                //                                                   fontWeight:
                //                                                       FontWeight
                //                                                           .bold,
                //                                                   fontSize: 15,
                //                                                   color: Color
                //                                                       .fromARGB(
                //                                                           255,
                //                                                           93,
                //                                                           153,
                //                                                           202),
                //                                                 )))),
                //                                   ),
                //                                 ),
                //                               ),
                //                               SingleChildScrollView(
                //                                 child: Column(
                //                                   children: [
                //                                     Text(
                //                                         textEditingController
                //                                             .text,
                //                                         style:
                //                                             const TextStyle(
                //                                                 fontWeight:
                //                                                     FontWeight
                //                                                         .bold,
                //                                                 color: Colors
                //                                                     .black)),
                //                                     const SizedBox(
                //                                       height: 5,
                //                                     ),
                //                                     Text(
                //                                         textEditingController
                //                                                     .text
                //                                                     .isEmpty &&
                //                                                 _lastWords ==
                //                                                     null
                //                                             ? "Type Or Talk"
                //                                             : "",
                //                                         style: const TextStyle(
                //                                           fontWeight:
                //                                               FontWeight.bold,
                //                                           color: Colors.black,
                //                                         )),
                //                                     Text(_lastWords ?? "",
                //                                         style: const TextStyle(
                //                                           fontWeight:
                //                                               FontWeight.bold,
                //                                           color: Colors.black,
                //                                         )),
                //                                   ],
                //                                 ),
                //                               ),
                //                             ],
                //                           )),
                //                         ),
                //                       ),
                //                     ),
                //                   ),
                //                   Align(
                //                     alignment: Alignment.topRight,
                //                     child: Padding(
                //                       padding: const EdgeInsets.only(
                //                           top: 20, left: 10, right: 10),
                //                       child: Align(
                //                         alignment: Alignment.centerRight,
                //                         child: Container(
                //                           width: MediaQuery.of(context)
                //                                   .size
                //                                   .width *
                //                               0.4,
                //                           decoration: BoxDecoration(
                //                               boxShadow: [
                //                                 BoxShadow(
                //                                   color: Colors.black12,
                //                                   spreadRadius: 3,
                //                                   blurRadius: 3,
                //                                   offset: Offset(0, 2),
                //                                 ),
                //                               ],
                //                               color: const Color.fromARGB(
                //                                   255, 93, 153, 202)),
                //                           child: Center(
                //                               child: Column(
                //                             children: [
                //                               Padding(
                //                                 padding:
                //                                     const EdgeInsets.all(2.0),
                //                                 child: Container(
                //                                   height: MediaQuery.of(context)
                //                                           .size
                //                                           .height *
                //                                       0.05,
                //                                   color: const Color.fromARGB(
                //                                       255, 175, 213, 243),
                //                                   child: Padding(
                //                                     padding:
                //                                         const EdgeInsets.all(
                //                                             3.0),
                //                                     child: Container(
                //                                         width: MediaQuery.of(
                //                                                     context)
                //                                                 .size
                //                                                 .width *
                //                                             0.43,
                //                                         decoration: BoxDecoration(
                //                                             borderRadius:
                //                                                 BorderRadius
                //                                                     .circular(
                //                                                         60),
                //                                             color: const Color
                //                                                     .fromARGB(
                //                                                 255,
                //                                                 93,
                //                                                 153,
                //                                                 202)),
                //                                         child: const Center(
                //                                             child: Text(
                //                                           "Translation",
                //                                           style: TextStyle(
                //                                             fontWeight:
                //                                                 FontWeight.bold,
                //                                             fontSize: 15,
                //                                             color:
                //                                                 Color.fromARGB(
                //                                                     255,
                //                                                     175,
                //                                                     213,
                //                                                     243),
                //                                           ),
                //                                         ))),
                //                                   ),
                //                                 ),
                //                               ),
                //                               SingleChildScrollView(
                //                                 child: Column(
                //                                   children: [
                //                                     Text(
                //                                       output == null
                //                                           ? ""
                //                                           : output.toString(),
                //                                       style: const TextStyle(
                //                                         // fontSize: 20,
                //                                         fontStyle:
                //                                             FontStyle.italic,
                //                                         fontWeight:
                //                                             FontWeight.w500,
                //                                         color: Colors.white,
                //                                       ),
                //                                     ),
                //                                     const SizedBox(
                //                                       height: 5,
                //                                     ),
                //                                     if (voice_speech == null &&
                //                                         output == null) ...{
                //                                       const Text(
                //                                         "Select Language",
                //                                         style: TextStyle(
                //                                           // fontSize: 20,
                //                                           fontStyle:
                //                                               FontStyle.italic,
                //                                           fontWeight:
                //                                               FontWeight.w500,
                //                                           color: Colors.white,
                //                                         ),
                //                                       ),
                //                                     },
                //                                     Text(
                //                                       voice_speech == null
                //                                           ? ""
                //                                           : voice_speech
                //                                               .toString(),
                //                                       style: const TextStyle(
                //                                         // fontSize: 20,
                //                                         fontStyle:
                //                                             FontStyle.italic,
                //                                         fontWeight:
                //                                             FontWeight.w500,
                //                                         color: Colors.white,
                //                                       ),
                //                                     ),
                //                                   ],
                //                                 ),
                //                               ),
                //                             ],
                //                           )),
                //                         ),
                //                       ),
                //                     ),
                //                   ),
                //                   Container(
                //                     decoration: BoxDecoration(
                //                       boxShadow: [
                //                         BoxShadow(
                //                           color: Colors.black12,
                //                           spreadRadius: 60,
                //                           blurRadius: 59,
                //                           offset: Offset(0, 2),
                //                         ),
                //                       ],
                //                     ),
                //                     child: SizedBox(
                //                       height:
                //                           MediaQuery.of(context).size.height *
                //                               0.20,
                //                       child: Align(
                //                           alignment: Alignment.bottomCenter,
                //                           child: InkWell(
                //                             onTap: () {
                //                               Navigator.push(
                //                                   context,
                //                                   MaterialPageRoute(
                //                                       builder: (context) =>
                //                                           const MyApp()));
                //                             },
                //                             child: CircleAvatar(
                //                               // backgroundColor: colors,
                //                               backgroundImage: AssetImage(
                //                                   "assets/restartbtom.gif"),
                //                               radius: 30,
                //                             ),
                //                           )),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),

                //             //
                //           ]),
                //         ),
                //       )),
                // ),
                // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
                // floatingActionButton: AvatarGlow(
                //   animate: _speechEnabled,
                //   glowColor: Colors.greenAccent,
                //   endRadius: 80,
                //   duration: const Duration(milliseconds: 2000),
                //   repeatPauseDuration: const Duration(milliseconds: 200),
                //   repeat: true,
                //   child: FloatingActionButton(
                //     onPressed:
                //         _speechToText.isNotListening ? _startListening : _stopListening,
                //     tooltip: 'Listen',
                //     child: Icon(_speechToText.isNotListening ? Icons.mic_off : Icons.mic),
                //   ),
                // ),
