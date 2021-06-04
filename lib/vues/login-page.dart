
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/pallette.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_test_app/widgets/widgets.dart';
import 'package:flutter_test_app/vues/forgot-password.dart';


import 'ListP.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email;
  String _password;
  Future<void> _login() async {
    try{
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
      print("User: $_email");
      showDialog(context: context,
          builder: (context){
            return AlertDialog(
                title: Text('Sign in successful'),
                content: Text('welcome to your profile'),
                actions:[
                  FlatButton(child: Text('ok'),
                      onPressed: (){
                        Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (context) => ListP()),);
                      }
                  ),
                ]
            );
          });
    } on FirebaseAuthException catch(e){
      showDialog(context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("An error is produced"),
          content:  Text("$e"),
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
              },
            ),
          ],
        );

      });
    } catch(e){
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(
            image: 'assets/images/stetescope.jpg'
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Flexible(
                child: Center(
                  child: Text(
            'Doctor',
            style:TextStyle(
                color: Colors.white,
              fontSize: 60,
              fontWeight: FontWeight.bold),
              ),
           ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextInputField(icon: FontAwesomeIcons.envelope,
                  hint: 'Email',
                  inputType: TextInputType.emailAddress,
                  inputAction: TextInputAction.next,
                    onChanged: (value){
                      _email = value;
                    },
                ),
                  PasswordInput(icon: FontAwesomeIcons.lock,
                    hint: 'Password',
                    inputAction: TextInputAction.done,
                    onChanged: (value){
                      _password = value;
                    },
                  ),
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, 'ForgotPassword'),
                    child: Text(
                      'Forgot Password?',
                      style: kBodyText,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ButtonTheme(
                     minWidth: 320.0,
                      height: 50.0,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(16.0),),

                        onPressed: _login,
                            child: Text("Login",
                              style: kBodyText.copyWith(fontWeight: FontWeight.bold),),
                        color:Colors.redAccent,
                     ),
                     ),

                  SizedBox(
                    height: 120,
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}


class PasswordInput extends StatefulWidget {
  const PasswordInput({
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
  _PasswordInputState createState() => _PasswordInputState();
}


class _PasswordInputState extends State<PasswordInput> {
  bool _secureText = true;
  TextEditingController _passwordController = TextEditingController();
  var _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical:10.0),
      child: Container(
        key: _formKey,
        height: size.height * 0.08,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.grey[500].withOpacity(0.5),
          borderRadius: BorderRadius.circular(16) ,

        ),
        child: Center(

          child: TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              border: InputBorder.none,
              suffixIcon: IconButton(
              icon:Icon(_secureText ? Icons.remove_red_eye : Icons.security ),
              onPressed: (){
                setState((){
                  _secureText = !_secureText;

                });
              },
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child:Icon(
                widget.icon,
                size: 26,
                color: Colors.white,
              ),
            ),
            hintText: widget.hint,
            hintStyle : TextStyle(color: Colors.white),
          ),
            obscureText: _secureText,
            keyboardType: widget.inputType,
            textInputAction: widget.inputAction,
            onChanged: widget.onChanged,
          ),
        ),
      ),
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
  final onChanged;

  @override
  _TextInputFieldState createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
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
            hintStyle : TextStyle(color: Colors.white),

          ),

            keyboardType: widget.inputType,
            textInputAction: widget.inputAction,
            onChanged: widget.onChanged,

          ),

        ),
      ),
    );

  }
}



class Button extends StatelessWidget {
  const Button({
    Key key,
    this. buttonName, Future<void> onPressed,
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

        child: Text(
          buttonName,
          style: kBodyText.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}







