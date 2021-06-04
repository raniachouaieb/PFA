import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/pallette.dart';
import 'package:flutter_test_app/vues/ListeConsultation.dart';
import 'package:flutter_test_app/widgets/background-image.dart';
import 'package:flutter_test_app/vues/ListP.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:flutter_test_app/providers/consultation_provider.dart';


import 'ListP.dart';
class AddConsultation extends StatefulWidget {


  @override
  State<StatefulWidget> createState() => _AddConsultationState();
}

class _AddConsultationState extends State<AddConsultation> {

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
  DateTime date ;
  String taille;
  String tension;
  String poids;
  String glycemie ;
  String calories;
  String image ;
  String resultat ;

  int selectedRadio;
  int selectedRadio1;
  int selectedRadio2;

  @override
  void initState(){
    super.initState();
    selectedRadio = 0;
    selectedRadio1 = 0;
    selectedRadio2 = 0;

  }
  setSelectedRadio(int value){
    setState((){
      selectedRadio = value;

    });
  }
  setSelectedRadio1(int value){
    setState((){
      selectedRadio1 = value;

    });
  }
  setSelectedRadio2(int value){
    setState((){
      selectedRadio2 = value;

    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /*_openCamera(BuildContext context) async{
    var picture = await ImagePicker.pickImage(source:ImageSource.camera);
    this.setState(() {
      imageFile=picture ;
    });
    Navigator.of(context).pop();
  }*/
  void validate(){
    if(_formKey.currentState.validate()){
      print("validated");
    }else {
      print("not validated");
    }
  }


  Widget _buildnamee() {
    return Text(
      'Dossier médical',
      textAlign: TextAlign.left,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
    );
  }

  Widget _builddate() {

    return TextFormField(

      decoration: const InputDecoration(labelText: 'Date',contentPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 15)),
      maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Date is Required';
        }

        return null;
      },
      onSaved: (String value) {
        date = value as DateTime;
      },
    );
  }
  Widget _buildtaille() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Taille',contentPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 15)),
      maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          return 'taille is Required';
        }

        return null;
      },
      onSaved: (String value) {
        taille = value;
      },
    );
  }




  Widget _buildnamegly() {
    return Text(
      'Type Diabète:                                                                             ',
      textAlign: TextAlign.left,
      style: TextStyle(fontSize: 15),

    );
  }




  Widget _buildnamecardio() {
    return Text(
      'Antecedents cardio-vasculaire:                                                                             ',
      textAlign: TextAlign.left,
      style: TextStyle(fontSize: 15),

    );
  }

  Widget _buildCalories() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Calories',contentPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 15)),
      keyboardType: TextInputType.number,
      validator: (String value) {
        int calories = int.tryParse(value);

        if (calories == null || calories <= 0) {
          return 'Calories must be greater than 0';
        }

        return null;
      },
      onSaved: (String value) {
        calories = value;
      },
    );
  }
  Widget _buildImage() {
    return Container(


      child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [


            Text('Images Medicales'),
            FlatButton.icon(onPressed: (){
              showModalBottomSheet(context: context,
                builder: ((builder) => botttomSheet()),
              );
            },
              icon: Icon(Icons.add_a_photo),
              label: Text('add'),

            ),



            /*RaisedButton (onPressed: (){

            FlatButton.icon(
                  icon: Icon(Icons.camera),
              onPressed: (){
             takePhoto(ImageSource.camera);
               },
            label:Text("Camera"),
            );
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: (){
               takePhoto(ImageSource.gallery);
               },
              label:Text("Gallerie"),
             );
          },
           child:Text("Select Image !"),
    )*/
          ]
      ),
    );
  }

  /*Widget _selectImage(){


  }*/
  Future<void> takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }
  Widget _buildresultat() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'resultat ',contentPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 15)),
      keyboardType: TextInputType.multiline,
      maxLength: null,
      maxLines: null,
      validator: (String value) {

        return null;
      },
      onSaved: (String value) {
        resultat = value ;
      },
    );
  }

  Widget _buildnamequalite() {

    return Text(' Qualité image:                                                                               ',
      textAlign: TextAlign.left,
      style: TextStyle(fontSize: 15),
    );



  }





  Widget _buildnametrtm() {
    width: 500;
    return Text(
      'Traitement:                                                                                 ',
      textAlign: TextAlign.left,
      style: TextStyle(fontSize: 15),



    );
  }

  @override
  Widget build(BuildContext context) {
    final consultationProvider = Provider.of<ConsultationProvider>(context);
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
        title: Text('Ajouter Consultation',
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
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height - 40,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
              Positioned(

                  top:50.0,
                  child:Container(
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45.0),
                        topRight: Radius.circular(45.0),
                      ),
                      color: Colors.white,
                    ),
                    height:MediaQuery.of(context).size.height - 82,
                    width: MediaQuery.of(context).size.width  ,
                  )



              ),
              SizedBox(height: 100.0,),
              Stack(
                children: [
                  Container(
                      child: Column(
                          children : <Widget> [
                            _buildnamee(),
                            SizedBox(height: 30.0,),
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
                                        Text('Date Consultaation',
                                          style:TextStyle(
                                            fontSize: 19,
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
                            SizedBox(height: 0.0,),
                            TextFormField(
                              decoration: const InputDecoration(labelText: 'Taille',contentPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 15)),
                              maxLength: 10,
                              keyboardType: TextInputType.number,

                              validator: (val)=>val.length==0? "Veuiller remplir ce champ":null,
                              onSaved: (val)=>taille=val,
                              onChanged: (value){
                                consultationProvider.ChangeTaille(value);

                              },
                            ),
                            SizedBox(height: 0.0,),
                            TextFormField(
                              decoration: const InputDecoration(labelText: 'Tension',contentPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 15)),
                              keyboardType: TextInputType.number,
                              validator: (val)=>val.length==0? "Veuiller remplir ce champ":null,
                              onSaved: (val)=>tension=val,
                              onChanged: (value){
                                consultationProvider.ChangeTension(value);

                              },

                            ),
                            SizedBox(height: 0.0,),
                            TextFormField(
                              decoration: const InputDecoration(labelText: 'Poids',contentPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 15)),
                              keyboardType: TextInputType.number,
                              validator: (val)=>val.length==0? "Veuiller remplir ce champ":null,
                              onSaved: (val)=>poids=val,
                              onChanged: (value){
                                consultationProvider.ChangePoids(value);

                              },
                            ),
                            SizedBox(height: 0.0,),
                            TextFormField(
                              decoration: const InputDecoration(labelText: 'Calories',contentPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 15)),
                              keyboardType: TextInputType.number,
                              validator: (val)=>val.length==0? "Veuiller remplir ce champ":null,
                              onSaved: (val)=>calories=val,
                              onChanged: (value){
                                consultationProvider.ChangeCalories(value);

                              },
                            ),
                            SizedBox(height: 10.0,),
                            _buildImage(),
                            SizedBox(height: 10.0,),
                            _buildnamegly(),
                            SizedBox(height: 0.0,),
                            Container(

                              width: 500,

                              child: Row(
                                children: [

                                  Radio(value: 1,
                                      groupValue: selectedRadio,
                                      activeColor: Colors.red,
                                      onChanged: (value){
                                        setSelectedRadio(value);
                                        consultationProvider.ChangeDiabete(value);


                                      }

                                  ),

                                  Text(
                                    'type1', style: TextStyle(fontSize: 14),
                                  ),
                                  Radio(value: 2,
                                      groupValue: selectedRadio,
                                      activeColor: Colors.blue,
                                      onChanged: (value){
                                        setSelectedRadio(value);
                                        consultationProvider.ChangeDiabete(value);



                                      }
                                  ),
                                  Text(
                                    'type2', style: TextStyle(fontSize: 14),
                                  ),
                                  Radio(value: 3,
                                      groupValue: selectedRadio,
                                      activeColor: Colors.blue,
                                      onChanged: (value){
                                        setSelectedRadio(value);
                                        consultationProvider.ChangeDiabete(value);


                                      }
                                  ),
                                  Text(
                                    'gestationnel', style: TextStyle(fontSize: 14),
                                  )
                                ],
                              ),

                            ),
                            SizedBox(height: 0.0,),

                            _buildnametrtm(),
                            SizedBox(height: 0.0,),
                            Container(
                              width: 500,
                              child: Row(
                                children: [
                                  Radio(value: 1,
                                      groupValue: selectedRadio1,
                                      activeColor: Colors.red,
                                      onChanged: (value){
                                        setSelectedRadio1(value);
                                        consultationProvider.ChangeTraitement(value);

                                      }
                                  ),
                                  Text(
                                    'ADO', style: TextStyle(fontSize: 14),
                                  ),
                                  Radio(value: 2,
                                      groupValue: selectedRadio1,
                                      activeColor: Colors.blue,
                                      onChanged: (value){
                                        setSelectedRadio1(value);
                                        consultationProvider.ChangeTraitement(value);


                                      }
                                  ),
                                  Text(
                                    'Insuline', style: TextStyle(fontSize: 14),
                                  ),

                                ],
                              ),

                            ),
                            SizedBox(height: 0.0,),
                            _buildnamecardio(),
                            SizedBox(height: 0.0,),
                            Container(

                              width: 500,

                              child: Row(
                                children: [

                                  Radio(value: 1,
                                      groupValue: selectedRadio2,
                                      activeColor: Colors.red,
                                      onChanged: (value){
                                        setSelectedRadio2(value);
                                        consultationProvider.ChangeAntecedent(value);



                                      }

                                  ),

                                  Text(
                                    'HTA', style: TextStyle(fontSize: 14),
                                  ),
                                  Radio(value: 2,
                                      groupValue: selectedRadio2,
                                      activeColor: Colors.blue,
                                      onChanged: (value){
                                        setSelectedRadio2(value);
                                        consultationProvider.ChangeAntecedent(value);



                                      }
                                  ),
                                  Text(
                                    'Dyslipidémie', style: TextStyle(fontSize: 14),
                                  ),
                                  Radio(value: 3,
                                      groupValue: selectedRadio2,
                                      activeColor: Colors.blue,
                                      onChanged: (value){
                                        setSelectedRadio2(value);
                                        consultationProvider.ChangeAntecedent(value);


                                      }
                                  ),
                                  Text(
                                    'tabac', style: TextStyle(fontSize: 14),
                                  ),
                                  Radio(value: 4,
                                      groupValue: selectedRadio2,
                                      activeColor: Colors.blue,
                                      onChanged: (value){
                                        setSelectedRadio2(value);
                                        consultationProvider.ChangeAntecedent(value);


                                      }
                                  ),
                                  Text(
                                    'cancer', style: TextStyle(fontSize: 14),
                                  )
                                ],
                              ),

                            ),

                            SizedBox(height: 0.0,),
                            _buildresultat(),
                            SizedBox(height: 0.0,),

                          ]
                      )
                  )
                ],
              )
            ],

          ),

        ],


      ),



      floatingActionButton:FloatingActionButton(
        onPressed: (){
          consultationProvider.saveConsultation();

          Navigator.push(context, MaterialPageRoute(builder: (context)=>ListeConsultation()),);
        },
        child: Icon(Icons.done_outline),
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
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
                icon: Icon(Icons.image),
                onPressed: (){
                  takeImage(ImageSource.gallery);
                },
                label:Text("Gallerie"),
              ),

            ],
          )
        ],
      ),

    );
  }

  Future<void> takeImage(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }
}