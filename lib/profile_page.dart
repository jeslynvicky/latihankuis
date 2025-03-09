import 'package:flutter/material.dart';
import 'package:pertemuan2/login_page.dart';

class ProfilePage extends StatelessWidget {
  final String nama;
  final String nim;
  final String kelas;
  final String pengalamanKerja;
  final String pengalamanOrganisasi;
  final String hardSkill;
  final String softSkill;
  final String pencapaian;

  const ProfilePage({
    super.key,
    required this.nama,
    required this.nim,
    required this.kelas,
    required this.pengalamanKerja,
    required this.pengalamanOrganisasi,
    required this.hardSkill,
    required this.softSkill,
    required this.pencapaian,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5DC), // Beige background
      appBar: AppBar(
        backgroundColor: const Color(0xFF001F3F), // Navy AppBar
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Profile Page',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true, // Pastikan ini ada agar judul tetap di tengah
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/image/image2.png'),
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(height: 20),
              _buildCard('Nama', nama),
              _buildCard('NIM', nim),
              _buildCard('Kelas', kelas),
              _buildCard('Pengalaman Kerja', pengalamanKerja),
              _buildCard('Pengalaman Organisasi', pengalamanOrganisasi),
              _buildCard('Hard Skill', hardSkill),
              _buildCard('Soft Skill', softSkill),
              _buildCard('Pencapaian', pencapaian),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF001F3F), // Navy blue button
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                    (route) => false,
                  );
                },
                child: const Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }

Widget _buildCard(String title, String content) {
  return Card(
    elevation: 3,
    margin: const EdgeInsets.symmetric(vertical: 5),
    color: Colors.white,
    child: ListTile(
      title: Text(
        title, 
        style: const TextStyle(
          fontWeight: FontWeight.bold, 
          color: Color(0xFF001F3F), // Navy text
          fontSize: 14, // Ukuran font lebih kecil
        ),
      ),
      subtitle: Text(
        content, 
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16, // Bisa sedikit lebih besar dari judul
        ),
      ),
    ),
  );
}
}