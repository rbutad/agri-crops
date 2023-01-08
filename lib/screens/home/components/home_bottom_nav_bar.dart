import 'package:agricrops/constants/color_constant.dart';
import 'package:flutter/material.dart';

class HomeBottomNavBarComponent extends StatelessWidget {
  const HomeBottomNavBarComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: Container(
        height: 90,
        padding: const EdgeInsets.only(top: 20, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox.fromSize(
              size: const Size(68, 68),
              child: ClipOval(
                child: Material(
                  child: InkWell(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.home,
                          color: kGreen,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                            color: kGreen,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
              ),
            ),
            SizedBox.fromSize(
              size: const Size(68, 68),
              child: ClipOval(
                child: Material(
                  child: InkWell(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.favorite,
                          color: kGreen,
                        ),
                        Text(
                          'Favorites',
                          style: TextStyle(
                            color: kGreen,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
              ),
            ),
            SizedBox.fromSize(
              size: const Size(68, 68),
              child: ClipOval(
                child: Material(
                  child: InkWell(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.shopping_cart,
                          color: kGreen,
                        ),
                        Text(
                          'Cart',
                          style: TextStyle(
                            color: kGreen,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
