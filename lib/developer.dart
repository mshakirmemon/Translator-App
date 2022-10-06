// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class Develp extends StatefulWidget {
  const Develp({ Key? key }) : super(key: key);

  @override
  State<Develp> createState() => _DevelpState();
}

class _DevelpState extends State<Develp> {
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
              child: 
              
              Column(
                children: [
                  SizedBox(height: 20,),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                   height: MediaQuery.of(context).size.height * 0.45,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(100),
                          topRight: Radius.circular(100)),
                      // color: Color.fromARGB(255, 19, 36, 92),
                      gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              
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
                    child:
                     Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        // width: MediaQuery.of(context).size.width * 0.90,
                        // height: MediaQuery.of(context).size.height * 0.30,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(100),
                              topRight: Radius.circular(100)),
                          // color: Color.fromARGB(255, 120, 132, 201),
                          gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
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
                          padding: const EdgeInsets.all(20.0),
                          child: 
                          
                          Padding(
                            padding: const EdgeInsets.only(top:20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              
                              children: [
                                Text(
                                    "Name:    Muhammad Shakir Memon",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
                                    
                                  
                        ),

                        Text(
                                    
                                    "Email:   mshakirmemon64@gmail.com",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20)
                                    
                                  
                        ),
                        Text(
                                    
                                    "Contact: +92 304-5737641 ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20)
                                  
                        ),
                              ],
                            ),
                          ),
                      ),
                    ),
                  ),
              )],
              ),
            )),
      ),
    );
  }
}
