import 'package:agricrops/enums/order_item_status_enum.dart';
import 'package:agricrops/providers/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FarmerCropDetailWithCounter extends StatefulWidget {
  final String cropUid;
  final String cropName;

  const FarmerCropDetailWithCounter({
    super.key,
    required this.cropUid,
    required this.cropName,
  });

  @override
  State<FarmerCropDetailWithCounter> createState() =>
      _FarmerCropDetailWithCounterState();
}

class _FarmerCropDetailWithCounterState
    extends State<FarmerCropDetailWithCounter> {
  @override
  Widget build(BuildContext context) {
    final orderProvider = context.watch<OrderProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cropName),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.filter_list_outlined),
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: OrderItemStatus.pending,
                  child: Text('Pending'),
                ),
                const PopupMenuItem(
                  value: OrderItemStatus.accepted,
                  child: Text('For Delivery'),
                ),
              ];
            },
            onSelected: (value) {
              switch (value as OrderItemStatus) {
                case OrderItemStatus.pending:
                  orderProvider.setFilterForItemStatus(OrderItemStatus.pending);
                  break;
                case OrderItemStatus.accepted:
                  orderProvider.setFilterForItemStatus(OrderItemStatus.pending);
                  break;
                default:
                  debugPrint('Invalid operation');
                  break;
              }
            },
          ),
        ],
      ),
      body: Container(),
    );
  }
}
