import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DataBarangPage extends StatefulWidget {
  const DataBarangPage({super.key});

  @override
  State<DataBarangPage> createState() => _DataBarangPageState();
}

class _DataBarangPageState extends State<DataBarangPage> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _tanggalController = TextEditingController();
  final TextEditingController _jumlahController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();

  String? _selectedJenisTransaksi;
  String? _selectedJenisBarang;

  final Map<String, int> _hargaBarang = {
    'Carrier': 540000,
    'Sleeping Bag': 250000,
    'Tenda': 700000,
    'Sepatu': 350000,
  };

  // Daftar nama hari dalam bahasa Indonesia
  final Map<String, String> _indonesianDays = {
    'Monday': 'Senin',
    'Tuesday': 'Selasa',
    'Wednesday': 'Rabu',
    'Thursday': 'Kamis',
    'Friday': 'Jumat',
    'Saturday': 'Sabtu',
    'Sunday': 'Minggu',
  };

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        // Format tanggal dengan hari dalam bahasa Inggris dulu
        String englishFormat = DateFormat('EEEE/MM/yyyy').format(picked);
        // Ambil bagian hari dan ganti dengan bahasa Indonesia
        String englishDay = englishFormat.split('/')[0];
        String indonesianDay = _indonesianDays[englishDay] ?? englishDay;
        // Gabungkan kembali dengan format yang sama
        _tanggalController.text = englishFormat.replaceFirst(englishDay, indonesianDay);
      });
    }
  }

  @override
  void dispose() {
    _tanggalController.dispose();
    _jumlahController.dispose();
    _hargaController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Pendataan Barang',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
        centerTitle: true,
        backgroundColor: const Color(0xFFFE5A28),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Tanggal Transaksi'),
              const SizedBox(height: 8),
              TextFormField(
                controller: _tanggalController,
                readOnly: true,
                onTap: _selectDate,
                decoration: InputDecoration(
                  hintText: 'Tanggal Transaksi',
                  prefixIcon: const Icon(Icons.calendar_today),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tanggal tidak boleh kosong';
                  }
                  return null;
                },
              ),
            ],
          )
        ),
      ),
    );
  }
}