import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasefullapp/product/utility/custom_exceptions.dart';

abstract class IdRequiredModel {
  String? get id;
}

abstract class IFirebaseModel<T extends IdRequiredModel> {
  // Burda abstract sinif olusturdum. Bu siniftan tureyen siniflar bunun icini doldurmak zorundadir
  // Burdaki metotlar ne yapacaginiz bilmezler. Bunu extend eden siniflarin bunu yazmasi lazim.
  T fromJson(Map<String, dynamic> json); // Bu metot map'i modele ceviriyor.

  T fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final value = snapshot.data();

    if (value == null) {
      throw FirebaseCustomException("$snapshot data is null");
    }

    // fixme
    value.addEntries([MapEntry('id', snapshot.id)]);
    return fromJson(value);
  }
}
