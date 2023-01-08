import 'package:agricrops/constants/app_constant.dart';
import 'package:agricrops/constants/color_constant.dart';
import 'package:agricrops/constants/global_message_constant.dart';
import 'package:agricrops/enums/order_status_enum.dart';
import 'package:agricrops/models/orders/order/order.dart';
import 'package:agricrops/providers/auth_provider.dart';
import 'package:agricrops/providers/order_provider.dart';
import 'package:agricrops/screens/order/order_item_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BuyerOrdersScreen extends StatelessWidget {
  const BuyerOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final orderProvider = context.watch<OrderProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
      ),
      body: StreamBuilder<List<Order>>(
        stream: orderProvider.getUserOrders(authProvider.user!.uid),
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
              child: Text(noAvailableOrderMessage),
            );
          }

          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final order = snapshot.data![index];

              return Card(
                elevation: kDefaultElevation,
                child: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: kDefaultPadding,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              DateFormat.yMMMMEEEEd().add_jm().format(
                                    order.createdAt!,
                                  ),
                              style: const TextStyle(
                                color: Colors.black45,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            Chip(
                              backgroundColor:
                                  setChipBackgroundColor(order.status),
                              label: Text(
                                toBeginningOfSentenceCase(order.status.name)!,
                                style: const TextStyle(color: kWhite),
                              ),
                            ),
                          ],
                        ),
                        Text.rich(
                          TextSpan(
                            text: 'Order #: ',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                text: order.uid.substring(0, 7),
                                style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total Items: ${order.totalItems}'),
                            Text('Total QTY: ${order.totalQuantity}')
                          ],
                        ),
                        const SizedBox(height: 5),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                              'Total Amount: PHP ${order.totalAmount.toStringAsFixed(2)}'),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => OrderItemListScreen(
                          orderUid: order.uid,
                          totalAmount: order.totalAmount,
                        ),
                        fullscreenDialog: true,
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  Color setChipBackgroundColor(OrderStatus status) {
    switch (status) {
      case OrderStatus.accepted:
      case OrderStatus.delivered:
        return kGreen;
      default:
        return Colors.grey;
    }
  }
}
