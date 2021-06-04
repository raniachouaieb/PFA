import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/model/consultation.dart';
import 'package:flutter_test_app/services/firestore_services.dart';
import 'package:flutter_test_app/vues/add-patient.dart';
import 'package:uuid/uuid.dart';

class ConsultationProvider with ChangeNotifier{
  final firestoreService = FirestoreService();
  String _consultationId;
  String _patientId;
  String _dateC;
  String _taille;
  String _tension;
  String _poids;
  String _calories;
  String _typediabeteVal;
  String _traitementVal;
  String _antecedentVal;


  var uuid = Uuid();




  //Getters
  String get consultationId => _consultationId;
  String get patientId => _patientId;
  String get dateC => _dateC;
  String get taille => _taille;
  String get tension => _tension;
  String get poids => _poids;
  String get calories => _calories;
  String get typediabete => _typediabeteVal;
  String get traitement => _traitementVal;
  String get antecedent => _antecedentVal;

  int _Type=0;
  int _TypeTr=0;
 int _TypeAn=0;




  //Setters
  ChangeDate(String value){
    _dateC=value;
    notifyListeners();
  }
  ChangeTaille(String value){
    _taille=value;
    notifyListeners();
  }
  ChangeTension(String value){
    _tension=value;
    notifyListeners();
  }
  ChangePoids(String value){
    _poids=value;
    notifyListeners();
  }
  ChangeCalories(String value){
    _calories=value;
    notifyListeners();
  }

  ChangeDiabete(int value){
    _Type=value;
    switch(_Type){
      case 1:
        _typediabeteVal='type1';
        break;
      case 2:
        _typediabeteVal='type2';
        break;
      case 3:
        _typediabeteVal='gestationnel';
        break;


    }

    notifyListeners();
  }
  ChangeTraitement(int value){
    _TypeTr=value;
    switch(_TypeTr){
      case 1:
        _traitementVal='ADO';
        break;
      case 2:
        _traitementVal='Insuline';
        break;


    }

    notifyListeners();
  }
  ChangeAntecedent(int value){
    _TypeAn=value;
    switch(_TypeAn){
      case 1:
        _antecedentVal='HTA';
        break;
      case 2:
        _antecedentVal='Dysilpidemie';
        break;
      case 3:
        _antecedentVal='Tabac';
        break;
      case 4:
        _antecedentVal='Cancer';
        break;


    }

    notifyListeners();
  }

  saveConsultation(){
    print("$taille, $tension, $poids,$typediabete,$traitement");
    var newConsultation = Consultation(taille: taille, tension: tension, poids: poids, calories: calories, typediabet: typediabete, traitement: traitement, antecedent: antecedent, dateC: dateC, consultationId: uuid.v4());
    firestoreService.saveConsultation(newConsultation);
  }


//updatePatient(){
//var updatedPatient = Patient(nom: nom, prenom: prenom, email: email, cin: cin, tel: tel, adr: adr, genre: genre, patientId: uuid.v4());
//firestoreService.savePatient(updatedPatient);
//}





}

