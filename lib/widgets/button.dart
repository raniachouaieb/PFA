import 'package:flutter/material.dart';
import 'package:flutter_test_app/pallette.dart';
import 'package:flutter_test_app/vues/ListP.dart';


class Button extends StatelessWidget {
  const Button({
    Key key,
    this. buttonName,
  }) : super(key: key);
  final String buttonName;

  @override
  Widget build(BuildContext context) {

    Size size =  MediaQuery.of(context).size;
    return Container(
      height: size.height *0.08,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.red,
      ),
      child: FlatButton(
        onPressed: () {

          Navigator.push(context, MaterialPageRoute(builder: (context) => ListP()),);},
        child: Text(
          buttonName,
          style: kBodyText.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}