import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:convert';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GalleryScreen extends StatefulWidget {
  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  List<String> imageUrls = [];
  List<String> characterNames = [
    // Add the names of the characters corresponding to the images
    'Itachi',
    'Itachi',
    'Itachi',
    'Jiraiya',
    'Itachi',
    'Itachi'
  ];

  @override
  void initState() {
    super.initState();
    fetchAssetImages();
  }

  Future<void> fetchAssetImages() async {
    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    final manifestMap = json.decode(manifestContent) as Map<String, dynamic>;

    final imagePaths = manifestMap.keys
        .where((String key) => key.contains('assets/images/'))
        .toList();

    setState(() {
      imageUrls = imagePaths;
    });
  }

  void _downloadImage(String imageUrl) async {
    try {
      final html.AnchorElement anchor = html.AnchorElement(href: imageUrl);
      anchor.download = 'image.jpg';
      anchor.click();
    } catch (e) {
      print('Error downloading image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: imageUrls.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemBuilder: (context, index) {
        final imagePath = imageUrls[index];
        final imageName = imagePath.split('/').last.split('.').first;

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FullImageScreen(imageUrl: imagePath),
              ),
            );
          },
          child: GridTile(
            child: Hero(
              tag: imagePath,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            footer: GridTileBar(
              backgroundColor: Colors.black54,
              title: Text(
                imageName,
                textAlign: TextAlign.center,
              ),
              trailing: IconButton(
                icon: Icon(Icons.download),
                onPressed: () {
                  _downloadImage(imagePath);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class FullImageScreen extends StatelessWidget {
  final String imageUrl;

  const FullImageScreen({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Full Image'),
      ),
      body: Center(
        child: Hero(
          tag: imageUrl,
          child: Image.asset(
            imageUrl,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
