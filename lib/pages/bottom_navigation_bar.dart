import 'package:flutter/material.dart';
import 'package:furniture/pages/cart_page.dart';
import 'package:furniture/pages/favorite_page.dart';
import 'package:furniture/pages/home_page.dart';
import 'package:furniture/pages/notification_page.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int newSelectedIndex = 0;

  List<Widget> pages = [
    const HomePage(),
    const FavoritePage(),
    const CartPage(),
    const NotificationPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          navigationBarTheme: NavigationBarThemeData(
            labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.selected)) {
                  return const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff8c795f),
                  );
                }
                return const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                );
              },
            ),
          ),
        ),
        child: NavigationBar(
          destinations: [
            NavigationDestination(
              icon: newSelectedIndex == 0
                  ? const Icon(
                      Icons.home,
                      size: 28,
                      color: Color(0xff8c795f),
                    )
                  : const Icon(
                      Icons.home_outlined,
                      size: 28,
                    ),
              label: 'Home',
            ),
            NavigationDestination(
              icon: newSelectedIndex == 1
                  ? const Icon(
                      Icons.favorite,
                      color: Color(0xff8c795f),
                    )
                  : const Icon(Icons.favorite_border_outlined),
              label: 'Favorite',
            ),
            NavigationDestination(
              icon: newSelectedIndex == 2
                  ? const Icon(
                      Icons.shopping_cart,
                      color: Color(0xff8c795f),
                    )
                  : const Icon(Icons.shopping_cart_outlined),
              label: 'Cart',
            ),
            NavigationDestination(
              icon: newSelectedIndex == 3
                  ? const Icon(
                      Icons.mark_chat_unread,
                      size: 22,
                      color: Color(0xff8c795f),
                    )
                  : const Icon(
                      Icons.mark_chat_unread_outlined,
                      size: 22,
                    ),
              label: 'Notification',
            ),
          ],
          selectedIndex: newSelectedIndex,
          onDestinationSelected: (index) {
            setState(() {
              newSelectedIndex = index;
            });
          },
          backgroundColor: Colors.white,
          indicatorColor: Colors.white,
          indicatorShape: const CircleBorder(),
        ),
      ),
      body: pages[newSelectedIndex],
    );
  }
}
