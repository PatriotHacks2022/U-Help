import 'package:flutter/material.dart';

class CustomTopNavigationBar extends StatelessWidget {
  const CustomTopNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 49,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  iconSize: 32,
                  icon: const Icon(Icons.home),
                  onPressed: () {
                    print("pressed");
                  },
                ),
                IconButton(
                  iconSize: 32,
                  icon: const Icon(Icons.shopping_bag_rounded),
                  onPressed: () {},
                ),
                IconButton(
                  iconSize: 32,
                  icon: const Icon(Icons.add),
                  onPressed: () {},
                ),
                IconButton(
                  iconSize: 32,
                  icon: const Icon(Icons.send),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                stops: [
                  0.01,
                  0.2,
                  0.3,
                  0.4,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black12,
                  Colors.black12,
                  Colors.white10,
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
