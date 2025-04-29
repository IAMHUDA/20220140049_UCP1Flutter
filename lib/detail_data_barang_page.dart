import 'package:flutter/material.dart';

class DetailDataBarangPage extends StatelessWidget {
  final String tanggal;
  final String jenisTransaksi;
  final String jenisBarang;
  final int jumlah;
  final int hargaSatuan;
  final int totalHarga;
  
  const DetailDataBarangPage({
    super.key,
    required this.tanggal,
    required this.jenisTransaksi,
    required this.jenisBarang,
    required this.jumlah,
    required this.hargaSatuan,
    required this.totalHarga,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 
      Padding(padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          const SizedBox(height: 40),
              // Success icon with circle
              Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Data Berhasil Disimpan',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 30),
              
              
              Column(
                children: [
                  _buildTableRow('Tanggal', tanggal, false),
                  _buildTableRow('Jenis Transaksi', jenisTransaksi, false),
                  _buildTableRow('Jenis Barang', jenisBarang, false),
                  _buildTableRow('Jumlah Barang', jumlah.toString(), false),
                  _buildTableRow('Jenis Harga Satuan', 'Rp. ${hargaSatuan.toString()}', false),
                  _buildTableRow('Total Harga', 'Rp. ${totalHarga.toString()}', true),
                ],
              ),
              
              SizedBox(height: 40,),
              // Selesai button
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 20),
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Selesai',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
        ],
      ),)),
    );
    
  }
  Widget _buildTableRow(String label, String value, bool isLast) {
    return Container(
      decoration: BoxDecoration(
        border: isLast ? null : Border(bottom: BorderSide(color: Colors.grey.shade300, width: 1)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 1),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Text(
                value,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}