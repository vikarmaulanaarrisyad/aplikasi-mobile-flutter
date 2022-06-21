import 'package:app_pelaporan_kecelakaan_kota_tegal/screens/add_data.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => AddData()));
      }),
      appBar: AppBar(
        title: Text('Aplikasi Pelaporan Kecelakaan Kota Tegal'),
      ),
      body: Container(
        child: Center(
          child: Text(
            'SELAMAT DATANG DI APLIKASI PELAPORAN KECELAKAAN KOTA TEGAL',
            style: TextStyle(fontSize: 20),
            )),
      ));
  }
}
