import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:swipe_shop_flutter/data_classes/person_data.dart';
import 'package:swipe_shop_flutter/screens/landing_page.dart';
import 'package:swipe_shop_flutter/screens/note_page.dart';
import 'package:swipe_shop_flutter/screens/profile_page.dart';
import 'package:swipe_shop_flutter/screens/request_page.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      body: Padding( padding: EdgeInsets.all(35),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Add your Profile Image",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(child: Container()),
            Expanded(child: Container()),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red.withOpacity(0.2),
                shadowColor: Colors.transparent,
                // makes buttons round.
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                // makes button height 50 and matches width
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {},
              child: const Text(
                'Upload',
                style: TextStyle(fontSize: 16, color: Colors.red),
              ),
            ),
            const SizedBox(height: 35),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red.withOpacity(0.2),
                shadowColor: Colors.transparent,
                // makes buttons round.
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                // makes button height 50 and matches width
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const RequestPage()
                ),
              ),
              child: const Text(
                'Next',
                style: TextStyle(fontSize: 16, color: Colors.red),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
