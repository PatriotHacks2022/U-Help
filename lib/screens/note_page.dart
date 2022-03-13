import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:swipe_shop_flutter/screens/image_page.dart';

class NotePage extends StatefulWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {

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
          "Add a note",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Expanded(child: Container()),
      TextField(
        maxLines: 10,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Add your note',
        ),
      ),
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
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ImagePage(),
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
