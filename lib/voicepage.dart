import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:translator/translator.dart';
import 'package:translator_app/main.dart';

class Voicepage extends StatefulWidget {
  const Voicepage({Key? key}) : super(key: key);

  @override
  State<Voicepage> createState() => _VoicepageState();
}

class _VoicepageState extends State<Voicepage> {
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
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(100),
                                          topRight: Radius.circular(100)),
                                      color: Color.fromARGB(255, 120, 132, 201),
                                      boxShadow: [
                                        BoxShadow(
                                          spreadRadius: 3,
                                          blurRadius: 1,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Center(
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
                                              builder: (context) => MyApp()));
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.15,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.06,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(160),
                                            topRight: Radius.circular(160)),
                                        color: Color.fromARGB(255, 19, 36, 92),
                                        boxShadow: [
                                          BoxShadow(
                                            spreadRadius: 3,
                                            blurRadius: 1,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Icon(Icons.multiple_stop,
                                          color: Color.fromARGB(
                                              255, 154, 164, 219)),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.40,
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(100),
                                          topRight: Radius.circular(100)),
                                      color: Color.fromARGB(255, 120, 132, 201),
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
                                        icon: Icon(Icons.arrow_drop_down,
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.95,
                                  // height: MediaQuery.of(context).size.height * 0.42,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(100),
                                        topLeft: Radius.circular(100)),
                                    color: Color.fromARGB(255, 19, 36, 92),
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
                                                topLeft: Radius.circular(100)),
                                            color: Color.fromARGB(
                                                255, 120, 132, 201),
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
                                            padding: const EdgeInsets.all(30.0),
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
                                                      textEditingController.text
                                                                  .isEmpty &&
                                                              _lastWords == null
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
                                                topLeft: Radius.circular(100)),
                                            color: Color.fromARGB(
                                                255, 120, 132, 201),
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
                                            padding: const EdgeInsets.all(30.0),
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
                              height: MediaQuery.of(context).size.height * 0.30,
                            )
                          ],
                        ),
                      )),
                ),
              );
  }
}
