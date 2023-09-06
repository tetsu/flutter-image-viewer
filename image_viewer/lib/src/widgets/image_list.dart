import 'package:flutter/material.dart';
import '../models/image_model.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;

  ImageList(this.images);

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, int index) {
        // return Text(images[index].url);
        // return Image.network(images[index].url);
        return buildImage(images[index]);
      },
    );
  }

  Widget buildImage(ImageModel image) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.all(20.0),
      // child: Image.network(image.url + ".png"),
      child: SelectableText(image.url + ".png"),
    );
  }
}
