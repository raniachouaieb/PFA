/*import 'package:flutter/material.dart';
import 'package:flutter_test_app/model/list.dart';
import 'package:flutter_test_app/vues/add-patient.dart';
import 'package:flutter_test_app/vues/patient_details.dart';
import 'package:flutter_test_app/vues/ListP.dart';



import 'package:flutter_test_app/widgets/background-image.dart';

import 'package:flutter_test_app/pallette.dart';


class ListPatient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(image: 'assets/images/stetescope.jpg'),

     Scaffold(
      backgroundColor: Colors.transparent,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: ()=>debugPrint("search"),
          ),
          IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: ()=>debugPrint("search"),
          ),

        ],
        title: Text(
          'List Patient',
          style: kBodyText,
        ),
      ),

      body: ListView.builder(
          itemCount: listPatient.length,
          itemBuilder: (context, index){

            Patient patient= listPatient[index];
            return Padding (
              padding: EdgeInsets.all(8.0),
                child: ListTile(
                title: Text(patient.nom,
                    style: TextStyle(fontSize:20.0,fontWeight: FontWeight.bold ),) ,
                subtitle: Text(patient.prenom,
            style: TextStyle(fontSize:20.0),),
              leading:CircleAvatar(
                child: Text(patient.nom[0]),
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,

              ),

              trailing: Icon(Icons.arrow_forward),
                  onTap:(){



                  },
              
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
                ),
            );


          },



      ),
         floatingActionButton:FloatingActionButton(
           onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ListP()),),
           child: Icon(Icons.add),
           backgroundColor: Colors.redAccent,
           foregroundColor: Colors.white,
         ),

            )

    ],
    );
  }
}



class CircularButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Icon icon;
  final Function onClick;
  CircularButton({
    this.color,
    this.height,
    this.width,
    this.icon,
    this.onClick
});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color,
      shape: BoxShape.circle),
      width: width,
      height: height,
      child: IconButton(icon: icon, enableFeedback: true, onPressed: onClick),
    );
  }
}*/
