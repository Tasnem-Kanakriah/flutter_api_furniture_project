import 'package:flutter/material.dart';

class OnBardingPage extends StatelessWidget {
  const OnBardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            foregroundDecoration: const BoxDecoration(
              color: Color(0x67111111),
            ),
            height: 570,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://i.pinimg.com/564x/89/7b/41/897b4120aa90a57e70cea616527f664c.jpg'))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 30, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Enjoy Your Online\nShopping',
                  style: TextStyle(
                      height: 1.2,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff424f36)),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Browser through all categories and shop the best furniture for your dream house',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF3E463C)),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  alignment: Alignment.center,
                  width: 360,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xff87644c),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                // FilledButton(
                //   onPressed: () {
                //     Navigator.push(context,
                //         MaterialPageRoute(builder: (context) {
                //       return const BottomBar();
                //     }));
                //   },
                //   style: FilledButton.styleFrom(
                //       // alignment: Alignment.center,
                //       backgroundColor: const Color(0xff87644c)),
                //   child: const SizedBox(
                //     width: 360,
                //     height: 50,
                //     child: Text(
                //       'Get Started',
                //       style: TextStyle(
                //           color: Colors.white,
                //           fontSize: 18,
                //           fontWeight: FontWeight.w500),
                //     ),
                //   ),
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}
