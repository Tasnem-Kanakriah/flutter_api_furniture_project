import 'package:flutter/material.dart';

class BasicInterface extends StatelessWidget {
  const BasicInterface({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          foregroundDecoration:
              const BoxDecoration(color: Color(0x9E000000)),
          decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://i.pinimg.com/564x/e5/72/3a/e5723a485ece2599080fc5fdbdf2c9de.jpg')),
          ),
          child: Center(
            child: Container(
              width: 300,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage('assets/images/furniture_logo.png'))),
            ),
          )),
    );
  }
}
