import 'package:agricrops/constants/app_constant.dart';
import 'package:agricrops/constants/global_message_constant.dart';
import 'package:agricrops/models/orders/order/order.dart';
import 'package:agricrops/providers/auth_provider.dart';
import 'package:agricrops/providers/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class FarmerOrdersScreen extends StatelessWidget {
  const FarmerOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderProvider = context.watch<OrderProvider>();
    final authProvider = context.watch<AuthProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: StreamBuilder<List<Order>>(
        stream: orderProvider.getOrdersForFarmer(authProvider.user!.uid),
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

          return GroupedListView<Order, String>(
            shrinkWrap: true,
            elements: snapshot.data!,
            groupBy: (element) => element.status.name,
            floatingHeader: true,
            useStickyGroupSeparators: true,
            order: GroupedListOrder.DESC,
            groupComparator: (value1, value2) => value2.compareTo(value1),
            groupSeparatorBuilder: groupSeparatorBuilder,
            itemBuilder: itemBuilderWidet,
          );
        },
      ),
    );
  }

  Widget groupSeparatorBuilder(String status) {
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(
        left: 10,
        top: 20,
      ),
      child: Text(
        toBeginningOfSentenceCase(status)!,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget itemBuilderWidet(BuildContext context, Order order) {
    return Card(
      elevation: kDefaultElevation,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: kDefaultPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order Date: ${DateFormat.yMMMEd().add_jm().format(order.createdAt!)}',
              style: const TextStyle(
                color: Colors.red,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 3),
            Text.rich(
              TextSpan(
                text: 'Order #: ',
                children: [
                  TextSpan(
                    text: order.uid.substring(0, 7),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
