
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/model/consultation.dart';
import 'package:flutter_test_app/model/consultation.dart';
import 'package:flutter_test_app/providers/patient_provider.dart';
import 'package:flutter_test_app/services/firestore_services.dart';
import 'package:flutter_test_app/vues/AddConsultation.dart';
import 'package:flutter_test_app/vues/DetailC.dart';
import 'package:flutter_test_app/vues/add-patient.dart';
import 'package:flutter_test_app/vues/modif-patient.dart';
import 'package:flutter_test_app/vues/patient_details.dart';
import 'package:flutter_test_app/vues/login-page.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

/*class Post{
  final String title;
  final String description;
  Post(this.title, this.description);
}*/
class ListeConsultation extends StatelessWidget {

  /*Future<List<Post>> search(String search) async {
    await Future.delayed(Duration(seconds: 2));
    return List.generate(search.length, (int index) {
      return Post(
        "title : $search $index",
        "description : $search $index",
      );
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListViewHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ListViewHomePage extends StatefulWidget {

  @override
  _ListViewHomePageState createState() => _ListViewHomePageState();
}

class _ListViewHomePageState extends State<ListViewHomePage> {

  final Consultation consult;

  _ListViewHomePageState([this.consult]);







  @override
  Widget build(BuildContext context) {
    final consultation = Provider.of<List<Consultation>>(context);
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.arrow_back),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>AddConsultation()));
                                  }),



                  ]
              ),
      ]
            ),
    ),

            Padding(
              padding: EdgeInsets.only(left: 40.0),
              child: Row(
                  children: <Widget>[
                    Center(
                      child: Text('            Liste Consultation',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                        ),
                      ),
                    ),

                  ]
              ),
            ),
            SizedBox(height: 40.0,),
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height - 82.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(75.0),
                  )
              ),
              child: ListView.builder(
                itemCount: consultation.length,
                itemBuilder: (context, index){

                  return Slidable(
                      key:ValueKey(index),
                      actionPane: SlidableDrawerActionPane(),
                      secondaryActions: <Widget>[
                        IconSlideAction(
                          caption: 'Update',
                          color:Colors.blueGrey,
                          icon: Icons.edit,
                          closeOnTap: false,
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>AddConsultation()));

                          },
                        )
                      ],
                      dismissal: SlidableDismissal(child: SlidableDrawerDismissal(),),
                      child:Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                        child: InkWell(
                            onTap: () {


                              Navigator.push(context, MaterialPageRoute(builder: (context) =>DetailConsultation(consultation[index].patientId,
                                  consultation[index].taille,consultation[index].tension,consultation[index].poids,consultation[index].calories,consultation[index].typediabet,consultation[index].traitement,consultation[index].antecedent)));

                            },
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                      child: Row(
                                        children: <Widget>[


                                          SizedBox(width: 50.0,),
                                          Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[

                                                Text(consultation[index].taille,
                                                  style: TextStyle(
                                                    fontSize: 17.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),

                                                ),
                                                Text(consultation[index].poids,
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                    color: Colors.grey,
                                                  ),

                                                ),
                                              ]
                                          )
                                        ],
                                      )
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.arrow_forward,
                                        color:Colors.deepPurple),
                                    color: Colors.black,
                                    onPressed: () {
                                    },

                                  )

                                ]


                            )
                        ),
                      )
                  );

                },
              ),
            )
          ]
      ),



    );
  }





}



