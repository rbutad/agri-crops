import 'package:agricrops/enums/order_item_status_enum.dart';
import 'package:agricrops/models/orders/order_item/order_item.dart';
import 'package:agricrops/providers/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CropOrderItemCounterComponent extends StatefulWidget {
  final String cropUid;

  const CropOrderItemCounterComponent({
    super.key,
    required this.cropUid,
  });

  @override
  State<CropOrderItemCounterComponent> createState() =>
      CropOrderItemCounterComponentState();
}

class CropOrderItemCounterComponentState
    extends State<CropOrderItemCounterComponent> {
  @override
  Widget build(BuildContext context) {
    final orderProvider = context.watch<OrderProvider>();

    return StreamBuilder<List<OrderItem>>(
      stream: orderProvider.getCropOrderedItems(widget.cropUid),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
          return buildOrderCounter(
            forDeliveryCount: 0,
            pendingOrderCount: 0,
          );
        }

        final pendingOrderCount = snapshot.data!
            .where((e) => e.status == OrderItemStatus.pending)
            .length;
        final forDeliveryCount = snapshot.data!
            .where((e) => e.status == OrderItemStatus.accepted)
            .length;

        return buildOrderCounter(
          pendingOrderCount: pendingOrderCount,
          forDeliveryCount: forDeliveryCount,
        );
      },
    );
  }

  Widget buildOrderCounter({
    required int pendingOrderCount,
    required int forDeliveryCount,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Pending Orders',
              style: TextStyle(fontSize: 12, color: Colors.orange[800]),
            ),
            Text(
              '$pendingOrderCount',
              style: TextStyle(fontSize: 12, color: Colors.orange[800]),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'For Delivery',
              style: TextStyle(fontSize: 12, color: Colors.green[800]),
            ),
            Text(
              '$forDeliveryCount',
              style: TextStyle(fontSize: 12, color: Colors.green[800]),
            )
          ],
        )
      ],
    );
  }
}
