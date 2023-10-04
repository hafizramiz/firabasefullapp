import 'package:cloud_firestore/cloud_firestore.dart';

enum FirebaseCollections {
  // Burdaki version name olarak erisiliyor.
  version;

  CollectionReference get reference =>
      FirebaseFirestore.instance.collection(name);
}
