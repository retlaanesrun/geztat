import 'package:flutter/material.dart';
import 'restoran_listesi_sayfasi.dart';

class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Şehirler")),
      body: const Center(
        child: Text("Veriler buraya yüklenecek"),
      ),
    );
  }
}
