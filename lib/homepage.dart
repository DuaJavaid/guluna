import 'package:flutter/material.dart';
import 'selection.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                const SizedBox(height: 10),
                _buildWelcomeText(),
                const SizedBox(height: 10),
                _buildSearchBar(context),
                const SizedBox(height: 15),
                _buildPromoBanner(context),
                const SizedBox(height: 20),
                _buildSectionTitle("Categories"),
                const SizedBox(height: 20),
                _buildCategoryList(),
                const SizedBox(height: 10),
                Center(child: ElevatedButton(onPressed: () {}, child: const Text("View all"))),
                const SizedBox(height: 20),
                _buildSectionTitle("Trendy Outfits"),
                const SizedBox(height: 20),
                _buildTrendyOutfitsGrid(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey,
      items: [
        _navBarItem(Icons.home, 'Home'),
        _navBarItem(Icons.favorite, 'Wishlist'),
        _cartNavBarItem(),
        _navBarItem(Icons.search, 'Search'),
        _navBarItem(Icons.settings, 'Setting'),
      ],
    );
  }

  BottomNavigationBarItem _navBarItem(IconData icon, String label) {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }

  BottomNavigationBarItem _cartNavBarItem() {
    return BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: const Icon(Icons.shopping_cart, color: Colors.black),
      ),
      label: 'Cart',
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Icon(Icons.menu),
        CircleAvatar(backgroundImage: AssetImage('assets/profile.jpg')),
      ],
    );
  }

  Widget _buildWelcomeText() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Welcome to Gulluna!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text("Where Tradition Meets Style!"),
      ],
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 7,
          child: SizedBox(
            height: 45,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search, color: Colors.black),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 3,
          child: SizedBox(
            height: 40,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
              ),
              child: const Text("Search", style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPromoBanner(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.pink.shade50,
          borderRadius: BorderRadius.circular(10),
        ),
        width: MediaQuery.of(context).size.width * 0.85,
        height: 170,
        child: Row(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset('assets/model.png', height: 160),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Super Sale\nDiscount 40%", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                ElevatedButton(onPressed: () {}, child: const Text("Get Now")),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildCategoryList() {
    final categories = [
      {"title": "Scarfs", "image": 'assets/scarf.jpeg'},
      {"title": "Winters", "image": 'assets/winter.png'},
      {"title": "Shawls", "image": 'assets/shawls.png'},
      {"title": "Summers", "image": 'assets/summers.png'},
      {"title": "Unstitched", "image": 'assets/unstitch.png'},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((cat) => _categoryItem(cat["title"]!, cat["image"]!)).toList(),
      ),
    );
  }

  Widget _categoryItem(String title, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            radius: 30,
            backgroundImage: AssetImage(imagePath),
          ),
          const SizedBox(height: 7),
          Text(title),
        ],
      ),
    );
  }

  Widget _buildTrendyOutfitsGrid(BuildContext context) {
    final images = [
      'assets/mahira.png',
      'assets/mahira2.png',
      'assets/mahira3.png',
      'assets/m4.png',
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 35,
        mainAxisSpacing: 35,
        childAspectRatio: 0.65,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) => _productItem(context, images, index),
    );
  }

  Widget _productItem(BuildContext context, List<String> images, int index) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: index == 1
                      ? () => Navigator.push(context, MaterialPageRoute(builder: (_) => const Selection()))
                      : null,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(images[index]),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Trendy Outfit ${index + 1}", style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.favorite_border, color: Colors.red),
                  onPressed: () {},
                ),
                PopupMenuButton<String>(
                  itemBuilder: (_) => [
                    const PopupMenuItem(value: 'add_to_cart', child: Text('Add to Cart')),
                    const PopupMenuItem(value: 'buy_now', child: Text('Buy It Now')),
                  ],
                  child: const Icon(Icons.more_vert),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
