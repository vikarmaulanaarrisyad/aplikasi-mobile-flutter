import 'dart:convert';

import 'package:app_pelaporan_kecelakaan_kota_tegal/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddData extends StatelessWidget {
  //  AddData({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  TextEditingController _pengirimController = TextEditingController();
  TextEditingController _kecamatanController = TextEditingController();
  TextEditingController _keteranganController = TextEditingController();
  TextEditingController _jalanController = TextEditingController();
  TextEditingController _latController = TextEditingController();
  TextEditingController _longController = TextEditingController();

  Future SaveData() async {
    final response = await http.post(Uri.parse("https://e-lakategal.my.id/index.php/api/postdata"), body: {
      "nama_pengirim": _pengirimController.text,
      "nama_kecamatan": _kecamatanController.text,
      "keterangan": _keteranganController.text,
      "nama_jalan": _jalanController.text,
      "lat":  _latController.text,
      "lng":  _longController.text,
    });

    // print(response.body);

    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tambah Data"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _pengirimController,
              decoration: InputDecoration(labelText: "Nama Pengirim"),
              validator: (value) {
                if(value == null || value.isEmpty) {
                  return "Nama pengirim tidak boleh kosong";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _kecamatanController,
              decoration: InputDecoration(labelText: "Nama Kecamatan"),
              validator: (value) {
                if(value == null || value.isEmpty) {
                  return "Nama Kecamatan tidak boleh kosong";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _jalanController,
              decoration: InputDecoration(labelText: "Nama Jalan"),
              validator: (value) {
                if(value == null || value.isEmpty) {
                  return "Nama Jalan tidak boleh kosong";
                }
                return null;
              },
            ), 
            TextFormField(
              controller: _keteranganController,
              decoration: InputDecoration(labelText: "Keterangan"),
              validator: (value) {
                if(value == null || value.isEmpty) {
                  return "Keterangan tidak boleh kosong";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _latController,
              decoration: InputDecoration(labelText: "Lat"),
              validator: (value) {
                if(value == null || value.isEmpty) {
                  return "Lat tidak boleh kosong";
                }
                return null;
              },
            ),
            TextFormField(
              controller: _longController,
              decoration: InputDecoration(labelText: "Long"),
              validator: (value) {
                if(value == null || value.isEmpty) {
                  return "Long tidak boleh kosong";
                }
                return null;
              },
            ),
            
            SizedBox(height: 20
            ,),
            ElevatedButton(onPressed: (){

              if(_formKey.currentState!.validate()) {
                SaveData().then((value){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                });
                
              }
              // print(_pengirimController.text);
            }, child: Text("Simpan"))
            ],

        ),
      )
    );
  }
}