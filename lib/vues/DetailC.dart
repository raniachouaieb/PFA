import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_test_app/model/consultation.dart';
import 'package:flutter_test_app/vues/AddConsultation.dart';
import 'package:flutter_test_app/vues/modif-patient.dart';

import 'ListeConsultation.dart';
import 'package:provider/provider.dart';

import 'ListP.dart';


class DetailConsultation extends StatefulWidget {
  final taille;
  final patientId;
  final tension;
  final poids;
  final typediabet ;
  final calories;
  final traitement;
  final antecedent;
  String colorGroupValue;

  DetailConsultation( this.patientId,this.taille, this.tension,this.poids, this.calories,this.typediabet,this.traitement, this.antecedent);
  @override
  _DetailConsultationState createState() => _DetailConsultationState();
}

class _DetailConsultationState extends State<DetailConsultation> {
  @override
  Widget build(BuildContext context) {
    var floatingActionButton;
    final consultation = Provider.of<List<Consultation>>(context);
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color:Colors.white,
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Detail Consultation',
          style: TextStyle(
            fontFamily: 'Arial',
            fontSize: 18.0,
            color:Colors.white,
          ),
        ),
        centerTitle: true,
        actions: <Widget> [

        ],
      ),

      body: ListView(
          children: [
            Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height - 82,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.transparent,
                  ),
                  Positioned(
                      top:75.0,
                      child:Container(
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(45.0),
                            topRight: Radius.circular(45.0),
                          ),
                          color: Colors.white,
                        ),
                        height:MediaQuery.of(context).size.height - 100,
                        width: MediaQuery.of(context).size.width  ,
                      )
                  ),

                  Positioned(
                    top:200,
                    left: 25,
                    right: 25,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                          Center(
                            child: Text(widget.taille,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),

                            ),
                          ),


                        ]
                    ),

                  ),
                  SizedBox(height: 20,),
                  Positioned(
                      top: 250,
                      left:15,
                      right: 10,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget> [
                          Container(
                              child: Icon(Icons.format_size)
                          ),

                          Text(' taille:',
                            style:TextStyle(
                              fontSize: 29,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          Container(
                            width: 0.05,
                          ),
                          Container(
                            width:260,
                            child: Text(widget.taille,
                                style:TextStyle(
                                  fontSize: 20,
                                )),
                          )
                        ],

                      )



                  ),
                  Positioned(
                      bottom: 350,
                      left:15,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget> [

                          Container(
                            child: Icon(Icons.control_point_rounded),
                          ),

                          Text(' Tension:',
                            style:TextStyle(
                              fontSize: 29,
                              fontStyle: FontStyle.italic,
                            ),
                          ),

                          Container(
                            width:260,
                            child: Text(widget.tension,
                                style:TextStyle(
                                  fontSize: 20,
                                )),
                          )
                        ],

                      )

                  ),
                  Positioned(
                      bottom: 300,
                      left:15,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget> [

                          Container(
                            child: Icon(Icons.add_location_rounded),
                          ),

                          Text(' Poids:',
                            style:TextStyle(
                              fontSize: 29,
                              fontStyle: FontStyle.italic,
                            ),
                          ),

                          Container(
                            width:260,
                            child: Text(widget.poids,
                                style:TextStyle(
                                  fontSize: 20,
                                )),
                          )
                        ],

                      )

                  ),
                  Positioned(
                      bottom: 250,
                      left:15,


                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget> [

                          Container(
                            child: Icon(Icons.card_giftcard_sharp),
                          ),

                          Text(' Glycemie:',
                            style:TextStyle(
                              fontSize: 29,
                              fontStyle: FontStyle.italic,
                            ),
                          ),

                          Container(
                            width:260,
                            child: Text(widget.typediabet,
                                style:TextStyle(
                                  fontSize: 20,
                                )),
                          )
                        ],

                      )

                  ),
                  Positioned(
                      bottom: 200,
                      left:15,


                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget> [

                          Container(
                            child: Icon(Icons.art_track_rounded),
                          ),

                          Text(' Calories:',
                            style:TextStyle(
                              fontSize: 29,
                              fontStyle: FontStyle.italic,
                            ),
                          ),

                          Container(
                            width:260,
                            child: Text(widget.calories,
                                style:TextStyle(
                                  fontSize: 20,
                                )),
                          )
                        ],

                      )

                  ),
                  Positioned(
                      bottom: 200,
                      left:15,


                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget> [

                          Container(
                            child: Icon(Icons.art_track_rounded),
                          ),

                          Text(' cardio-vas:',
                            style:TextStyle(
                              fontSize: 29,
                              fontStyle: FontStyle.italic,
                            ),
                          ),

                          Container(
                            width:260,
                            child: Text(widget.antecedent,
                                style:TextStyle(
                                  fontSize: 20,
                                )),
                          )
                        ],

                      )

                  ),

                  Positioned(
                      bottom: 100,
                      left:15,


                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget> [

                          Container(
                            child: Icon(Icons.view_agenda_outlined),
                          ),

                          Text(' traitement:',
                            style:TextStyle(
                              fontSize: 29,
                              fontStyle: FontStyle.italic,
                            ),
                          ),

                          Container(
                            width:260,
                            child: Text(widget.traitement,
                                style:TextStyle(
                                  fontSize: 20,
                                )),
                          )
                        ],

                      )

                  ),




                ]

            ),

          ]
      ),
    );
  }
}
