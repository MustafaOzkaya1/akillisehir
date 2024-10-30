import 'package:akillisehir/controllers/variables/variables.dart';
import 'package:akillisehir/models/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectedIndex = 0;
  final PageController pageController = PageController();

  // Görsellerin yollarını liste olarak tanımlayın
  final List<String> imagePaths = [
    'images/icon1.png',
    'images/icon2.png',
    'images/icon2.png',
    'images/icon2.png',
    'images/icon2.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: DrawerButton(
            color: acikRenkBeyaz2,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_outlined, color: acikRenkBeyaz2),
          ),
        ],
        title: Text(
          "AKILLI İZMİR",
          style: appBarTextStyle,
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[ortaMavi, renkTurkuaz],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.message),
              title: const Text('Messages'),
              onTap: () {
                setState(() {
                  selectedPage = 'Messages';
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Profile'),
              onTap: () {
                setState(() {
                  selectedPage = 'Profile';
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                setState(() {
                  selectedPage = 'Settings';
                });
              },
            ),
          ],
        ),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          // İlk sayfa
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [ortaMavi, renkTurkuaz]),
            ),
            child: Column(
              children: [
                Padding(
                  padding: edgeInsetsRow,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: edgeInsetsCard,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white70, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: _SampleCard(
                            cardName: 'Elevated Card',
                            cardColor: "amber",
                          ),
                        ),
                      ),
                      Padding(
                        padding: edgeInsetsCard,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white70, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: _SampleCard(
                            cardName: 'Elevated Card',
                            cardColor: "purple",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: edgeInsetsCard,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white70, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: _SampleCard(
                          cardName: 'Elevated Card',
                          cardColor: "red",
                        ),
                      ),
                    ),
                    Padding(
                      padding: edgeInsetsCard,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white70, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: _SampleCard(
                          cardName: 'Elevated Card',
                          cardColor: "blue",
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: edgeInsetsCard,
                      child: Card(
                        child: Column(
                          children: [
                            Container(
                              width: 350,
                              height: 150,
                              child: Center(child: Text("d")),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16), // Yukarıdan biraz boşluk bırak
                Container(
                  height: 100, // ListView için sabit yükseklik ayarla
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imagePaths.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.orangeAccent, // Arka plan rengi
                          child: ClipOval(
                            child: Image.asset(
                              imagePaths[index],
                              fit: BoxFit.cover,
                              width: 80,
                              height: 80,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          // İkinci sayfa
          Center(child: Text("İkinci Sayfa İçeriği")),
        ],
      ),
      bottomNavigationBar: SlidingClippedNavBar.colorful(
        backgroundColor: Colors.white,
        onButtonPressed: (index) {
          setState(() {
            selectedIndex = index;
          });
          pageController.animateToPage(selectedIndex,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOutQuad);
        },
        iconSize: 30,
        selectedIndex: selectedIndex,
        barItems: [
          BarItem(
            icon: Icons.home_outlined,
            title: 'Anasayfa',
            activeColor: ortaMavi,
            inactiveColor: ortaMavi,
          ),
          BarItem(
            icon: Icons.search_rounded,
            title: 'Search',
            activeColor: Colors.red,
            inactiveColor: Colors.green,
          ),
          BarItem(
            icon: Icons.search_rounded,
            title: 'Search',
            activeColor: Colors.red,
            inactiveColor: Colors.green,
          ),
          BarItem(
            icon: Icons.search_rounded,
            title: 'Search',
            activeColor: Colors.red,
            inactiveColor: Colors.green,
          ),
          // Eğer daha fazla BarItem eklemek isterseniz buraya ekleyin
        ],
      ),
    );
  }
}

class _SampleCard extends StatelessWidget {
  const _SampleCard({required this.cardName, required this.cardColor});
  final String cardName;
  final String cardColor;

  Color _getColorFromName(String colorName) {
    Map<String, Color> colorMap = {
      "red": const Color.fromARGB(255, 255, 133, 124),
      "green": Colors.green,
      "blue": const Color.fromARGB(255, 100, 180, 246),
      "amber": const Color.fromARGB(255, 255, 218, 106),
      "purple": const Color.fromARGB(255, 217, 104, 237),
      "teal": Colors.teal,
      "orange": Colors.orange,
      // İstediğiniz kadar renk ekleyebilirsiniz
    };
    return colorMap[colorName.toLowerCase()] ?? Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: _getColorFromName(cardColor),
          ),
          width: 160,
          height: 150,
          child: Center(
            child: Text(
              cardName,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
