import 'package:agricrops/constants/app_constant.dart';
import 'package:agricrops/constants/global_message_constant.dart';
import 'package:agricrops/models/crops/crop/crop.dart';
import 'package:agricrops/providers/crop_provider.dart';
import 'package:agricrops/screens/crop/crop_detail/components/view_crop_prices.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewCropComponent extends StatelessWidget {
  final String cropUid;
  const ViewCropComponent({Key? key, required this.cropUid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cropProvider = context.watch<CropProvider>();
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: StreamBuilder<Crop>(
        stream: cropProvider.getCropDetail(cropUid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text(snapshotDetailHasError),
            );
          }

          final crop = snapshot.data as Crop;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              crop.imageUrl.isEmpty
                  ? Image.asset(
                      kDefaultAssetImage,
                      fit: BoxFit.cover,
                      width: size.width,
                      height: size.height * 0.35,
                    )
                  : FadeInImage.assetNetwork(
                      placeholder: kDefaultAssetImage,
                      image: crop.imageUrl,
                      fit: BoxFit.cover,
                      width: size.width,
                      height: size.height * 0.35,
                    ),
              Container(
                padding: const EdgeInsets.only(
                  top: 40.0,
                  right: 20.0,
                  left: 20.0,
                ),
                child: Text(
                  crop.name,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              const SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.only(
                  right: 20.0,
                  left: 20.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      crop.description.isEmpty
                          ? '- No description available -'
                          : crop.description,
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Text(
                  'Prices',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 5.0),
              ViewCropPricesComponent(cropUid: crop.uid)
            ],
          );
        },
      ),
    );
  }
}
