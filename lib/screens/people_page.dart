import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:swipe_shop_flutter/custom_components/custom_scroll_product_card.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:swipe_shop_flutter/data_classes/product_data.dart';

class ScrollPage extends StatefulWidget {
  const ScrollPage({Key? key}) : super(key: key);

  @override
  _ScrollPageState createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage> {
  ScrollController _controller = ScrollController();
  bool _showAppbar = true;
  bool isScrollingDown = false;


  List<ProductData> imageList = [
    ProductData(
        id: 'id-001',
        imageUrl: 'https://picsum.photos/seed/image006/500/500',
        title: "Boujee watch",
        price: "100",
        description: "A cool watch",
        location: "Alexandria, VA"),
    ProductData(
        id: 'id-002',
        imageUrl: 'https://picsum.photos/seed/image003/500/800',
        title: "Cool thing",
        price: "100",
        description: "Amaazing car window!",
        location: "Fairfax, VA"),
    ProductData(
        id: 'id-003',
        imageUrl: 'https://picsum.photos/seed/image005/500/500',
        title: "Free virtual land!",
        price: "100",
        description: "Something else",
        location: "France"),
    ProductData(
        id: 'id-001',
        imageUrl: 'https://picsum.photos/seed/image002/500/500',
        title: "Boujee watch",
        price: "100",
        description: "A cool watch",
        location: "Alexandria, VA"),
    ProductData(
        id: 'id-002',
        imageUrl: 'https://picsum.photos/seed/image003/500/800',
        title: "Cool thing",
        price: "100",
        description: "Amaazing car window!",
        location: "Fairfax, VA"),
    ProductData(
        id: 'id-003',
        imageUrl: 'https://picsum.photos/seed/image005/500/500',
        title: "Free virtual land!",
        price: "100",
        description: "Something else",
        location: "France"),
    ProductData(
        id: 'id-001',
        imageUrl: 'https://picsum.photos/seed/image002/500/500',
        title: "Boujee watch",
        price: "100",
        description: "A cool watch",
        location: "Alexandria, VA"),
    ProductData(
        id: 'id-002',
        imageUrl: 'https://picsum.photos/seed/image003/500/800',
        title: "Cool thing",
        price: "100",
        description: "Amaazing car window!",
        location: "Fairfax, VA"),
    ProductData(
        id: 'id-003',
        imageUrl: 'https://i.imgur.com/9h66HBP.png',
        title: "Free virtual land!",
        price: "100",
        description: "Something else",
        location: "France"),
    ProductData(
        id: 'id-001',
        imageUrl: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
        title: "Boujee watch",
        price: "100",
        description: "A cool watch",
        location: "Alexandria, VA"),
    ProductData(
        id: 'id-002',
        imageUrl: 'https://picsum.photos/seed/image003/500/800',
        title: "Cool thing",
        price: "100",
        description: "Amaazing car window!",
        location: "Fairfax, VA"),
    ProductData(
        id: 'id-003',
        imageUrl: 'https://picsum.photos/seed/image005/500/500',
        title: "Free virtual land!",
        price: "100",
        description: "Something else",
        location: "France"),
  ];

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScrollEvent);
  }

  @override
  void dispose() {
    _controller.removeListener(_onScrollEvent);
    super.dispose();
  }

  void _onScrollEvent() {
    if (_controller.position.userScrollDirection == ScrollDirection.reverse) {
      if (!isScrollingDown) {
        isScrollingDown = true;
        _showAppbar = false;
        setState(() {});
      }
    }

    if (_controller.position.userScrollDirection == ScrollDirection.forward) {
      if (isScrollingDown) {
        isScrollingDown = false;
        _showAppbar = true;
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    bool _isScrolling = false;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          child: Column(
            children: [
              AnimatedContainer(
                height: _showAppbar ? 92 : 0,
                duration: const Duration(milliseconds: 200),
                child: AppBar(
                elevation: .5,
                toolbarHeight: 92,
                backgroundColor: isDarkMode ? Colors.black : Colors.white,
                title: Column(
                  children: [
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Shopping App",
                        style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      height: 38,
                      decoration: BoxDecoration(
                        color: isDarkMode ? const Color(0xff2a2a2a) : const Color(0xffededed),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: TextField(
                          style: TextStyle(
                              color: isDarkMode ? Colors.white : Colors.black
                          ),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            suffixIcon: IconButton(
                              splashColor: Colors.transparent,
                              icon: const Icon(
                                Icons.clear,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                /* Clear the search field */

                              },
                            ),
                            hintText: 'Search',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                  ],
                ),
              ),
              ),
              Expanded(
                child: StaggeredGridView.countBuilder(
                  controller: _controller,
                  crossAxisCount: 2,
                  itemCount: imageList.length,
                  itemBuilder: (context, index) => CustomScrollProductCard(
                    productData: imageList[index],
                  ),
                  staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
