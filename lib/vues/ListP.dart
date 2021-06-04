
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/model/list.dart';
import 'package:flutter_test_app/providers/patient_provider.dart';
import 'package:flutter_test_app/services/firestore_services.dart';
import 'package:flutter_test_app/vues/AddConsultation.dart';
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
class ListP extends StatelessWidget {

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
  var queryResultSet = [];
  var tempSearchStore = [];

  initiateSearch(value){
    if(value.length == 0){
      setState(() {
        queryResultSet = [];
        tempSearchStore = [];
      });
    }


  }
  bool searchState = false;



  final Patient patient;

  _ListViewHomePageState([this.patient]);
  @override
  Widget build(BuildContext context) {
    final patients = Provider.of<List<Patient>>(context);
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
                          icon: Icon(Icons.logout),
                          color: Colors.white,
                          onPressed: () {
                            showDialog(context: context,
                                builder: (context){
                                  return AlertDialog(
                                      title: Text('LogOut'),
                                      content: Text('Are you sure to quit?'),
                                      actions:[
                                        FlatButton(child: Text('yes'),
                                            onPressed: (){
                                              Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (context) => LoginPage()),);
                                            }
                                        ),
                                        FlatButton(child: Text('Cancel'),
                                            onPressed: (){
                                              Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (context) => ListP()),);
                                            }
                                        ),
                                      ]
                                  );
                                });
                          },
                        ),
                        !searchState?Text("Log out",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                          ),
                        ):
                            SizedBox(
                              width: 210.0,
                              child:
                                /*SearchBar<Post>(
                                onSearch: search,
                                onItemFound: (Post post, int index){
                                  return ListTile(
                                    title: Text(post.title),
                                    subtitle: Text(post.description),
                                  )
                                }
                              )*/
                               TextFormField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.search, color:Colors.white),
                                  hintText: "search...",
                                  hintStyle: TextStyle(color:Colors.white),

                                ),
                                onChanged: (val){
                                  initiateSearch(val);
                                },

                              ),
                            ),

    ]
                      ),




                    SizedBox(width: 60.0,),

                    Container(
                      width: 57.0,
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[

                          !searchState?IconButton(
                            icon: Icon(Icons.search),
                            color: Colors.white,
                            onPressed: (){
                              /*showSearch(context: context, delegate: DataSearch());*/
                              setState((){
                                searchState = !searchState;
                              });

                            }

                          ):
                            IconButton(
                             icon: Icon(Icons.close),
                              color: Colors.white,
                              onPressed: (){
                                setState((){
                                   searchState = !searchState;
                                   });
                              },
                            )

                        ]
                      )
                    )
                  ]
              ),
            ),




            Padding(
              padding: EdgeInsets.only(left: 40.0),
              child: Row(
                  children: <Widget>[
                    Center(
                      child: Text('            Liste Patient',
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
                  .height - 150.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(75.0),
                  )
              ),
              child: ListView.builder(
                itemCount: patients.length,
                  itemBuilder: (context, index){
                  var imagePath="assets/images/fem.png";

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


                              Navigator.push(context, MaterialPageRoute(builder: (context) =>DetailPatient(imagePath,patients[index].nom,patients[index].prenom,patients[index].email,patients[index].cin,patients[index].tel,patients[index].adr,patients[index].genre)));

                            },
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                      child: Row(
                                        children: <Widget>[
                                          Hero(
                                              tag: imagePath,
                                              child: Image(
                                                image: AssetImage(imagePath),
                                                fit: BoxFit.cover,
                                                height: 75.0,
                                                width: 75.0,
                                              )
                                          ),

                                          SizedBox(width: 50.0,),
                                          Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[

                                                Text(patients[index].nom,
                                                  style: TextStyle(
                                                    fontSize: 17.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),

                                                ),
                                                Text(patients[index].prenom,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                AddPatient()),),
        child: Icon(Icons.add),
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
      ),


    );
  }




 
}



