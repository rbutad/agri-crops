import 'package:agricrops/constants/color_constant.dart';
import 'package:agricrops/models/crops/crop_price/crop_price.dart';
import 'package:agricrops/providers/crop_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewCropPricesComponent extends StatelessWidget {
  final String cropUid;

  const ViewCropPricesComponent({Key? key, required this.cropUid})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cropProvider = context.watch<CropProvider>();

    return StreamBuilder<List<CropPrice>>(
      stream: cropProvider.getCropPrices(cropUid),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {
          return const Center(
            child: Text('Something went wrong! Please refresh the prices.'),
          );
        }

        return ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: snapshot.data?.length,
          itemBuilder: (context, index) {
            final cropPrice = snapshot.data![index];

            return ListTile(
              leading: CircleAvatar(
                backgroundColor: kGreen,
                foregroundColor: kWhite,
                child: Text('${cropPrice.availableQty}'),
              ),
              title: Text(cropPrice.uom),
              subtitle: Text('PHP ${cropPrice.price.toStringAsFixed(2)}'),
              // trailing: IconButton(
              //   icon: const Icon(
              //     Icons.delete_forever,
              //     color: kRed,
              //   ),
              //   onPressed: () {},
              // ),
            );
          },
        );
      },
    );
  }
}
