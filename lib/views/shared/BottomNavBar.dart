import 'package:flutter/material.dart';
import 'package:quicknotes/views/shared/bottom_nav_widget.dart';


class BottomNavBar extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  const BottomNavBar({Key? key, required this.navigatorKey}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 40,40,75),
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomNavWidget(
                  onTap: (){
                    widget.navigatorKey.currentState!.pushReplacementNamed('/home');
                  },
                  icon:Icons.home,
                ),
                BottomNavWidget(
                  onTap: (){
                    widget.navigatorKey.currentState!.pushReplacementNamed('/trash');
                  },
                  icon: Icons.favorite,
                ),
                BottomNavWidget(
                  onTap: (){
                    widget.navigatorKey.currentState!.pushReplacementNamed('/settings');
                  },
                  icon: Icons.settings,
                ),
              ],
            ),
                            
          ),
        )
    );
  }
}
