import 'package:flutter/material.dart';

enum IconConstants{
  microfon('ic_microfon.png'),
  appIcon('ic_logo.png');


  final String value;
  const IconConstants(this.value);
  String get toPng=>'assets/icons/$value';
  Image get toImage=>Image.asset(toPng);
}



// Kullanim Ornegi
class Deneme extends StatelessWidget {
  const Deneme({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(IconConstants.microfon.toPng);
  }
}
