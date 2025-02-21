import 'package:flutter/material.dart';

class Selection extends StatefulWidget {
  const Selection({super.key});

  @override
  _SelectionState createState() => _SelectionState();
}

class _SelectionState extends State<Selection> {
  String _selectedImage = 'assets/rb m2.png'; // Initial big image

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Wishlist'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Row with Back Arrow and Profile
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context); // 🔙 Navigates back to home
                    },
                  ),
                  const CircleAvatar(
                    radius: 16,
                    backgroundImage: AssetImage('assets/profile.jpg'), // Replace with actual asset
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Big Image with Darker Overlay
              Stack(
                children: [
                  Container(
                    height: 400,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.10), // Dark overlay
                          BlendMode.darken,
                        ),
                        child: Image.asset(
                          _selectedImage, // 🖼️ Updates when thumbnail clicked
                          width: double.infinity,
                          height: 400,
                          fit: BoxFit.cover,
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: IconButton(
                      icon: const Icon(Icons.favorite_border, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('🖤 Fabric: Premium Silk'),
                          Text('🎨 Color: Red & Black'),
                          Text('🎉 Occasion: Festive, Wedding, Party'),
                          Text('✨ Features: Soft Texture, Traditional Weaving'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Product Title and Price
              const Text(
                'Red & Black Silk',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              const Text(
                'Rs 20,000',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(height: 16),

              // Thumbnails Row (Click to change big image)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildThumbnail('assets/m3.png'),
                  _buildThumbnail('assets/mahira2.png'),
                  _buildThumbnail('assets/m4.png'),
                ],
              ),
              const SizedBox(height: 24),

              // Add To Cart Button
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    backgroundColor: Colors.black.withOpacity(0.9),
                    minimumSize: const Size(400, 50),
                  ),
                  child: const Text('Add To Cart', style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
              const SizedBox(height: 12),

              // Buy It Now Button
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    backgroundColor: Colors.black87,
                    minimumSize: const Size(400, 50),
                  ),
                  child: const Text('Buy It Now', style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Thumbnail widget: Clickable to update big image
  Widget _buildThumbnail(String imagePath) {
    final isSelected = _selectedImage == imagePath; // Highlight selected thumbnail

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedImage = imagePath; // 🖼️ Change big image
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.red : Colors.black, // Highlight border for selected image
            width: isSelected ? 3 : 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePath,
            width: 70,
            height: 90,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
