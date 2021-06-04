import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/pallette.dart';
import 'package:flutter_test_app/vues/login-page.dart';
import 'package:flutter_test_app/widgets/background-image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ForgotPassword extends StatefulWidget {

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String email;




  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(image: 'assets/images/stetescope.jpg'),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(
                  Icons.arrow_back_ios,
                  color: kWhite)
            ),
            title: Text(
              'Forgot Password',
              style: kBodyText,
            ),
            centerTitle: true,
          ),
          body: Column(


            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    Container(
                       width: size.width * 0.8,
                       child: Text(
                    'Enter your email we will send instruction to reset your password',
                    style: kBodyText,
                        ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    TextInputField(icon: FontAwesomeIcons.envelope,
                        hint: 'Email',
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.done,
                      onChanged:(val){
                      setState(() {
                        email = val;
                      });

                      }

                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ButtonTheme(
                      minWidth: 320.0,
                      height: 50.0,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(16.0),),

                        onPressed: ()  {
                          resetPassword(context);
                          Navigator.of(context).pop();

                        },
                        child: Text("Send Request",
                          style: kBodyText.copyWith(fontWeight: FontWeight.bold),),
                        color:Colors.redAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
    ]
    );
  }

  void resetPassword(BuildContext context) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    showDialog(context: context,
        builder: (BuildContext context){
      return AlertDialog(
          content:  Text("we sent an email"),
          actions: <Widget>[
      FlatButton(
      child: Text('Ok'),
    onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => LoginPage(),
    ),
    );
    print( "reset pass");
  }
  )
  ]
      );
  }
    );
 }
}






class TextInputField extends StatefulWidget {
  const TextInputField({
    Key key,
    @required this.icon,
    @required this.hint,
    this.inputType,
    this.inputAction,
    this.onChanged,
  }) : super(key: key);

  final IconData icon;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final  onChanged;


  @override
  _TextInputFieldState createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Form(
      key: _formKey,
      child: Column(
          children: <Widget>[
      Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: size.height * 0.08,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.grey[500].withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),

        child: Center(
          child: TextField(decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Icon(
                widget.icon,
                size: 26,
                color: Colors.white,
              ),
            ),
            hintText: widget.hint,
            hintStyle: TextStyle(color: Colors.white),

          ),

            keyboardType: widget.inputType,
            textInputAction: widget.inputAction,
          ),
        ),
      ),
    ),
    ],
      ),
    );

  }

}
