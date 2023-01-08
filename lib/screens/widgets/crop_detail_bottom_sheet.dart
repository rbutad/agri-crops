import 'package:agricrops/constants/color_constant.dart';
import 'package:agricrops/models/crops/crop_price/crop_price.dart';
import 'package:agricrops/providers/cart_provider.dart';
import 'package:agricrops/providers/crop_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CropDetailBottomSheet extends StatelessWidget {
  final String cropUid;
  final Function(CropPrice selectedCropPrice, int quantity) onAddToCart;

  const CropDetailBottomSheet({
    Key? key,
    required this.cropUid,
    required this.onAddToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cropProvider = context.watch<CropProvider>();
    final cartProvider = context.watch<CartProvider>();

    return StreamBuilder<List<CropPrice>>(
      stream: cropProvider.getCropPrices(cropUid),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('No available prices'),
          );
        }

        final prices = snapshot.data!;
        final defaultPrice = prices.firstWhere((crop) => crop.isDefaultPrice);
        return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Unit of Measure',
                style: TextStyle(color: kRed),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: DropdownButton<CropPrice>(
                  isExpanded: true,
                  value: cartProvider.selectedCropPrice ?? defaultPrice,
                  items: prices
                      .map((cropPrice) => DropdownMenuItem(
                            value: cropPrice,
                            child: Text(cropPrice.uom),
                          ))
                      .toList(),
                  onChanged: (value) {
                    cartProvider.setSelectedCropPrice(value!);
                  },
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  const Text('Price', style: TextStyle(color: kRed)),
                  const SizedBox(height: 5),
                  Text(
                      'PHP ${cartProvider.selectedCropPrice == null ? defaultPrice.price.toStringAsFixed(2) : cartProvider.selectedCropPrice!.price.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.titleMedium)
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Quantity',
                        style: TextStyle(color: kRed),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () => cartProvider.reduceQuantity(
                                cartProvider.selectedCropPrice == null
                                    ? defaultPrice.price
                                    : cartProvider.selectedCropPrice!.price),
                            icon: const Icon(Icons.remove),
                          ),
                          const SizedBox(width: 10),
                          Text('${cartProvider.quantity}'),
                          const SizedBox(width: 10),
                          IconButton(
                            onPressed: () => cartProvider.addQuantity(
                                cartProvider.selectedCropPrice == null
                                    ? defaultPrice.price
                                    : cartProvider.selectedCropPrice!.price),
                            icon: const Icon(Icons.add),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Total Price',
                        style: TextStyle(color: kRed),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'PHP ${cartProvider.selectedCropPrice == null ? (defaultPrice.price * cartProvider.quantity).toStringAsFixed(2) : cartProvider.totalAmount.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.titleLarge,
                      )
                    ],
                  ),
                ],
              ),
              Align(
                alignment: Alignment.center,
                child: TextButton.icon(
                  onPressed: () {
                    final cropPrice =
                        cartProvider.selectedCropPrice ?? defaultPrice;
                    onAddToCart(cropPrice, cartProvider.quantity);
                  },
                  icon: const Icon(Icons.add_shopping_cart_outlined),
                  label: const Text(
                    'Add to Cart',
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
