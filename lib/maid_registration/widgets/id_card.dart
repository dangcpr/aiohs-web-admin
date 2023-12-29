import 'package:flutter/material.dart';

class IDCard extends StatefulWidget {
  const IDCard(
      {super.key,
      required this.identity_front_image_url,
      required this.identity_back_image_url});

  final String identity_front_image_url;
  final String identity_back_image_url;

  @override
  State<IDCard> createState() => _IDCardState();
}

class _IDCardState extends State<IDCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: Image.network(widget.identity_front_image_url),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Image.network(widget.identity_back_image_url),
          ),
        ],
      ),
    );
  }
}
