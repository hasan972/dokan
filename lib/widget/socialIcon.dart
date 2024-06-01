import 'package:dokan/widget/my_colors.dart';
import 'package:flutter/material.dart';

class SocialIcon extends StatelessWidget {
  final ImageProvider image;
  const SocialIcon({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), 
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10), 
        child: Container(
          color: MyColors().white,
          padding: const EdgeInsets.all(7),
          height: 60,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(image: image),
          ),
        ),
      ),
    );
  }
}
