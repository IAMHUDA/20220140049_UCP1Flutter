import 'package:flutter/material.dart';
import 'package:ucp1/piket_page.dart';

class HomePage extends StatefulWidget {
  final String nama;
  const HomePage({Key? key, required this.nama}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFFE5A28),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/profile.jpg'),
              radius: 20,
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Selamat Datang', style: TextStyle(fontSize: 14)),
                Text(
                  widget.nama,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout))],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Center(
                child: Image.asset(
                  'assets/banner.png',
                  width: 550,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            GridView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1, // 1:1 untuk normal card
              ),
              children: [
                menuCard(
                  icon: Icons.cloud_sync_sharp,
                  title: 'Data Piket',
                  backgroundColor: Color(0xFFFE5A28),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PiketPage()),
                    );
                  },
                ),
                menuCard(
                  icon: Icons.dashboard_customize_sharp,
                  title: 'Data Pelanggan',
                  backgroundColor: Color(0xFFFE5A28),
                  onTap: () {
                    
                  },
                  
                ),
              ],
            ),
            SizedBox(height: 12),
            menuCard(
              icon: Icons.list_alt_outlined,
              title: 'Barang Masuk/Keluar',
              backgroundColor: Color(0xFFFE5A28),
              height: 200,
              fullWidth: true,
              onTap: () {
                
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget menuCard({
    required IconData icon,
    required String title,
    Color backgroundColor = const Color(0xFFFE5A28),
    double height = 100,
    bool fullWidth = false,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: fullWidth ? double.infinity : null,
        height: height,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 36, color: Colors.white),
              SizedBox(width: 12),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}