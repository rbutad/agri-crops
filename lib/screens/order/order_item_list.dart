import 'package:agricrops/constants/app_constant.dart';
import 'package:agricrops/constants/color_constant.dart';
import 'package:agricrops/constants/global_message_constant.dart';
import 'package:agricrops/helpers/format.dart';
import 'package:agricrops/models/orders/order_item/order_item.dart';
import 'package:agricrops/providers/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderItemListScreen extends StatelessWidget {
  final String orderUid;
  final double totalAmount;

  const OrderItemListScreen({
    Key? key,
    required this.orderUid,
    required this.totalAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final orderProvider = context.watch<OrderProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ordered Items'),
      ),
      body: StreamBuilder<List<OrderItem>>(
        stream: orderProvider.getOrderItems(orderUid),
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
              child: Text(noAvailableOrderedItemsMessage),
            );
          }

          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final item = snapshot.data![index];

              return Card(
                elevation: kDefaultElevation,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: kDefaultPadding,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: ClipOval(
                          child: item.cropImageUrl.isEmpty
                              ? Image.asset(
                                  kDefaultAssetImage,
                                  fit: BoxFit.cover,
                                  width: size.width,
                                  height: size.height,
                                )
                              : FadeInImage.assetNetwork(
                                  placeholder: kDefaultAssetImage,
                                  image: item.cropImageUrl,
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
                              item.cropName,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            Text.rich(
                              TextSpan(
                                text: '${item.quantity}x',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: kRed,
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        '  PHP ${item.price.toStringAsFixed(2)}/${item.unitOfMeasure}',
                                    style: const TextStyle(
                                      color: Colors.black45,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
        padding: const EdgeInsets.only(
          top: 20,
          right: 30,
          bottom: 15,
          left: 30,
        ),
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
            children: [
              Text.rich(
                TextSpan(
                  text: 'Total Amount\n',
                  style: const TextStyle(
                    fontSize: 12,
                    color: kRed,
                  ),
                  children: [
                    TextSpan(
                      text: Format.currency(number: totalAmount),
                      style: const TextStyle(
                        fontSize: 18,
                        color: kBlack,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
