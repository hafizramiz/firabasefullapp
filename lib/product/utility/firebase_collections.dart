enum FirebaseCollections{
    version;

 CollectionReference get reference => FirebaseFirestore.instance.collection(name);
 
}