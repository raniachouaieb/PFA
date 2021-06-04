import 'package:flutter/material.dart';
import 'package:flutter_test_app/model/list.dart';
import 'package:flutter_test_app/providers/patient_provider.dart';
import 'package:flutter_test_app/vues/ListP.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';



class ModifPatient extends StatefulWidget {

  final Patient patient;

  ModifPatient([this.patient]);

  @override
  _ModifPatientState createState() => _ModifPatientState();
}

class _ModifPatientState extends State<ModifPatient> {
  String colorGroupValue;
  DateTime dn;
  String genre;

  int selectedRadio;
  @override
  void initStatee(){
    super.initState();
    selectedRadio = 0;
  }
  setSelectedRadio(int val){
    setState((){
      selectedRadio = val;
    });
  }

  TextEditingController _nameController = TextEditingController();
  TextEditingController _prenomController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _cinController = TextEditingController();
  TextEditingController _telController = TextEditingController();
  TextEditingController _adrController = TextEditingController();
  TextEditingController _genreController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _prenomController.dispose();
    _emailController.dispose();
    _cinController.dispose();
    _telController.dispose();

    _adrController.dispose();
    _genreController.dispose();
    super.dispose();
  }
  @override
  void initState(){
    super.initState();

    _nameController.text = widget.patient.nom;
    _prenomController.text= widget.patient.prenom;


  }
    @override
  Widget build(BuildContext context) {
    final patientProvider = Provider.of<PatientProvider>(context);
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

        title: Text('Modifier Profil Patient',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
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

               Padding(
                  padding: const EdgeInsets.only(top:130.0,left:17,right: 17),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  <Widget>[
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Saisir nom",
                          labelText: 'Nom',
                          labelStyle: TextStyle(
                            fontSize: 24,
                            color:Colors.black,
                          ),
                          icon:Icon(Icons.person),
                        ),
                        controller:_nameController,
                        onChanged: (value){
                          patientProvider.ChangeName(value);

                        },
                        keyboardType: TextInputType.name,
                        maxLength: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Saisir prenom",
                          labelText: 'Prénom',
                          labelStyle: TextStyle(
                            fontSize: 24,
                            color:Colors.black,
                          ),

                          icon:Icon(Icons.person),
                        ),
                        controller: _prenomController,
                        onChanged: (value){
                          patientProvider.ChangePrenom(value);
                        },
                        keyboardType: TextInputType.name,
                        maxLength: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: ('$dn'),
                            labelText: 'Date Naissance',
                            labelStyle: TextStyle(
                              fontSize: 24,
                              color:Colors.black,
                            ),
                            icon:IconButton(
                              icon:Icon(Icons.date_range),
                              onPressed: (){
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1990, 1, 1),
                                  lastDate: DateTime(2021, 12, 31),
                                ).then((value) {
                                  setState(() {
                                    dn = value;
                                  });

                                });
                              },)

                        ),

                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Saisir email",
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            fontSize: 24,
                            color:Colors.black,
                          ),
                          icon:Icon(Icons.email_rounded),
                        ),
                        onChanged: (value){
                          patientProvider.ChangeEmail(value);
                        },
                        keyboardType: TextInputType.emailAddress,



                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Saisir cin",
                          labelText: 'Cin',
                          labelStyle: TextStyle(
                            fontSize: 24,
                            color:Colors.black,
                          ),
                          icon:Icon(Icons.art_track_rounded),
                        ),
                        onChanged: (value){
                          patientProvider.ChangeCin(value);

                        },
                        keyboardType: TextInputType.number,
                        maxLength: 8,



                      ),

                      TextField(
                        decoration: InputDecoration(
                          hintText: "Saisir numéro de telephone",
                          labelText: 'Telephone',
                          labelStyle: TextStyle(
                            fontSize: 24,
                            color:Colors.black,
                          ),
                          icon:Icon(Icons.call),
                        ),
                        onChanged: (value){
                          patientProvider.ChangeTel(value);

                        },
                        keyboardType: TextInputType.number,
                        maxLength: 8,



                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Saisir adresse",
                          labelText: 'Adresse',
                          labelStyle: TextStyle(
                            fontSize: 24,
                            color:Colors.black,
                          ),
                          icon:Icon(Icons.add_location_rounded),
                        ),
                        onChanged: (value){
                          patientProvider.ChangeAdresse(value);
                        },
                        keyboardType: TextInputType.streetAddress,
                        maxLength: 10,
                      ),
                      Container(

                        width: 350,

                        child: Row(
                          children: [

                            Radio(value: 1,
                                groupValue: selectedRadio,
                                activeColor: Colors.red,
                                onChanged: (value){
                                  print("Radio $value");
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
                                onChanged: (val){
                                  print("Radio $val");
                                  setSelectedRadio(val);

                                  patientProvider.ChangeGenre(val);
                                }
                            ),
                            Text(
                              'Homme', style: TextStyle(fontSize: 24),
                            )
                          ],
                        ),

                      ),


                    ],



                  ),
                )


            ]
          )
        ],
      ),
      floatingActionButton:FloatingActionButton(
        onPressed: (){
         // patientProvider.updatePatient();

          Navigator.push(context, MaterialPageRoute(builder: (context)=>ListP()),);},
        child: Icon(Icons.done_outline),
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
      ),


    );
  }
}

