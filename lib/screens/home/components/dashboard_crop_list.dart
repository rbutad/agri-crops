import 'dart:async';

import 'package:agricrops/constants/app_constant.dart';
import 'package:agricrops/constants/color_constant.dart';
import 'package:agricrops/models/cart/cart.dart';
import 'package:agricrops/models/crops/crop/crop.dart';
import 'package:agricrops/providers/auth_provider.dart';
import 'package:agricrops/providers/cart_provider.dart';
import 'package:agricrops/providers/crop_provider.dart';
import 'package:agricrops/screens/widgets/crop_detail_bottom_sheet.dart';
import 'package:agricrops/utilities/snackbar_utility.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardCropListComponent extends StatefulWidget {
  const DashboardCropListComponent({Key? key}) : super(key: key);

  @override
  State<DashboardCropListComponent> createState() =>
      _DashboardCropListComponentState();
}

class _DashboardCropListComponentState
    extends State<DashboardCropListComponent> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CropProvider>();
    final Size size = MediaQuery.of(context).size;

    return StreamBuilder<List<Crop>>(
      stream: provider.getAllCropsForBuyer(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
          return Container(
            alignment: Alignment.center,
            height: size.height * 0.4,
            child: const Text('There is no available Crops at the moment.'),
          );
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final crop = snapshot.data![index];

            return Card(
              elevation: kDefaultElevation,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: kDefaultPadding,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: ClipOval(
                        child: crop.imageUrl.isEmpty
                            ? Image.asset(kDefaultAssetImage,
                                fit: BoxFit.cover,
                                width: size.width,
                                height: size.height)
                            : FadeInImage.assetNetwork(
                                placeholder: kDefaultAssetImage,
                                image: crop.imageUrl,
                                fit: BoxFit.cover,
                                width: size.width,
                                height: size.height,
                              ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            crop.name,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          crop.description.isNotEmpty
                              ? Text(
                                  crop.description,
                                  textAlign: TextAlign.justify,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(color: Colors.grey[700]),
                                )
                              : Container(),
                          const SizedBox(height: 15),
                          Text(
                            'PHP ${crop.cropDefaultPrice.toStringAsFixed(2)}/${crop.cropDefaultUom}',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(color: kGreen),
                          )
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        showCropDetail(provider, crop.uid);
                      },
                      icon: const Icon(
                        Icons.add_shopping_cart_outlined,
                        color: kGreen,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future showCropDetail(CropProvider provider, String cropUid) {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      context: context,
      builder: (context) {
        return StreamBuilder<Crop>(
          stream: provider.getCropDetail(cropUid),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError) {
              return const Center(
                child: Text(
                  'Unable to load the details of the Crop',
                  textAlign: TextAlign.center,
                ),
              );
            }

            final crop = snapshot.data!;
            return Container(
              height: 500,
              padding: const EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 25,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    crop.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 20),
                  crop.description.isNotEmpty
                      ? Text(
                          crop.description,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.normal,
                                  ),
                        )
                      : Container(),
                  const SizedBox(height: 25),
                  CropDetailBottomSheet(
                    cropUid: cropUid,
                    onAddToCart: (selectedCropPrice, quantity) {
                      final cart = Cart.create(
                        cropUid: crop.uid,
                        cropName: crop.name,
                        unitOfMeasure: selectedCropPrice.uom,
                        price: selectedCropPrice.price,
                        quantity: quantity,
                        cropImageUrl: crop.imageUrl,
                        cropBy: crop.cropBy,
                        createdBy: context.read<AuthProvider>().user!.uid,
                      );

                      Provider.of<CartProvider>(context, listen: false)
                          .addToCart(cart)
                          .then((_) {
                        SnackbarUtility.showSuccessSnackBar(
                            '${crop.name} has successfully added to your cart.');
                        Navigator.pop(context);
                      });
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    ).then((value) {
      Provider.of<CartProvider>(context, listen: false).clear();
    });
  }
}
