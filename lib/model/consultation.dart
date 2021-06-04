import 'package:flutter/material.dart';

class Consultation {
  final String consultationId;

  final String patientId;
  final String dateC;
  final String taille;
  final String tension;
  final String poids;
  final String calories;
  final String typediabet;
  final String traitement;
  final String antecedent;



  Consultation(
      {
        this.consultationId,
        this.patientId,
        @required this.dateC,
        @required this.taille,
        @required this.tension,
        @required this.poids,
        @required this.calories,
        @required this.typediabet,
        @required this.traitement,
        @required this.antecedent,

      });

  Map<String,dynamic> toMap(){
    return{
      'consultationId' : consultationId,
      'patientId': patientId,
      'dateC' : dateC,
      'taille': taille,
      'tension': tension,
      'poids': poids,
      'calories': calories,
      'typediabet': typediabet,
      'traitement': traitement,
      'antecedent': antecedent
    };
  }

  Consultation.fromFirestore(Map<String, dynamic> firestore)
      : consultationId = firestore['consultationId'],
        patientId = firestore['patientId'],
        dateC = firestore['dateC'],
        taille = firestore['taille'],
        tension = firestore['tension'],
        poids = firestore['poids'],
        calories = firestore['calories'],
        typediabet = firestore['typediabet'],
        traitement = firestore['traitement'],
        antecedent = firestore['antecedent'];

}
