import 'package:agricrops/constants/color_constant.dart';
import 'package:agricrops/models/cart/cart.dart';
import 'package:agricrops/providers/auth_provider.dart';
import 'package:agricrops/providers/cart_provider.dart';
import 'package:agricrops/screens/cart/cart_list.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartBadgeCounter extends StatelessWidget {
  final bool useChip;
  const CartBadgeCounter({
    Key? key,
    this.useChip = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final cartProvider = context.watch<CartProvider>();

    return StreamBuilder<List<Cart>>(
      stream: cartProvider.getUserCartItems(authProvider.user!.uid),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          int itemCount = snapshot.data!.length;

          return useChip
              ? Chip(
                  label: Text(
                    '$itemCount',
                    style: const TextStyle(color: kWhite),
                  ),
                  backgroundColor: kRed,
                )
              : Badge(
                  badgeContent: SizedBox(
                    width: 15,
                    height: 15,
                    child: Center(
                        child: Text(
                      '$itemCount',
                      style: const TextStyle(
                        color: kWhite,
                      ),
                    )),
                  ),
                  child: IconButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const CartListScreen()),
                    ),
                    icon: const Icon(Icons.shopping_cart),
                  ),
                );
        }

        return Container();
      },
    );
  }
}
