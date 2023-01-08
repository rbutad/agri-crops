import 'package:agricrops/constants/app_constant.dart';
import 'package:agricrops/constants/color_constant.dart';
import 'package:agricrops/constants/global_message_constant.dart';
import 'package:agricrops/models/cart/cart.dart';
import 'package:agricrops/models/orders/order/order.dart';
import 'package:agricrops/models/orders/order_item/order_item.dart';
import 'package:agricrops/providers/auth_provider.dart';
import 'package:agricrops/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({Key? key}) : super(key: key);

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  @override
  Widget build(BuildContext context) {
    late List<Cart> _cartItems = [];
    final Size size = MediaQuery.of(context).size;

    final cartProvider = context.watch<CartProvider>();
    final authProvider = context.watch<AuthProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: StreamBuilder<List<Cart>>(
        stream: cartProvider.getUserCartItems(authProvider.user!.uid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text(snapshotListHasError),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(noItemsOnCartMessage),
            );
          }

          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final cartItem = snapshot.data![index];
              _cartItems.add(cartItem);

              return Card(
                elevation: kDefaultElevation,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: kDefaultPadding,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: ClipOval(
                          child: cartItem.cropImageUrl.isEmpty
                              ? Image.asset(
                                  kDefaultAssetImage,
                                  fit: BoxFit.cover,
                                  width: size.width,
                                  height: size.height,
                                )
                              : FadeInImage.assetNetwork(
                                  placeholder: kDefaultAssetImage,
                                  image: cartItem.cropImageUrl,
                                  fit: BoxFit.cover,
                                  width: size.width,
                                  height: size.height,
                                ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cartItem.cropName,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'PHP ${cartItem.price.toStringAsFixed(2)}/${cartItem.unitOfMeasure}',
                              style: const TextStyle(color: kGreen),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Total Amount: PHP ${cartItem.totalAmount.toStringAsFixed(2)}',
                              style: const TextStyle(color: kRed),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    final updatedCartItem = Cart.update(
                                      uid: cartItem.uid,
                                      quantity: cartItem.quantity + 1,
                                      price: cartItem.price,
                                      updatedBy: authProvider.user!.uid,
                                    );

                                    cartProvider.modifyCartItemQuantity(
                                        updatedCartItem);
                                  },
                                  icon: const Icon(Icons.remove_outlined),
                                  padding: EdgeInsets.zero,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  '${cartItem.quantity}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: kRed,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                IconButton(
                                  onPressed: () {
                                    final updatedCartItem = Cart.update(
                                      uid: cartItem.uid,
                                      quantity: cartItem.quantity - 1,
                                      price: cartItem.price,
                                      updatedBy: authProvider.user!.uid,
                                    );

                                    cartProvider.modifyCartItemQuantity(
                                        updatedCartItem);
                                  },
                                  icon: const Icon(Icons.add_outlined),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          cartProvider.removeCartItem(cartItem.uid);
                        },
                        icon: const Icon(Icons.delete, color: kRed),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: Container(
        padding:
            const EdgeInsets.only(top: 20, right: 30, bottom: 15, left: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -15),
              blurRadius: 20,
              color: const Color(0xFFDADADA).withOpacity(0.75),
            )
          ],
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  final userUid = authProvider.user!.uid;

                  final orderItems = generateOrderItems(_cartItems, userUid);
                  final order = generateOrder(_cartItems, orderItems, userUid);

                  cartProvider.orderCartItems(order, orderItems);
                },
                child: const Text('Check Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Order generateOrder(
      List<Cart> cartItems, List<OrderItem> orderItems, String userUid) {
    double totalAmount = orderItems.fold<double>(
        0, (double prevLineTotal, item) => prevLineTotal + item.lineTotal);

    int totalQuantity = orderItems.fold<int>(
        0, (int prevQuantity, item) => prevQuantity + item.quantity);

    double vatableSales = orderItems.fold<double>(
        0, (double prevVatable, item) => prevVatable + item.vatable);

    double vatAmount = orderItems.fold<double>(
        0, (double prevVatAmount, item) => prevVatAmount + item.vat);

    final order = Order.create(
      totalItems: cartItems.length,
      totalQuantity: totalQuantity,
      totalAmount: totalAmount,
      amountDue: totalAmount,
      vatableSales: vatableSales,
      vatAmount: vatAmount,
      sellerUid: cartItems.first.cropBy,
      buyerUid: userUid,
      createdBy: userUid,
    );

    return order;
  }

  List<OrderItem> generateOrderItems(List<Cart> cartItems, String userUid) {
    List<OrderItem> orderItems = [];

    for (var item in cartItems) {
      final orderItem = OrderItem.create(
        cropUid: item.cropUid,
        cropName: item.cropName,
        unitOfMeasure: item.unitOfMeasure,
        price: item.price,
        quantity: item.quantity,
        vatable: item.totalAmount / 1.12,
        vat: item.totalAmount / 1.12 * .12,
        lineTotal: item.totalAmount,
        cropImageUrl: item.cropImageUrl,
        createdBy: userUid,
        cartUid: item.uid,
      );

      orderItems.add(orderItem);
    }

    return orderItems;
  }
}
