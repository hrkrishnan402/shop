import 'package:flutter/material.dart';

class BookigOfferCard extends StatelessWidget {
  const BookigOfferCard(
      {super.key,
      required this.description,
      required this.icon,
      required this.title});

  final String title;
  final String description;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 138,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text(title), const Icon(Icons.arrow_forward_ios)],
              ),
              Row(
                children: [
                  Icon(
                    icon,
                    size: 30,
                  ),
                  Text(description)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
