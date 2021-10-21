import 'package:event_app/models/core/event.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final Event event;
  const EventCard({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    String imagePath = "assets/images/event.png";

    switch (event.eventTheme) {
      case "Birthday":
        imagePath = "assets/images/cake.png";
        break;
      case "Love":
        imagePath = "assets/images/love.png";
        break;
      case "Celebration":
        imagePath = "assets/images/celebration.png";
        break;
      case "Education":
        imagePath = "assets/images/education.png";
        break;
      case "Others":
        imagePath = "assets/images/event.png";
        break;
    }

    return SizedBox(
      height: 140,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.all(15),
              height: 140,
              child: Image.asset(
                imagePath,
                width: 100,
                height: 100,
                fit: BoxFit.scaleDown,
                scale: 0.6,
              ),
            ),
          ),
          Positioned(
            right: 40,
            child: SizedBox(
              height: 120,
              width: size.width - 200,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.eventName,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      event.eventDateTime,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
