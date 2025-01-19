import 'package:flutter/material.dart';
import 'restoran_listesi_sayfasi.dart'; // RestoranListesiSayfasi'yi import edin

class SehirListesiSayfasi extends StatefulWidget {
  const SehirListesiSayfasi({super.key});

  @override
  State<SehirListesiSayfasi> createState() => _SehirListesiSayfasiState();
}

class _SehirListesiSayfasiState extends State<SehirListesiSayfasi> {
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
