

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/pallette.dart';
import 'package:flutter_test_app/providers/patient_provider.dart';
import 'package:flutter_test_app/validations/add_validation.dart';

import 'package:flutter_test_app/vues/ListP.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
class AddPatient extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {

  DateTime _date = DateTime.now();

  Future<Null> _selecteDate (BuildContext context) async{
    DateTime _datePicker = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(1965),
        lastDate: DateTime(2030),
    );

    if(_datePicker != null && _datePicker != _date){
      setState(() {
        _date = _datePicker;
        print( _date.toString());
      });
    }
  }
  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();
  String genre;

  int selectedRadio;
  @override
  void initState(){
    super.initState();
    selectedRadio = 0;
  }
  setSelectedRadio(int value){
    setState((){
      selectedRadio = value;

    });
  }
  String nom="";
  String prenom="";
  String email="";
  String cin="";
  String tel="";
  String adr="";
  String date="";

  GlobalKey<FormState> formkey = GlobalKey<FormState>();


  validationForm(){



  }

  @override
  Widget build(BuildContext context) {
    DateTime dn;
    final validationService = Provider.of<AddValidation>(context);
    final patientProvider = Provider.of<PatientProvider>(context);
    Size size = MediaQuery.of(context).size;
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
          elevation: 10.0,
          title: Text('Ajouter Patient',
             style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 18.0,
               color:Colors.white,
              ),
              ),


        ),
        body: ListView(
                children: [
                  Stack(
                    children: <Widget> [

                      Container(
                        height: MediaQuery.of(context).size.height - 82,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.transparent,
                      ),
                      Positioned(
                          top:65.0,
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
                      imageProfile(),

                       Form(
                         key: formkey,
                         child: Padding(
                            padding: const EdgeInsets.only(top:130.0,left:17,right: 17),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  <Widget>[

                                      TextFormField(
                                        decoration: InputDecoration(
                                          hintText: "Saisir nom",
                                          labelText: 'Nom',
                                          errorText: validationService.nom.error,
                                          labelStyle: TextStyle(
                                            fontSize: 24,
                                            color:Colors.black,
                                          ),
                                          icon:Icon(Icons.person,
                                              color:Colors.black),
                                        ),
                                        validator: (val)=>val.length==0? "Veuiller remplir ce champ":null,
                                        onSaved: (val)=>nom=val,
                                        onChanged: (value){
                                          validationForm();
                                          validationService.changeNom(value);
                                          patientProvider.ChangeName(value);

                                        },

                                        keyboardType: TextInputType.name,
                                        //maxLength: 10,

                                      ),
                                      TextFormField(
                                         decoration: InputDecoration(
                                           hintText: "Saisir prenom",
                                           labelText: 'Prénom',
                                           errorText: validationService.prenom.error,
                                           labelStyle: TextStyle(
                                           fontSize: 24,
                                           color:Colors.black,
                                        ),
                                           icon:Icon(Icons.person,
                                               color:Colors.black),
                                        ),
                                        validator: (val)=>val.length==0? "Veuiller remplir ce champ":null,
                                        onSaved: (val)=>prenom=val,
                                          onChanged: (value){
                                            validationForm();
                                            validationService.changePrenom(value);
                                            patientProvider.ChangePrenom(value);
                                          },
                                        keyboardType: TextInputType.name,
                                        // maxLength: 10,
                                      ),

                                Column(
                                  children:[
                                    Row(
                                       children:[
                                         IconButton(
                                           icon:Icon(Icons.date_range),
                                           onPressed: (){
                                             setState(() {
                                               _selecteDate(context);
                                               print ( _date.toString(),);
                                             });

                                           },
                                         ),
                                       Text('Date Naissance',
                                         style:TextStyle(
                                           fontSize: 24,
                                           color:Colors.black,
                                         ),

                                       ),

                                       ]
                                  ),
                                    Text(_date.toString() ,
                                      style:TextStyle(
                                        fontSize: 19,
                                        color:Colors.black45,
                                      ),

                                    ),

                                  ]

                                ),

                                TextFormField(
                                         decoration: InputDecoration(
                                          hintText: "test@test.com",
                                          labelText: 'Email',
                                           errorText: validationService.email.error,
                                          labelStyle: TextStyle(
                                          fontSize: 24,
                                          color:Colors.black,
                                        ),
                                         icon:Icon(Icons.email_rounded,
                                             color:Colors.black),
                                          ),
                                  validator: (val)=>val.length==0? "Veuiller remplir ce champ":null,
                                  onSaved: (val)=>email=val,
                                           onChanged: (value){
                                             validationForm();
                                             validationService.changeEmail(value);
                                             patientProvider.ChangeEmail(value);
                                           },
                                       keyboardType: TextInputType.emailAddress,

                                      ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Saisir cin",
                                    labelText: 'Cin',
                                    errorText: validationService.cin.error,
                                    labelStyle: TextStyle(
                                      fontSize: 24,
                                      color:Colors.black,
                                    ),
                                    icon:Icon(Icons.art_track_rounded,
                                        color:Colors.black),
                                  ),
                                  validator: (val)=>val.length==0? "Veuiller remplir ce champ":null,
                                  onSaved: (val)=>cin=val,
                                  onChanged: (value){
                                    validationForm();
                                    validationService.changecin(value);
                                    patientProvider.ChangeCin(value);

                                  },
                                  keyboardType: TextInputType.number,
                                  maxLength: 8,
                                ),

                                TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Saisir numéro de telephone",
                                    labelText: 'Telephone',
                                    errorText:  validationService.tel.error,
                                    labelStyle: TextStyle(
                                      fontSize: 24,
                                      color:Colors.black,
                                    ),
                                    icon:Icon(Icons.call,
                                    color:Colors.black),
                                  ),
                                  validator: (val)=>val.length==0? "Veuiller remplir ce champ":null,
                                  onSaved: (val)=>tel=val,
                                  onChanged: (value){
                                    validationForm();
                                    validationService.changetel(value);
                                    patientProvider.ChangeTel(value);

                                  },
                                  keyboardType: TextInputType.number,
                                  maxLength: 8,

                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Saisir adresse",
                                    labelText: 'Adresse',
                                    errorText:  validationService.adr.error,
                                    labelStyle: TextStyle(
                                      fontSize: 24,
                                      color:Colors.black,
                                    ),
                                    icon:Icon(Icons.add_location_rounded,
                                        color:Colors.black),
                                  ),
                                  validator: (val)=>val.length==0? "Veuiller remplir ce champ":null,
                                  onSaved: (val)=>adr=val,
                                  onChanged: (value){
                                    validationForm();
                                    validationService.changeadr(value);
                                    patientProvider.ChangeAdresse(value);
                                  },
                                  keyboardType: TextInputType.streetAddress,
                                  //maxLength: 10,
                                ),
                                 Container(

                                      width: 350,

                                     child: Row(
                                           children: [

                                            Radio(value: 1,
                                                groupValue: selectedRadio,
                                                activeColor: Colors.red,
                                                onChanged: (value){
                                                  setSelectedRadio(value);

                                                  patientProvider.ChangeGenre(value);

                                                }

                                               ),

                                               Text(
                                         'Femme', style: TextStyle(fontSize: 24),
                                       ),
                                             Radio(value: 2,
                                               groupValue: selectedRadio,
                                               activeColor: Colors.blue,
                                               onChanged: (value){
                                                 setSelectedRadio(value);

                                                 patientProvider.ChangeGenre(value);
                                             }
                                             ),
                                               Text(
                                        'Homme', style: TextStyle(fontSize: 24),
                                        )
                                           ],
                                     ),

                                 ),
                                    ]
                                )


                            ),
                       ),

                    ]
                  ),
                ],
              ),
      floatingActionButton:FloatingActionButton(
        onPressed:() {
          if (formkey.currentState.validate()) {
            formkey.currentState.save();
            print('$nom');
            print('$prenom');
            print('$email');
            showDialog(context: context,
                builder: (context) {
                  return AlertDialog(
                      title: Text('Ajout aves succes'),
                      content: Text(
                          'nouveau patient sera ajout\e dans la base'),
                      actions: [
                        FlatButton(child: Text('Confirmer'),
                            onPressed: () {
                              patientProvider.savePatient();

                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => ListP()),);
                            }
                        ),
                      ]
                  );
                });
          } else {
            print('error...');
          }
        },





          


        child: Icon(Icons.done_outline),
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
      ),

    );

  }

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: <Widget> [
          CircleAvatar(
            radius: 80.0,
            backgroundImage: _imageFile == null
                ? AssetImage("assets/images/fem.png")
                : FileImage(File(_imageFile.path)),
          ),

          Positioned(
            bottom: 20.0,
            right:20.0,
            child: InkWell(
              onTap: (){
                showModalBottomSheet(context: context,
                    builder: ((builder) => botttomSheet()),
                );
              },
              child: Icon(Icons.camera_alt,
              color:Colors.teal,
              size: 30.0,),
            )
          )
        ],
      ),
    );


  }

  Widget botttomSheet(){
    return Container(
      height : 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text("Choisir photo du profil",
          style: TextStyle(
            fontSize: 20.0,
          ),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton.icon(
          icon: Icon(Icons.camera),
          onPressed: (){
            takePhoto(ImageSource.camera);
          },
                label:Text("Camera"),
              ),
              FlatButton.icon(
                icon: Icon(Icons.image),
                onPressed: (){
                  takePhoto(ImageSource.gallery);
                },
                label:Text("Gallerie"),
              ),

            ],
          )
        ],
      ),

    );
  }

  Future<void> takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
      );
    setState(() {
      _imageFile = pickedFile;
    });
}


}




