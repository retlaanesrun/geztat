import 'package:flutter/material.dart';

class RestoranListesiSayfasi extends StatefulWidget {
  final String sehir;

  const RestoranListesiSayfasi({super.key, required this.sehir});

  @override
  State<RestoranListesiSayfasi> createState() => _RestoranListesiSayfasiState();
}

class _RestoranListesiSayfasiState extends State<RestoranListesiSayfasi> {
  bool isLoading = true; // Yükleniyor göstergesi için değişken

  @override
  void initState() {
    super.initState();
    // Veritabanından restoranları yükleyecek fonksiyon burada çağrılabilir.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.sehir} Restoranları")),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator()) // Yükleniyor göstergesi
          : const Center(
              child: Text("Veriler buraya yüklenecek"),
            ),
    );
  }
}
