import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<String> newReleases = [
      'assets/image1.jpeg',
      'assets/image2.jpeg',
      'assets/image4.jpeg',
    ];
    List<String> mostPopular = [
      'assets/image3.jpg',
      'assets/image5.jpeg',
      'assets/image1.jpeg',
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(color: const Color(0xff121212), borderRadius: BorderRadius.circular(20)),
                child: TextFormField(
                  controller: searchController,
                  decoration: const InputDecoration(
                    hintText: 'What are you searching for?',
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "New Releases",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "View all",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 200,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(newReleases.length, (index) => WorkoutCard(image: newReleases[index]))),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Most popular",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "View all",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                    children: List.generate(mostPopular.length, (index) => WorkoutCard(image: mostPopular[index]))),
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Discover'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Saved'),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: 'Studio'),
        ],
      ),
    );
  }
}

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 200,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}
