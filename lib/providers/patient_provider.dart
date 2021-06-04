import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/model/list.dart';
import 'package:flutter_test_app/services/firestore_services.dart';
import 'package:flutter_test_app/vues/add-patient.dart';
import 'package:uuid/uuid.dart';

class PatientProvider with ChangeNotifier{
  final firestoreService = FirestoreService();
  String _patientId;
  String _nom;
  String _prenom;
  String _email;
  String _tel;
  String _adr;
  String _cin;
  String _genderVal;
  

  var uuid = Uuid();




  //Getters
  String get patientId => _patientId;
  String get nom => _nom;
  String get prenom => _prenom;
  String get email => _email;
  String get tel => _tel;
  String get adr => _adr;
  String get cin => _cin;
  String get genre => _genderVal;

  int _myGenderType=0;




  //Setters
ChangeName(String value){
  _nom=value;
  notifyListeners();
}
  ChangePrenom(String value){
    _prenom=value;
    notifyListeners();
  }
  ChangeEmail(String value){
    _email=value;
    notifyListeners();
  }
  ChangeCin(String value){
    _cin=value;
    notifyListeners();
  }
  ChangeTel(String value){
    _tel=value.toString();
    notifyListeners();
  }
  ChangeAdresse(String value){
    _adr=value;
    notifyListeners();
  }
  ChangeGenre(int value){
    _myGenderType=value;
    switch(_myGenderType){
      case 1:
        _genderVal='femme';
        break;
      case 2:
        _genderVal='homme';
        break;


  }

    notifyListeners();
  }

  savePatient(){
  print("$nom, $prenom, $email");
  var newPatient = Patient(nom: nom, prenom: prenom, email: email, cin: cin, tel: tel, adr: adr, genre: genre, patientId: uuid.v4());
  firestoreService.savePatient(newPatient);
  }


  //updatePatient(){
    //var updatedPatient = Patient(nom: nom, prenom: prenom, email: email, cin: cin, tel: tel, adr: adr, genre: genre, patientId: uuid.v4());
    //firestoreService.savePatient(updatedPatient);
  //}





}

