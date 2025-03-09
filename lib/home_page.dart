import 'package:flutter/material.dart';
import 'package:pertemuan2/profile_page.dart';
import 'package:pertemuan2/save_button.dart';

class HomePage extends StatefulWidget {
  final String username;
  final String nickname;

  const HomePage({super.key, required this.username, required this.nickname});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _classController = TextEditingController();
  final TextEditingController _workExpController = TextEditingController();
  final TextEditingController _orgExpController = TextEditingController();
  final TextEditingController _hardSkillController = TextEditingController();
  final TextEditingController _softSkillController = TextEditingController();
  final TextEditingController _achievementController = TextEditingController();

  void _saveData() {
    if (_formKey.currentState!.validate()) {
      debugPrint("Data disimpan: Nama: \${_nameController.text}, NIM: \${_nimController.text}, Kelas: \${_classController.text}, Pengalaman Kerja: \${_workExpController.text}, Pengalaman Organisasi: \${_orgExpController.text}, Hard Skill: \${_hardSkillController.text}, Soft Skill: \${_softSkillController.text}, Pencapaian: \${_achievementController.text}");
      
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfilePage(
            nama: _nameController.text,
            nim: _nimController.text,
            kelas: _classController.text,
            pengalamanKerja: _workExpController.text,
            pengalamanOrganisasi: _orgExpController.text,
            hardSkill: _hardSkillController.text,
            softSkill: _softSkillController.text,
            pencapaian: _achievementController.text,
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    debugPrint("Nickname yang diterima di HomePage: \${widget.nickname}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5DC),
      appBar: AppBar(
      title: Center(
        child: Text(
          'Welcome, ${widget.nickname.isNotEmpty ? widget.nickname : widget.username}!',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: const Color(0xFF001F3F),
      iconTheme: const IconThemeData(color: Colors.white),
    ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildTextField(_nameController, 'Nama Lengkap'),
                _buildTextField(_nimController, 'NIM'),
                _buildTextField(_classController, 'Kelas'),
                _buildTextField(_workExpController, 'Pengalaman Kerja'),
                _buildTextField(_orgExpController, 'Pengalaman Organisasi'),
                _buildTextField(_hardSkillController, 'Hard Skill'),
                _buildTextField(_softSkillController, 'Soft Skill'),
                _buildTextField(_achievementController, 'Pencapaian/Penghargaan'),
                const SizedBox(height: 20),
                SaveButton(
                  onPressed: _saveData,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFF001F3F)),
          ),
          labelText: label,
        ),
        validator: (value) => value!.isEmpty ? "$label tidak boleh kosong!" : null,
      ),
    );
  }
}
