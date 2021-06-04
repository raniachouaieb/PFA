import 'package:flutter/material.dart';
import 'package:flutter_test_app/validations/validation_item.dart';

class AddValidation with ChangeNotifier{
  ValidationItem _nom = ValidationItem(null, null);
  ValidationItem _prenom = ValidationItem(null, null);
  ValidationItem _email = ValidationItem(null, null);
  ValidationItem _cin = ValidationItem(null, null);
  ValidationItem _tel = ValidationItem(null, null);
  ValidationItem _adr = ValidationItem(null, null);
  ValidationItem _date = ValidationItem(null, null);

  //Getters
ValidationItem get nom => _nom;
  ValidationItem get prenom => _prenom;
  ValidationItem get email => _email;
  ValidationItem get cin => _cin;
  ValidationItem get tel => _tel;
  ValidationItem get adr => _adr;
  ValidationItem get date => _date;

  //Setters
void changeNom(String value){
  if(value.length >= 3){
    _nom = ValidationItem(value, null);
  } else{
    _nom = ValidationItem(null, "nom doit etre au moins 3 caracteres");
  }
  notifyListeners();
}

  void changePrenom(String value){
    if(value.isEmpty){
      _prenom = ValidationItem(null, "ce champs ne peut pas etre vide");
    } else if (value.length >= 3){
      _prenom = ValidationItem(value, null);
    } else{
      _prenom = ValidationItem(null, "prenom doit etre au moins 3 caracteres");
    }
    notifyListeners();
  }

  void changeEmail(String value){
    if(value.length >= 3){
      _email = ValidationItem(value, null);
    } else{
      _email = ValidationItem(null, "Veuiller respecter le format d email");
    }
    notifyListeners();
  }

  void changecin(String value){
    if(value.length == 8 ){
      _cin = ValidationItem(value, null);
    } else{
      _cin = ValidationItem(null, "le numero d 'identit\e doit etre 8 chiffres");
    }
    notifyListeners();
  }

  void changetel(String value){
    if(value.length == 8){
      _tel = ValidationItem(value, null);
    } else{
      _tel = ValidationItem(null, "le num\ero du telephone ne doit pas depasser le 8 chiffres");
    }
    notifyListeners();
  }

  void changeadr(String value){
    if(value.length >= 10){
      _adr = ValidationItem(value, null);
    } else{
      _adr = ValidationItem(null, "Veuillez  donner une adresse plus d\etaille");
    }
    notifyListeners();
  }


}