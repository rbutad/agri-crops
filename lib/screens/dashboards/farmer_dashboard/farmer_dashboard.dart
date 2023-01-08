import 'package:agricrops/constants/app_constant.dart';
import 'package:agricrops/constants/global_message_constant.dart';
import 'package:agricrops/models/crops/crop/crop.dart';
import 'package:agricrops/providers/crop_provider.dart';
import 'package:agricrops/screens/dashboards/farmer_dashboard/components/crop_order_item_counter_component.dart';
import 'package:agricrops/screens/dashboards/farmer_dashboard/components/farmer_crop_detail_with_counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FarmerDashboard extends StatefulWidget {
  final String userUid;

  const FarmerDashboard({
    super.key,
    required this.userUid,
  });

  @override
  State<FarmerDashboard> createState() => _FarmerDashboardState();
}

class _FarmerDashboardState extends State<FarmerDashboard> {
  @override
  Widget build(BuildContext context) {
    final cropProvider = context.watch<CropProvider>();

    return StreamBuilder<List<Crop>>(
      stream: cropProvider.getCrops(widget.userUid),
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
            child: Text(noCropAvailableMessage),
          );
        }

        return ListView(
          children: [
            GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 0.9,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.all(5),
              children: buildCrops(snapshot.data!),
            )
          ],
        );
      },
    );
  }

  List<Widget> buildCrops(List<Crop> crops) {
    final size = MediaQuery.of(context).size;

    return crops
        .map(
          (crop) => Card(
            elevation: kDefaultElevation,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => FarmerCropDetailWithCounter(
                      cropUid: crop.uid,
                      cropName: crop.name,
                    ),
                    fullscreenDialog: true,
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * .16,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(4),
                      ),
                      child: crop.imageUrl.isEmpty
                          ? Image.asset(
                              kDefaultAssetImage,
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                            )
                          : FadeInImage.assetNetwork(
                              placeholder: kDefaultAssetImage,
                              image: crop.imageUrl,
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                            ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          crop.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 5),
                        CropOrderItemCounterComponent(cropUid: crop.uid)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
        .toList();
  }
}
