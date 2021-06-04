import 'package:flutter/material.dart';

class Patient {
  final String patientId;
  final String nom;
  final String prenom;
  final String email;
  final String cin;
  final String tel;
  final String adr;
  final String genre;



  Patient(
  {
    this.patientId,
    @required this.nom,
    @required this.prenom,
    @required this.email,
    @required this.cin,
    @required this.tel,
    @required this.adr,
    @required this.genre,

});

  Map<String,dynamic> toMap(){
    return{
      'patientId' : patientId,
      'nom': nom,
      'prenom': prenom,
      'email': email,
      'cin': cin,
      'tel': tel,
      'adr': adr,
      'genre': genre
    };
  }

  Patient.fromFirestore(Map<String, dynamic> firestore)
      : patientId = firestore['patientId'],
        nom = firestore['nom'],
        prenom = firestore['prenom'],
        email = firestore['email'],
        cin = firestore['cin'],
        tel = firestore['tel'],
        adr = firestore['adr'],
        genre = firestore['genre'];

}
 