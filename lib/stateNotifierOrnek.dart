import 'dart:ffi';

import 'package:firebasefullapp/counter_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Burasi Bussines Logic olan SInifdir.


// StateNotifierProvider olusturdum. SImdi final ile provider olusturcam daha once yaptiim gibi
// Burda iki tane degisken alcak.
//            Birincisi StateNotifierdan extend ettigimiz sinifin turu  => StateNotifierOrnek
//            Ikincisi arayuze aktarilacak state sinifi, bu bir liste de olabilirdi vs. => Counter

final counterStateNotifierProvider=StateNotifierProvider<StateNotifierOrnek,Counter>((ref) {
  // asagida bahs ettigim burda iste sinifi burda cagirdim. Eger sinifim bir parametre istiyor olsaydi
  // yani superine bir baslangic degeri vermemis olsaydim.StateNotifierOrnek() constructoruna bir nesne vermek
  // zorundaydim. O da alip ust sinifin constructoruna atackti bunu.
  return StateNotifierOrnek();
} );



class StateNotifierOrnek extends StateNotifier<Counter>{
  // Okumadan once soyliyim: Burda arayuzden ornek verdim ama arayuzden degil de fnal bir variable olusturuldugunda
  // da yukardaki gibi yine de constructor cagrildiginda ayni durum geerli
  /// SImdi ben arayuzden bu sinifa erisip bunu kullancam. Onun icinden  StateNotifierOrnek sinifindan bir nesne
  /// olusturcam ve onun metotlarina filan eriscem. Simdi ondan bir nesne olusturmak istedigim zaman
  /// bende bir deger isteyecek.Counter tipinde bir nesne isteyecek. O iste benim state'min baslangic degeri oluyor.
  /// Onu arayuzde de verebilirim. Burda da. Burda vermek istersem. Burda iken buna bir parametre gecmem gerekiyor,
  /// StateNotifierOrnek(super.state) bu haliyle ne yapiyor. Sen arayuzden bu sinifi cagirdiginda verecegin Counter nesnesini
  /// aliyor. aldigini da ust siniftaki constructora gonderiyor.(super.state) ile yapiyor bunu.
  // Eger ben arayuzden degil burdan state degerimi belirlemek istiyorsam o zaman burda iken buna bir Counter
  // nesnesi vermem gerek. Nereye vermem gerek. Bu sinifin ust sinifi olan consturctora. Cunku o istiyor benden bunu
  // StateNotifierOrnek sinifi istemiyor. O da bizden alip ona gonderecek zaten. Onu katmadan direk super constructora bunu
  // verebilirim.
  ///StateNotifierOrnek(super.state);
  StateNotifierOrnek(): super(Counter(0));
  /// Boyle yaparak ne yaptim.  StateNotifierOrnek bu sinifi aradan cikardim. Artik UI tarafinda ben StateNotifierOrnek
  /// sinifindan bir nesne urettigim zaman benden bir Cunter nesnesi istemeyecek.
  /// Super Constructora verdigim Counter(0) nesnesi benim state'min baslangic noktasidir artik.
  // State Notifier sinifina bakarsam bunu bariz gorebilirim. Yani bu abstract sinifin constructoru bir nesne bekliyor.
  /// abstract class StateNotifier<T> {
  //   /// Initialize [state].
  //   StateNotifier(this._state);

  // Artik State hazir Artirma ve Azaltma yapcam.
   void increment(){
    /// Bu Spread operatordur. Value Notifier da da bunu kullaniriz.
    /// Burda yeni liste olusturacak. Daha sonra yeni geleni ekleyip ekrana notification gonderecek.
     /// state= generic olarak verdigim model ya liste ve benzeri. Benim ornegimde Counter modelidr
     /// Su an burda spread operator kullanmadim. Listede onu yapabilirdim.
     state=Counter(state.counter+=1);
  }

  void decrement(){
     state=Counter(state.counter-=1);
  }
}