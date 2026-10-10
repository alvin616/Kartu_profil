
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const Color cream = Color(0xFFF7F1E8);
const Color darkBrown = Color(0xFF49372B);
const Color mediumBrown = Color(0xFF92745D);
const Color lightBrown = Color(0xFFE9DED0);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kartu Profil',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: cream,
        colorScheme: ColorScheme.fromSeed(
          seedColor: darkBrown,
        ),
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isWide = width > 600;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkBrown,
        foregroundColor: cream,
        centerTitle: true,
        title: const Text(
          'KARTU PROFIL',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
                border: Border.all(color: lightBrown),
                boxShadow: [
                  BoxShadow(
                    color: darkBrown.withOpacity(0.08),
                    blurRadius: 25,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Layout berubah sesuai lebar layar
                  if (isWide)
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Center(
                            child: buildProfilePhoto(),
                          ),
                        ),
                        const SizedBox(width: 28),
                        Expanded(
                          flex: 3,
                          child: buildProfileInfo(),
                        ),
                      ],
                    )
                  else
                    Column(
                      children: [
                        Center(child: buildProfilePhoto()),
                        const SizedBox(height: 28),
                        buildProfileInfo(),
                      ],
                    ),

                  const SizedBox(height: 28),
                  const Divider(color: lightBrown),
                  const SizedBox(height: 20),

                  // Deskripsi
                  const Text(
                    'TENTANG SAYA',
                    style: TextStyle(
                      color: mediumBrown,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Saya merupakan mahasiswa semester 5 '
                        'di Universitas Pesantren Tinggi Darul Ulum. '
                        'Saya memiliki ketertarikan pada teknologi '
                        'informasi dan pengembangan aplikasi serta '
                        'terus berusaha meningkatkan pengetahuan '
                        'dan kemampuan di bidang Sistem Informasi.',
                    style: TextStyle(
                      color: darkBrown,
                      fontSize: 15,
                      height: 1.8,
                    ),
                  ),

                  const SizedBox(height: 28),

                  // Informasi pribadi
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: cream,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'INFORMASI PRIBADI',
                          style: TextStyle(
                            color: darkBrown,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                        SizedBox(height: 20),
                        InfoRow(
                          icon: Icons.badge_outlined,
                          label: 'NIM',
                          value: '4124044',
                        ),
                        SizedBox(height: 16),
                        InfoRow(
                          icon: Icons.school_outlined,
                          label: 'Program Studi',
                          value: 'Sistem Informasi',
                        ),
                        SizedBox(height: 16),
                        InfoRow(
                          icon: Icons.location_on_outlined,
                          label: 'Alamat',
                          value: 'Brudu, Sumobito',
                        ),
                        SizedBox(height: 16),
                        InfoRow(
                          icon: Icons.account_balance_outlined,
                          label: 'Universitas',
                          value:
                          'Universitas Pesantren Tinggi Darul Ulum',
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 28),

                  // Kontak disusun horizontal menggunakan Row
                  const Center(
                    child: Text(
                      'TEMUKAN SAYA',
                      style: TextStyle(
                        color: mediumBrown,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildContact(Icons.email_outlined, 'Email'),
                      const SizedBox(width: 24),
                      buildContact(Icons.phone_outlined, 'Telepon'),
                      const SizedBox(width: 24),
                      buildContact(Icons.code, 'GitHub'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Foto profil dan badge menggunakan Stack + Positioned
  Widget buildProfilePhoto() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: lightBrown,
              width: 3,
            ),
          ),
          child: const CircleAvatar(
            radius: 72,
            backgroundColor: lightBrown,
            backgroundImage: NetworkImage(
              'https://i.pravatar.cc/300?img=12',
            ),
          ),
        ),
        Positioned(
          bottom: 8,
          right: -8,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 7,
            ),
            decoration: BoxDecoration(
              color: darkBrown,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
            child: const Text(
              'Available',
              style: TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Nama dan jabatan/prodi
  Widget buildProfileInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'HALO, SAYA',
          style: TextStyle(
            color: mediumBrown,
            fontSize: 13,
            letterSpacing: 3,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Nukhi Alvin Rahmahdani',
          style: TextStyle(
            color: darkBrown,
            fontSize: 27,
            height: 1.25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: cream,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            'Mahasiswa Sistem Informasi',
            style: TextStyle(
              color: mediumBrown,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ),
        const SizedBox(height: 14),
        const Text(
          'Mahasiswa semester 5 | Universitas '
              'Pesantren Tinggi Darul Ulum',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 14,
            height: 1.7,
          ),
        ),
      ],
    );
  }

  // Ikon kontak
  Widget buildContact(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: darkBrown,
            borderRadius: BorderRadius.circular(17),
          ),
          child: Icon(
            icon,
            color: cream,
            size: 24,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: darkBrown,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

// Widget informasi pribadi
class InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: mediumBrown,
          size: 22,
        ),
        const SizedBox(width: 12),
        SizedBox(
          width: 105,
          child: Text(
            label,
            style: const TextStyle(
              color: mediumBrown,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const Text(
          ': ',
          style: TextStyle(color: darkBrown),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              color: darkBrown,
              fontSize: 13,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
