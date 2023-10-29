import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasefullapp/feature/home/home_view_notifier.dart';
import 'package:firebasefullapp/feature/signin/sign_in_view.dart';
import 'package:firebasefullapp/product/auth/auth_notifier.dart';
import 'package:firebasefullapp/product/models/auth_user.dart';
import 'package:firebasefullapp/product/models/news.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../product/utility/firebase_collections.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {
// Deneme yapiyorum
// var a = FirebaseCollections.version.name;
    print("Enumdaki name: ${FirebaseCollections.version.name}");

    CollectionReference newsCollRef =
        FirebaseFirestore.instance.collection("news");
    final Future<QuerySnapshot<News>> response =
        newsCollRef.withConverter<News>(fromFirestore: (snapshot, _) {
      return News().fromFirestore(snapshot!);
    }, toFirestore: (news, options) {
      return news.toJson();
    }).get();
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: (){
          print("sign out tiklandi");

        }, icon: Icon(Icons.logout))],
        title: Text(("data")),
      ),
      body: FutureBuilder(
        future: response,
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<News>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Placeholder();
            case ConnectionState.waiting:
            case ConnectionState.active:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if (snapshot.hasData) {
                final newsList =
                    snapshot.data!.docs.map((e) => e.data()).toList();
                return ListView.builder(
                    itemCount: newsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text("${newsList[index].backgroundImage}"),
                        subtitle: Text("${newsList[index].title}"),
                      );
                    });
              }
          }
          print("snapshottaki data: ${snapshot.data}");
          print("snapshottaki data tipi: ${snapshot.data.runtimeType}");
          return Text("data");
        },
      ),
    );
  }
}


class HomeDeneme extends ConsumerWidget {
  const HomeDeneme({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier=ref.read(authNotifierProvider.notifier);
    // Auth user'i elde ettim
   final AuthUser myAuthUser= ref.watch(authNotifierProvider).user;
    
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("user id: ${myAuthUser.id}"),
            Text("user Name ${myAuthUser.name}"),
            Text("user mail${myAuthUser.email}"),
            ElevatedButton(
                onPressed: (){
              print("sign out");
              authNotifier.onSignOut();
            },
            child: Text("sign out"),),
          ],
        ),
      ),
    );
  }
}
