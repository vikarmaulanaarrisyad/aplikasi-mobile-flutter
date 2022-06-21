import 'package:flutter/material.dart';
import 'package:app_pelaporan_kecelakaan_kota_tegal/screens/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Pelaporan Kecelakaan Kota Tegal',
      home: HomePage(),
    );
  }
}
