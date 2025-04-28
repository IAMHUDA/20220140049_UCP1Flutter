import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
class PiketPage extends StatefulWidget {
  const PiketPage({super.key});

  @override
  State<PiketPage> createState() => _PiketPageState();
}

class _PiketPageState extends State<PiketPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _tugasController = TextEditingController();
  final TextEditingController _tanggalController = TextEditingController();

  List<Map<String, dynamic>> _daftarTugas = [];

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('id_ID', null);
  }
@override
  void dispose() {
    _namaController.dispose();
    _tugasController.dispose();
    _tanggalController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      locale: const Locale('id', 'ID'),
    );
    if (picked != null) {
      setState(() {
        _tanggalController.text = DateFormat(
          'EEEE, dd MMMM yyyy',
          'id_ID',
        ).format(picked);
      });
    }
  }

  void _tambahTugas() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _daftarTugas.add({
          'nama': _namaController.text,
          'tanggal': _tanggalController.text,
          'tugas': _tugasController.text,
        });
        _namaController.clear();
        _tanggalController.clear();
        _tugasController.clear();
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Piket Gudang',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFFE5A28),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}