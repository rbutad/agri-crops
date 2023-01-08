import 'dart:async';

import 'package:agricrops/constants/app_constant.dart';
import 'package:agricrops/constants/color_constant.dart';
import 'package:agricrops/constants/global_message_constant.dart';
import 'package:agricrops/enums/operation_state_enum.dart';
import 'package:agricrops/models/crops/crop/crop.dart';
import 'package:agricrops/providers/auth_provider.dart';
import 'package:agricrops/providers/crop_provider.dart';
import 'package:agricrops/screens/crop/crop_detail/crop.dart';
import 'package:agricrops/utilities/snackbar_utility.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CropListScreen extends StatefulWidget {
  const CropListScreen({Key? key}) : super(key: key);

  @override
  State<CropListScreen> createState() => _CropListScreenState();
}

class _CropListScreenState extends State<CropListScreen> {
  @override
  Widget build(BuildContext context) {
    final cropProvider = context.watch<CropProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Crops'),
        backgroundColor: kGreen,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const CropScreen(),
                fullscreenDialog: true,
              ),
            ),
          ),
        ],
      ),
      body: StreamBuilder<List<Crop>>(
        stream: cropProvider.getCrops(context.read<AuthProvider>().user!.uid),
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

          return RefreshIndicator(
            onRefresh: () => Future(_refresh),
            child: ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final crop = snapshot.data![index];

                return Card(
                  elevation: kDefaultElevation,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: ClipOval(
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
                    title: Text(crop.name),
                    subtitle: Text(
                      crop.description,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: PopupMenuButton(
                      padding: EdgeInsets.zero,
                      itemBuilder: (context) {
                        return [
                          const PopupMenuItem(
                            value: OperationState.view,
                            child: Text('View Details'),
                          ),
                          // PopupMenuItem(
                          //   value: OperationState.edit,
                          //   child: const Text('Edit'),
                          //   onTap: () {
                          //     debugPrint('Edit');
                          //   },
                          // ),
                          const PopupMenuItem(
                            value: OperationState.remove,
                            child: Text(
                              'Remove',
                              style: TextStyle(color: kRed),
                            ),
                          ),
                        ];
                      },
                      onSelected: (value) {
                        switch (value as OperationState) {
                          case OperationState.view:
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => CropScreen(
                                  operationState: OperationState.view,
                                  cropUid: crop.uid,
                                ),
                                fullscreenDialog: true,
                              ),
                            );
                            break;
                          case OperationState.remove:
                            _showDeleteConfirmationDialog().then((confirmed) {
                              if (confirmed!) {
                                final cropUid = crop.uid;
                                cropProvider.deleteCrop(cropUid).then(
                                      (_) => SnackbarUtility.showSuccessSnackBar(
                                          'Crop \'$cropUid\' has successfully deleted'),
                                    );
                              }
                            });

                            break;
                          default:
                            debugPrint('Invalid operation');
                            break;
                        }
                      },
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  FutureOr<void> _refresh() {
    setState(() {});
  }

  Future<bool?> _showDeleteConfirmationDialog() {
    return showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Crop?'),
        content:
            const Text('Are you sure you want to delete the selected crop?'),
        actions: [
          TextButton(
            child: const Text(
              'Yes',
              style: TextStyle(color: kGreen),
            ),
            onPressed: () => Navigator.pop(context, true),
          ),
          TextButton(
            child: const Text(
              'Cancel',
              style: TextStyle(color: kRed),
            ),
            onPressed: () => Navigator.pop(context, false),
          )
        ],
      ),
    );
  }
}
