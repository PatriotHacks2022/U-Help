import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:swipe_shop_flutter/custom_components/custom_scroll_product_card.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:swipe_shop_flutter/data_classes/product_data.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<ProductData> imageList = [];


  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 49,
        actions: [
          IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: const Icon(
              Icons.add,
              size: 36,
              color: Colors.red,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding:
          const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          child: Column(
            children: [
              Expanded(
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  itemCount: imageList.length,
                  itemBuilder: (context, index) => CustomScrollProductCard(
                    productData: imageList[index],
                  ),
                  staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
