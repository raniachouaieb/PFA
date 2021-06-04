import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test_app/model/list.dart';
import 'package:flutter_test_app/model/consultation.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> savePatient(Patient patient) {
    return _db.collection('patients').doc(patient.patientId).set(
        patient.toMap());
  }

  Future<void> saveConsultation(Consultation consult) {
    return _db.collection('consultation').doc(consult.consultationId).set(
        consult.toMap());
  }

  Stream<List<Patient>> getPatients() {
    return _db.collection('patients').snapshots().map((snapshot) =>
        snapshot.docs.map((document) =>Patient.fromFirestore(document.data())).toList());
  }
  Stream<List<Consultation>> getConsultation() {
    return _db.collection('consultation').snapshots().map((snapshot) =>
        snapshot.docs.map((document) =>Consultation.fromFirestore(document.data())).toList());
  }

  //searchByNom(String searchField){
    //return _db.collection('patients').where('searchKey', isEqualTo: searchField.substring(0, 1).toUpperCase()).get();
  //}



}