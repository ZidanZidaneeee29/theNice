import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Variable to track which content to display
  bool showWahana = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'SELAMAT DATANG 👋',
          style: TextStyle(color: Colors.green, fontSize: 20),
        ),
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage('lib/assets/images/user_profile.png'), // Profile image
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Explore the nice',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 8),
          _LocationSearchBar(),
          const SizedBox(height: 16),

          // Toggle Buttons for Wahana and Food Court
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _TabButton(
                label: 'Wahana',
                isSelected: showWahana,
                onTap: () {
                  setState(() {
                    showWahana = true; // Show Wahana content
                  });
                },
              ),
              const SizedBox(width: 16),
              _TabButton(
                label: 'Food Court',
                isSelected: !showWahana,
                onTap: () {
                  setState(() {
                    showWahana = false; // Show Food Court content
                  });
                },
              ),
            ],
          ),

          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Rekomendasi Untuk Kamu',
              style: TextStyle(fontSize: 16, color: Colors.green),
            ),
          ),

          // Dynamic Content
          Expanded(
            child: showWahana ? _buildWahanaContent() : _buildFoodCourtContent(),
          ),
        ],
      ),
    );
  }

  // Build Wahana Content
  Widget _buildWahanaContent() {
    return ListView(
      children: [
        _RecommendationCard(
          title: 'Rainbow Slide',
          imageUrl: 'lib/assets/images/rainbow.jpg',
          rating: 5.0,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(
                  title: 'Rainbow Slide',
                  imageUrl: 'lib/assets/images/rainbow.jpg',
                  description: 'Rainbow Slide di The Nice Fantastic Park Cianjur adalah wahana seru sepanjang 120 meter yang cocok untuk semua usia. Menawarkan pengalaman meluncur di atas seluncuran berwarna-warni dengan pemandangan yang indah.',
                ),
              ),
            );
          },
        ),
        _RecommendationCard(
          title: 'Taman Bermain',
          imageUrl: 'lib/assets/images/playground.jpg',
          rating: 4.8,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(
                  title: 'Playground',
                  imageUrl: 'lib/assets/images/playground.jpg',
                  description: 'Kolam Arus menawarkan pengalaman berenang santai dengan aliran air yang menenangkan. Cocok untuk keluarga dan anak-anak.',
                ),
              ),
            );
          },
        ),
        _RecommendationCard(
          title: 'Kolam Arus',
          imageUrl: 'lib/assets/images/kolam_arus.jpg',
          rating: 4.9,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(
                  title: 'Kolam Arus',
                  imageUrl: 'lib/assets/images/kolam_arus.jpg',
                  description: 'Kolam Arus menawarkan pengalaman berenang santai dengan aliran air yang menenangkan. Cocok untuk keluarga dan anak-anak.',
                ),
              ),
            );
          },
        ),
        _RecommendationCard(
          title: 'Kereta Mini',
          imageUrl: 'lib/assets/images/kereta_mini.jpg',
          rating: 4.7,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(
                  title: 'Kereta Mini',
                  imageUrl: 'lib/assets/images/kereta_mini.jpg',
                  description: 'Kereta Mini adalah wahana ramah anak yang memungkinkan si kecil menikmati perjalanan menyenangkan keliling taman.',
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  // Build Food Court Content
  Widget _buildFoodCourtContent() {
    return ListView(
      children: [
        _RecommendationCard(
          title: 'Kedai Makmur',
          imageUrl: 'lib/assets/images/foodcourt1.jpg',
          rating: 5.0,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MenuScreen(
                  title: 'Kedai Makmur',
                  imageUrl: 'lib/assets/images/foodcourt1.jpg',
                  menuItems: [
                    {'name': 'Rice Bowl', 'price': 'Rp.25.000', 'image': 'lib/assets/images/rice_bowl.jpg'},
                    {'name': 'Nasi Goreng', 'price': 'Rp.20.000', 'image': 'lib/assets/images/nasi_goreng.jpg'},
                    {'name': 'Nasi Kucing', 'price': 'Rp.20.000', 'image': 'lib/assets/images/nasi_goreng.jpg'},
                    {'name': 'Mie Gacoan', 'price': 'Rp.20.000', 'image': 'lib/assets/images/nasi_goreng.jpg'},
                    {'name': 'Wizmie', 'price': 'Rp.20.000', 'image': 'lib/assets/images/nasi_goreng.jpg'},
                    {'name': 'Nasi Liwet', 'price': 'Rp.20.000', 'image': 'lib/assets/images/nasi_goreng.jpg'},
                  ],
                ),
              ),
            );
          },
        ),
        _RecommendationCard(
          title: 'Bakso Bengawan',
          imageUrl: 'lib/assets/images/foodcourt2.jpg',
          rating: 4.7,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MenuScreen(
                  title: 'Bakso Bengawan',
                  imageUrl: 'lib/assets/images/foodcourt2.jpg',
                  menuItems: [
                    {'name': 'Sate Ayam', 'price': 'Rp.30.000', 'image': 'lib/assets/images/sate_ayam.jpg'},
                    {'name': 'Sate Kambing', 'price': 'Rp.50.000', 'image': 'lib/assets/images/sate_kambing.jpg'},
                  ],
                ),
              ),
            );
          },
        ),
        _RecommendationCard(
          title: 'Warung Sate',
          imageUrl: 'lib/assets/images/sate.jpg',
          rating: 4.9,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MenuScreen(
                  title: 'Warung Sate',
                  imageUrl: 'lib/assets/images/sate.jpg',
                  menuItems: [
                    {'name': 'Sate Ayam', 'price': 'Rp.30.000', 'image': 'lib/assets/images/sate_ayam.jpg'},
                    {'name': 'Sate Kambing', 'price': 'Rp.50.000', 'image': 'lib/assets/images/sate_kambing.jpg'},
                  ],
                ),
              ),
            );
          },
        ),
        _RecommendationCard(
          title: 'Kopi Nusantara',
          imageUrl: 'lib/assets/images/kopi.jpg',
          rating: 4.8,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MenuScreen(
                  title: 'Kopi Nusantara',
                  imageUrl: 'lib/assets/images/kopi.jpg',
                  menuItems: [
                    {'name': 'Kopi Tubruk', 'price': 'Rp.15.000', 'image': 'lib/assets/images/kopi_tubruk.jpg'},
                    {'name': 'Kopi Latte', 'price': 'Rp.25.000', 'image': 'lib/assets/images/kopi_latte.jpg'},
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _TabButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _TabButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _LocationSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search, color: Colors.green),
          hintText: 'Pencarian Lokasi',
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

class _RecommendationCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final double rating;
  final VoidCallback onTap;

  const _RecommendationCard({
    required this.title,
    required this.imageUrl,
    required this.rating,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.6),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Image.asset(
                imageUrl,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 18),
                      Text(
                        '$rating',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;

  const DetailScreen({
    required this.title,
    required this.imageUrl,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.green),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuScreen extends StatelessWidget {
  final String title;
  final String imageUrl;
  final List<Map<String, String>> menuItems;

  const MenuScreen({
    required this.title,
    required this.imageUrl,
    required this.menuItems,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.green),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          title,
          style: const TextStyle(color: Colors.green),
        ),
      ),
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: ListView(
              children: menuItems.map((menu) => _MenuItemCard(
                    name: menu['name']!,
                    price: menu['price']!,
                    image: menu['image']!,
                  )).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuItemCard extends StatelessWidget {
  final String name;
  final String price;
  final String image;

  const _MenuItemCard({
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: Image.asset(image, width: 50, height: 50, fit: BoxFit.cover),
        title: Text(name, style: const TextStyle(fontSize: 16)),
        subtitle: Text(price, style: const TextStyle(color: Colors.green)),
      ),
    );
  }
}