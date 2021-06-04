import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/providers/patient_provider.dart';
import 'package:flutter_test_app/providers/consultation_provider.dart';
import 'package:flutter_test_app/services/firestore_services.dart';
import 'package:flutter_test_app/validations/add_validation.dart';
import 'package:provider/provider.dart';
import 'vues/login-page.dart';
import 'vues/forgot-password.dart';
import 'vues/list-patient.dart';
import 'vues/add-patient.dart';
import 'vues/ListP.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final firestoreService =FirestoreService();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) =>PatientProvider()),
        ChangeNotifierProvider(create: (context) =>ConsultationProvider()),
        StreamProvider(create: (context) => firestoreService.getPatients()),
        StreamProvider(create: (context) => firestoreService.getConsultation()),
        ChangeNotifierProvider(create: (context) => AddValidation()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Doctor',
        theme: ThemeData(

          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginPage(),
          'ForgotPassword': (context) => ForgotPassword(),
          //'ListPatient': (context) => ListPatient(),
          'AddPatient': (context) => AddPatient(),
          'listP':(context)=> ListP(),
        }
      ),
    );
  }
}




