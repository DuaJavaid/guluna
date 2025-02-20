import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
  selectedItemColor: Colors.red,
  unselectedItemColor: Colors.grey,
  items: [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: 'Wishlist',
    ),
    BottomNavigationBarItem(
      icon: Container(
        padding: EdgeInsets.all(15), // Increased padding for a bigger circle
        decoration: BoxDecoration(
          color: Colors.white, // Background color set to white
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Icon(
          Icons.shopping_cart,
          color: Colors.black, 
        ),
      ),
      label: 'Cart',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Search',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Setting',
    ),
  ],
),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0), // Even spacing on left and right
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // App Bar Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.menu),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/profile.jpg'),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  "Welcome to Gulluna!",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text("Where Tradition Meets Style!"),
                SizedBox(height: 10),

                // Search Bar with Button
                Row(
                  children: [
                    SizedBox(
                      height: 45,
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.search, color: Colors.black),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(90, 40),
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: Text(
                          "Search",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),

                // Promotional Section
               Center(
  child: Container(
    padding: EdgeInsets.all(16),
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
          child: Image.asset(
            'assets/model.png',
            height: 160,
          ),
        ),
        SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Super Sale\nDiscount 40%",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {},
              child: Text("Get Now"),
            ),
          ],
        ),
        // Positioned small circle on the right side
        Positioned(
          right: 10, 
          bottom: 10, 
          child: Container(
            width: 15, 
            height: 15, 
            decoration: BoxDecoration(
              color: Colors.pink.shade50, 
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2), 
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3), 
                ),
          
    
              ],
              
            ),
          ),
        ),
        Positioned(
          right: 13, 
          bottom: 15, 
          child: Container(
            width: 20, 
            height: 20, 
            decoration: BoxDecoration(
              color: Colors.pink.shade50, 
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2), 
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 2), 
                ),
          
    
              ],
              
            ),
          ),
        ),
      ],
    ),
  ),
),
SizedBox(height: 20),

                // Categories Section
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Categories",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),

                // Categories Row
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _categoryItem("Scarfs", 'assets/scarf.jpeg'),
                      _categoryItem("Winters", 'assets/winter.png'),
                      _categoryItem("Shawls", 'assets/shawls.png'),
                      _categoryItem("Summers", 'assets/summers.png'),
                      _categoryItem("Unstitched", 'assets/unstitch.png'),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("View all"),
                ),
                SizedBox(height: 20),

                // Trendy Outfit Section
                Text(
                  "Trendy Outfits",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),

                // Grid for Trendy Outfits
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, 
                    crossAxisSpacing: 35, 
                    mainAxisSpacing: 35,
                    childAspectRatio: 0.65, 
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return _productItem(index);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Category Item Widget
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
          SizedBox(height: 7),
          Text(title),
        ],
      ),
    );
  }

  // Product Item Widget with Wishlist & Three-Dot Menu
  Widget _productItem(int index) {
    List<String> images = [
      'assets/mahira.JPG',
      'assets/mahira2.jpeg',
      'assets/mahira3.jpeg',
      'assets/mahira4.jpeg',
    ];

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(images[index]),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Trendy Outfit $index", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          Positioned(
            top: 8,
            left: 140, 
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.favorite_border, color: Colors.red),
                  onPressed: () {},
                ),
                PopupMenuButton<String>(
                  itemBuilder: (context) => [
                    PopupMenuItem(value: 'add_to_cart', child: Text('Add to Cart')),
                    PopupMenuItem(value: 'buy_now', child: Text('Buy It Now')),
                  ],
                  child: Icon(Icons.more_vert),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
