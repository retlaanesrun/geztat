import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  // Flutter uygulamasını başlatmadan önce Supabase'i başlatıyoruz
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://mwoyumghlfzwuinyhhwt.supabase.co', // Proje URL'niz
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im13b3l1bWdobGZ6d3VpbnloaHd0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzcyMzI0MDAsImV4cCI6MjA1MjgwODQwMH0.Y9G8iqJm4kE4QKpw6MliLWRFjbvPznj8-rARstylo9Q', // Anon key'iniz
  );
  runApp(const GezTatUygulamasi());
}

class GezTatUygulamasi extends StatelessWidget {
  const GezTatUygulamasi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gez Tat',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF556B2F)),
        useMaterial3: true,
      ),
      home: const AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatelessWidget {
  const AnaSayfa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            color: const Color(0xFF556B2F),
            child: Center(
              child: ClipOval(
                child: Image.asset(
                  'assets/image/Katman_2_1.png',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.75,
            color: const Color(0xFFE8C14A),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'GEZ-TAT',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Hangi Şehirdesin?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SehirlerSayfasi()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFF8E1),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  child: const Text('Şehirlere Git'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SehirlerSayfasi extends StatefulWidget {
  const SehirlerSayfasi({super.key});

  @override
  _SehirlerSayfasiState createState() => _SehirlerSayfasiState();
}

class _SehirlerSayfasiState extends State<SehirlerSayfasi> {
  final List<String> sehirler = [
    'Adana',
    'Ankara',
    'İstanbul',
    'İzmir',
    'Bursa'
  ];
  final TextEditingController _searchController = TextEditingController();
  List<String> _filteredSehirler = [];

  @override
  void initState() {
    super.initState();
    _filteredSehirler = sehirler;
  }

  void _filterSehirler() {
    setState(() {
      _filteredSehirler = sehirler
          .where((sehir) => sehir
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Şehirler'),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onChanged: (text) => _filterSehirler(),
              decoration: InputDecoration(
                labelText: 'Şehir Ara',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredSehirler.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(
                    'assets/icons/location.png',
                    width: 30,
                    height: 30,
                  ),
                  title: Text(_filteredSehirler[index]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SehirDetaySayfasi(sehir: _filteredSehirler[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SehirDetaySayfasi extends StatefulWidget {
  final String sehir;

  const SehirDetaySayfasi({super.key, required this.sehir});

  @override
  _SehirDetaySayfasiState createState() => _SehirDetaySayfasiState();
}

class _SehirDetaySayfasiState extends State<SehirDetaySayfasi> {
  List<bool> _favorites = List.generate(5, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/icons/menu.png',
              width: 30,
              height: 30,
            ),
            const SizedBox(width: 8),
            Text('${widget.sehir} Restoranları'),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Restoran ${index + 1}'),
                  trailing: IconButton(
                    icon: Icon(
                      _favorites[index]
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: _favorites[index] ? Colors.red : null,
                    ),
                    onPressed: () {
                      setState(() {
                        _favorites[index] = !_favorites[index];
                      });
                    },
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RestoranDetaySayfasi(
                            restoran: 'Restoran ${index + 1}'),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class RestoranDetaySayfasi extends StatefulWidget {
  final String restoran;

  const RestoranDetaySayfasi({super.key, required this.restoran});

  @override
  _RestoranDetaySayfasiState createState() => _RestoranDetaySayfasiState();
}

class _RestoranDetaySayfasiState extends State<RestoranDetaySayfasi> {
  double rating = 3.0; // Başlangıçta 3 yıldız

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.restoran),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Konum:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              '1234, İstiklal Caddesi, İstanbul, Türkiye',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Değerlendirme:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < rating ? Icons.star : Icons.star_border,
                    color: Colors.yellow,
                  ),
                  onPressed: () {
                    setState(() {
                      rating = index + 1.0;
                    });
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
